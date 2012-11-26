Imports modelCLS
Imports System.Net.Mail
Imports System.Net
Imports System.Net.Mail.SmtpClient
Partial Class Page_Autre_inscription_paiement
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

        'Afficher infos du client
        Dim aCookie As HttpCookie = Request.Cookies("inscription")
        txtNom.Text = aCookie.Values("prenom") & " " & aCookie.Values("nom")
        
    End Sub

#Region "RegEx sur changement de type de carte"
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

#Region "Événement sur bouton Paiement Paypal"
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
                Dim entClient As New modelCLSContainer
                Dim unClient As MembresJeu = Nothing
                Dim aCookie As HttpCookie = Request.Cookies("inscription")
                unClient = MembresJeu.CreateMembresJeu(0, aCookie.Values("nom"), aCookie.Values("prenom"), aCookie.Values("telephone"), aCookie.Values("motDePasse"), aCookie.Values("adresse"), aCookie.Values("ville"), aCookie.Values("dateInscription"), aCookie.Values("dateNaissance"), aCookie.Values("courriel"), aCookie.Values("codePostal"), aCookie.Values("idFamille"), aCookie.Values("sexe"), 3)
                entClient.MembresJeu.AddObject(unClient)
                entClient.SaveChanges()

                'Création de l'email personnalisé
                Dim mm As MailMessage = New MailMessage()
                mm.From = New MailAddress("samuel.bellerose@me.com")
                mm.Subject = "Bienvenu chez CLS inc."
                mm.Body = "<p>Toute l'équipe de CLS inc. vous souhaite la bienvenue " & aCookie.Values("prenom") & " " & aCookie.Values("nom") & " !</p>"
                mm.IsBodyHtml = True
                mm.To.Add(New MailAddress(aCookie.Values("courriel")))


                'Envoie de l'email personnalisé grâce à un compte GMAIL
                Dim smtp As SmtpClient = New SmtpClient
                smtp.Host = "smtp.gmail.com"
                smtp.EnableSsl = True
                Dim NetworkCred As NetworkCredential = New System.Net.NetworkCredential()
                NetworkCred.UserName = "samuel.bellerose1991@gmail.com"
                NetworkCred.Password = "imten100"
                smtp.UseDefaultCredentials = True
                smtp.Credentials = NetworkCred
                smtp.Port = 587
                smtp.Send(mm)
                Response.Redirect("~/Page/Autre/paiment_success.aspx")
            Else

                'Dim strErr As String = "Error: " & htResponse("L_LONGMESSAGE0").ToString()
                'Dim strErrcode As String = "Error code: " & htResponse("L_ERRORCODE0").ToString()

                'Response.Write(strErr & "&lt;br /&gt;" & strErrcode)</span>
                For Each i In htResponse
                    Response.Write(i.Key & ": " & i.Value & "<br />")
                Next
                Response.Redirect("~/Page/Autre/paiment_failure.aspx")
            End If
        Catch

            ' FAITES QQCHOSE
        End Try
    End Sub
#End Region

End Class
