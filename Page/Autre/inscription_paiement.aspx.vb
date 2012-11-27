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
        If doTransaction(txtNumero.Text,
              ddlType.SelectedItem.Text,
              ddlMois.SelectedValue.ToString & ddlAnnee.SelectedValue.ToString,
              txtCvv.Text,
              montantTotal,
              aCookie.Values("prenom"),
              aCookie.Values("nom"),
              aCookie.Values("adresse"),
              aCookie.Values("ville"),
              "Quebec",
              aCookie.Values("codePostal")) Then

            Dim entClient As New modelCLSContainer
            Dim unClient As MembresJeu = Nothing
            Dim aCookie2 As HttpCookie = Request.Cookies("inscription")
            unClient = MembresJeu.CreateMembresJeu(0, aCookie2.Values("nom"), aCookie2.Values("prenom"), aCookie2.Values("telephone"), aCookie2.Values("motDePasse"), aCookie2.Values("adresse"), aCookie2.Values("ville"), aCookie2.Values("dateInscription"), aCookie2.Values("dateNaissance"), aCookie2.Values("courriel"), aCookie2.Values("codePostal"), aCookie2.Values("idFamille"), aCookie2.Values("sexe"), 3)
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
            Response.Redirect("~/Page/Autre/paiment_failure.aspx")
        End If
    End Sub
#End Region



End Class
