Imports modelCLS
Imports System.Net.Mail
Imports System.Net
Imports System.Net.Mail.SmtpClient
Imports System.Data
Partial Class Page_Client_cart_paiement
    Inherits masterPage

    Dim NoTransacrion As String = Nothing
    Private Shared leContext As modelCLSContainer = Nothing
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'Affichage du panier
        leContext = New modelCLSContainer
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
        lblMontantFacture.Text = Session("montantCart").ToString
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
        Dim montantTotalLabel As Label = lblMontantFacture
        Dim montantTotal As String = montantTotalLabel.Text
        Dim courrielMembre As String = HttpContext.Current.User.Identity.Name.ToString
        Dim leMembre As MembresJeu = (From A In leContext.MembresJeu Where (A.courriel = courrielMembre) Select A).FirstOrDefault
        If doTransactionPerso(txtNumero.Text,
              ddlType.SelectedItem.Text,
              ddlMois.SelectedValue.ToString & ddlAnnee.SelectedValue.ToString,
              txtCvv.Text,
              montantTotal,
              leMembre.prenomMembre,
              leMembre.nomMembre,
              leMembre.adresse,
              leMembre.ville,
              "Quebec",
              leMembre.codePostal) Then

            Dim aCookie As HttpCookie = Request.Cookies("panier")
            Dim noPanier As Integer = aCookie.Values("idPanier")

            Dim unMembreCommande As ItemPanierJeu = (From A In leContext.ItemPanierJeu Where (A.Panier_idCommande = noPanier) Select A).FirstOrDefault

            While unMembreCommande IsNot Nothing
                Dim entAbonnement As New modelCLSContainer
                Dim unAbonnement As AbonnementJeu = Nothing
                unAbonnement = AbonnementJeu.CreateAbonnementJeu(System.DateTime.Now.ToShortDateString, 0, unMembreCommande.MembresJeu_idMembre, unMembreCommande.GroupeJeu_idGroupe)
                entAbonnement.AbonnementJeu.AddObject(unAbonnement)
                entAbonnement.SaveChanges()
                leContext.DeleteObject(unMembreCommande)
                leContext.SaveChanges()
                unMembreCommande = (From A In leContext.ItemPanierJeu Where (A.Panier_idCommande = noPanier) Select A).FirstOrDefault
            End While

            Dim message As String = Session("message")

            message += "<p>Votre numéro de transaction est: " & NoTransacrion & "</p>"

            'Création de l'email personnalisé
            Dim mm As MailMessage = New MailMessage()
            mm.From = New MailAddress("samuel.bellerose@me.com")
            mm.Subject = "Avis de réception de votre paiement chez CLS inc."
            mm.Body = message
            mm.IsBodyHtml = True
            mm.To.Add(New MailAddress(HttpContext.Current.User.Identity.Name))

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

            Response.Redirect("~/Page/Client/member_paiement_success.aspx")
        Else
            Response.Redirect("~/Page/Client/member_paiement_failure.aspx")
        End If

    End Sub
#End Region

#Region "Paiment personnalisé"
    Protected Function doTransactionPerso(ByVal ccNumber As String,
                               ByVal ccType As String,
                               ByVal expireDate As String,
                               ByVal cvvNum As String,
                               ByVal amount As String,
                               ByVal firstName As String,
                               ByVal lastName As String,
                               ByVal street As String,
                               ByVal city As String,
                               ByVal state As String,
                               ByVal zip As String) As Boolean

        'API INFORMATIONS (3)
        Dim success As Boolean = False
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
                NoTransacrion = strTransactionID
                For Each i In htResponse
                    Response.Write(i.Key & ": " & i.Value & "<br />")
                Next

                success = True
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
        Return success
        'Response.Redirect("../Client/home_member.aspx")
    End Function
#End Region


End Class
