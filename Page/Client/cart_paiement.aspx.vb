﻿
Partial Class Page_Client_cart_paiement
    Inherits masterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'Affichage du panier
        Dim counter As Integer
        Dim annee As Integer = Date.Now.ToString("yyyy")
        For counter = 0 To 10 Step 1
            ddlAnnee.Items.Insert(counter, annee)
            annee += 1
        Next

        'Initialisation regEx du numéro de la carte de crédit
        If ddlType.SelectedIndex = 0 Then
            regExVisa.Enabled = True
        Else
            regExVisa.Enabled = False
        End If

    End Sub

#Region "Gestion des RegEx lors d'un changement de type de carte"
    Sub regExCarteVerification(sender As Object, e As EventArgs)
        If ddlType.SelectedIndex = 1 Then
            regExMasterCard.Enabled = True
            regExAmericanExpress.Enabled = False
        ElseIf ddlType.SelectedIndex = 2 Then
            regExAmericanExpress.Enabled = True
            regExMasterCard.Enabled = False
        Else
            regExAmericanExpress.Enabled = False
            regExMasterCard.Enabled = False
        End If
    End Sub
#End Region

#Region "Événement sur le bouton Paiement Paypal"
    Sub paiementPaypal(sender As Object, e As EventArgs)
        Dim aCookie As HttpCookie = Request.Cookies("inscription")
        Dim montantTotalLabel As Label = FindChildControl(Of Label)(lvMontantPaiement, "lblMontantInscription")
        Dim montantTotal As String = montantTotalLabel.Text
        doTransaction(txtNumero.Text,
              ddlType.SelectedItem.Text,
              ddlMois.SelectedValue.ToString & ddlAnnee.SelectedValue.ToString,
              txtCvv.Text,
              montantTotal,
              aCookie.Values("prenom"),
              aCookie.Values("nom"),
              aCookie.Values("adresse"),
              aCookie.Values("ville"),
              "Quebec",
              aCookie.Values("codePostal"))

    End Sub
#End Region

#Region "Fonction doTransaction"
    Protected Sub doTransaction(ByVal ccNumber As String,
                               ByVal ccType As String,
                               ByVal expireDate As String,
                               ByVal cvvNum As String,
                               ByVal amount As String,
                               ByVal firstName As String,
                               ByVal lastName As String,
                               ByVal street As String,
                               ByVal city As String,
                               ByVal state As String,
                               ByVal zip As String)

        'API INFORMATIONS (3)
        Dim strUsername As String = "samuel_1353565849_biz_api1.me.com"
        Dim strPassword As String = "1353565911"
        Dim strSignature As String = "A41QhzrbqBn6pOl2H3rweWy3qz21AYRSXbIdf0e1BgINwDCdGzr9WM1a"
        Dim strCredentials As String = "USER=" & strUsername & "&PWD=" & strPassword & "&SIGNATURE=" & strSignature
        Dim strNVPSandboxServer As String = "https://api-3t.sandbox.paypal.com/nvp"
        Dim strAPIVersion As String = "2.3"

        'credit card types: Visa, MasterCard, Discover, Amex
        Dim strNVP = strCredentials & "&METHOD=DoDirectPayment" & _
           "&CREDITCARDTYPE=" & ccType & _
           "&ACCT=" & ccNumber & _
           "&EXPDATE=" & expireDate & _
           "&CVV2=" & cvvNum & _
           "&AMT=" & amount & _
           "&CUSTOM=1234" & _
           "&CURRENCYCODE=CAD" & _
           "&FIRSTNAME=" & firstName & _
           "&LASTNAME=" & lastName & _
           "&STREET=" & street & _
           "&CITY=" & city & _
           "&STATE=" & state & _
           "&ZIP=" & zip & _
           "&COUNTRYCODE=CA" & _
           "&PAYMENTACTION=Sale" & _
           "&VERSION=" & strAPIVersion
        Try
            'Cree la requête
            Dim wrWebRequest As System.Net.HttpWebRequest = DirectCast(System.Net.WebRequest.Create(strNVPSandboxServer), System.Net.HttpWebRequest)
            wrWebRequest.Method = "POST"
            Dim requestWriter As New System.IO.StreamWriter(wrWebRequest.GetRequestStream())
            requestWriter.Write(strNVP)
            requestWriter.Close()
            'Obtient la réponse
            Dim hwrWebResponse As System.Net.HttpWebResponse = DirectCast(wrWebRequest.GetResponse(), System.Net.HttpWebResponse)
            Dim responseReader As New System.IO.StreamReader(wrWebRequest.GetResponse().GetResponseStream())
            ' Lit la réponse
            Dim dataReturned As String = responseReader.ReadToEnd()
            responseReader.Close()
            Dim result As String = Server.UrlDecode(dataReturned)
            Dim arrResult As String() = result.Split("&"c)
            Dim htResponse As New Hashtable()
            Dim arrayReturned As String()
            For Each item As String In arrResult
                arrayReturned = item.Split("="c)
                htResponse.Add(arrayReturned(0), arrayReturned(1))
            Next

            Dim strAck As String = htResponse("ACK").ToString()
            'AFFICHE LA RÉPONSE

            If strAck = "Success" OrElse
                strAck = "SuccessWithWarning" Then
                Dim strAmt As String = htResponse("AMT").ToString()
                Dim strCcy As String = htResponse("CURRENCYCODE").ToString()
                Dim strTransactionID As String = htResponse("TRANSACTIONID").ToString()
                For Each i In htResponse
                    Response.Write(i.Key & ": " & i.Value & "<br />")
                Next
                'Dim strSuccess As String = "Merci pour votre commande de : $" & strAmt & " " & strCcy & ", celle-ci a bien été traitée."
                'successLabel.Text = strSuccess
            Else

                'Dim strErr As String = "Error: " & htResponse("L_LONGMESSAGE0").ToString()
                'Dim strErrcode As String = "Error code: " & htResponse("L_ERRORCODE0").ToString()

                'Response.Write(strErr & "&lt;br /&gt;" & strErrcode)</span>
                For Each i In htResponse
                    Response.Write(i.Key & ": " & i.Value & "<br />")
                Next

            End If
        Catch

            ' FAITES QQCHOSE
        End Try
        'Response.Redirect("../Client/home_member.aspx")
    End Sub
#End Region

End Class
