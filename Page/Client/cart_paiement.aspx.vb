Imports modelCLS
Partial Class Page_Client_cart_paiement
    Inherits masterPage

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
        'If doTransaction(txtNumero.Text,
        '      ddlType.SelectedItem.Text,
        '      ddlMois.SelectedValue.ToString & ddlAnnee.SelectedValue.ToString,
        '      txtCvv.Text,
        '      montantTotal,
        '      leMembre.prenomMembre,
        '      leMembre.nomMembre,
        '      leMembre.adresse,
        '      leMembre.ville,
        '      "Quebec",
        '      leMembre.codePostal) Then

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


        Response.Redirect("~/Page/Client/member_paiement_success.aspx")
        'Else
        Response.Redirect("~/Page/Client/member_paiement_failure.aspx")
        'End If

    End Sub
#End Region

End Class
