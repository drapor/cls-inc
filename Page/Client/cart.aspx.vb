Imports modelCLS
Partial Class Page_Autre_cart
    Inherits masterPage



    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim cookie As HttpCookie = Request.Cookies("panier")
        dsPanier.WhereParameters("idPanier").DefaultValue = cookie.Values("idPanier")
    End Sub

    Protected Sub lvPanier_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvPanier.ItemDataBound
        Dim itemCourant As ItemPanierJeu = e.Item.DataItem
        Dim entPanier As New modelCLSContainer
        Static Dim total As New Double
        Static Dim totalRabais As New Double
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
        FindChildControl(Of Label)(lvPanier, "lblRabaisPanier").Text = "-" & totalRabais & "0"
        FindChildControl(Of Label)(lvPanier, "lblSousTotalPanier").Text = total & ",00"
        Dim totalAvantTaxe As Label = FindChildControl(Of Label)(lvPanier, "lblGrandTotalPanier")
        totalAvantTaxe.Text = total - totalRabais & "0"

        Dim tps As Double = 1.05
        Dim totalTPS As Label = FindChildControl(Of Label)(lvPanier, "lblTPSMontant")
        totalTPS.Text = totalAvantTaxe.Text * tps

        Dim tvq As Double = 1.095
        Dim totalTVQ As Label = FindChildControl(Of Label)(lvPanier, "lblTVQMontant")
        totalTVQ.Text = totalTPS.Text * tvq

        Dim grandTotalFinal As Label = FindChildControl(Of Label)(lvPanier, "lblMontantFinal")
        grandTotalFinal.Text = totalTVQ.Text
        Session("montantCart") = total

    End Sub
End Class
