Imports modelCLS
Partial Class Page_Autre_cart
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing
    Dim total As New Double
    Dim totalRabais As New Double
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        total = 0
        totalRabais = 0
        leContext = New modelCLSContainer
        Dim cookie As HttpCookie = Request.Cookies("panier")
        dsPanier.WhereParameters("idPanier").DefaultValue = cookie.Values("idPanier")
    End Sub

    Protected Sub lvPanier_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvPanier.ItemDataBound
        Dim itemCourant As ItemPanierJeu = e.Item.DataItem
        Dim entPanier As New modelCLSContainer
        
        Dim cookie As HttpCookie = Request.Cookies("panier")
        Dim noPanier As Integer = cookie.Values("idPanier")
        Dim utilisateur As Integer = (From A In entPanier.ItemPanierJeu Where (A.Panier_idCommande = noPanier) Select A).Count
        Dim lesRabais As TarifsJeu = (From A In entPanier.TarifsJeu Select A).FirstOrDefault

        Dim lblRabais As Label = FindChildControl(Of Label)(e.Item, "lblRabaisApply")
        Dim prixItem As Label = FindChildControl(Of Label)(e.Item, "lblPrix")

        If e.Item.DisplayIndex = 0 Then
            Dim pourcentageRabais As Double = 1 - (lesRabais.rabais1Enfant / 100)
            Dim prixInitial As Double = prixItem.Text
            Dim rabais1 As Double = prixInitial - (prixInitial * pourcentageRabais)
            lblRabais.Text = lesRabais.rabais1Enfant.ToString & "%" & " (-" & rabais1 & "0$ )"
            totalRabais += rabais1
        ElseIf e.Item.DisplayIndex = 1 Then
            Dim pourcentageRabais As Double = 1 - (lesRabais.rabais2Enfant / 100)
            Dim prixInitial As Double = prixItem.Text
            Dim rabais1 As Double = prixInitial - (prixInitial * pourcentageRabais)
            lblRabais.Text = lesRabais.rabais2Enfant.ToString & "%" & " (-" & rabais1 & "0$ )"
            totalRabais += rabais1
        Else
            Dim pourcentageRabais As Double = 1 - (lesRabais.rabais3Enfant / 100)
            Dim prixInitial As Double = prixItem.Text
            Dim rabais1 As Double = prixInitial - (prixInitial * pourcentageRabais)
            lblRabais.Text = lesRabais.rabais3Enfant.ToString & "%" & " (-" & rabais1 & "0$ )"
            totalRabais += rabais1
        End If

        total += itemCourant.GroupeJeu.CoursJeu.tarif.ToString
        FindChildControl(Of Label)(lvPanier, "lblRabaisPanier").Text = "-" & totalRabais
        FindChildControl(Of Label)(lvPanier, "lblSousTotalPanier").Text = total & ",00"
        Dim totalAvantTaxe As Label = FindChildControl(Of Label)(lvPanier, "lblGrandTotalPanier")
        totalAvantTaxe.Text = total - totalRabais

        Dim tps As Double = 0.05
        Dim totalTPS As Label = FindChildControl(Of Label)(lvPanier, "lblTPSMontant")
        totalTPS.Text = totalAvantTaxe.Text * tps
        Dim tpsTotal As Double = totalTPS.Text
        totalTPS.Text = Math.Round(tpsTotal, 2)

        Dim tvq As Double = 0.095
        Dim totalTVQ As Label = FindChildControl(Of Label)(lvPanier, "lblTVQMontant")
        totalTVQ.Text = (totalAvantTaxe.Text + tpsTotal) * tvq
        Dim tvqTotal As Double = totalTVQ.Text
        totalTVQ.Text = Math.Round(tvqTotal, 2)

        Dim grandTotalFinal As Label = FindChildControl(Of Label)(lvPanier, "lblMontantFinal")
        Dim grandTotal As Double = totalAvantTaxe.Text + tpsTotal + tvqTotal
        grandTotalFinal.Text = Math.Round(grandTotal, 2)
        Session("montantCart") = grandTotalFinal.Text
    End Sub

    'Création de l'email de la facture des inscriptions plus redirection vers la page de paiement
    Sub confirmationPaiement(sender As Object, e As EventArgs)
        Dim courrielMembre As String = HttpContext.Current.User.Identity.Name.ToString
        Dim membrePrincipal As MembresJeu = (From A In leContext.MembresJeu Where (A.courriel = courrielMembre) Select A).FirstOrDefault

        Dim message As String = "<p>Bonjour " & membrePrincipal.prenomMembre & " " & membrePrincipal.nomMembre & "!  </p><br /><br />" &
            "<p>Ce message est pour confirmer votre paiement des membres suivants: </p><br /><br />"
        Dim montantTotal As String = FindChildControl(Of Label)(lvPanier, "lblMontantFinal").Text

        For Each item In lvPanier.Items
            Dim prenom As String = FindChildControl(Of Label)(item, "lblAbonnePrenom").Text
            Dim nom As String = FindChildControl(Of Label)(item, "lblAbonneNom").Text
            Dim groupe As String = FindChildControl(Of Label)(item, "lblGroupe").Text

            message += "<p>" & prenom & " " & nom & " est maintenant inscrit dans le groupe " & groupe & "</p><br />"
        Next

        message += "<p>Le montant total de votre facture s'élève à " & montantTotal & "$ </p>"
        Session("message") = message
        Response.Redirect("~/Page/Client/cart_paiement.aspx")
    End Sub
End Class
