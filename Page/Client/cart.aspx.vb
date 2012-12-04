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
        Dim cookie As HttpCookie = Request.Cookies("panier")
        Dim noPanier As Integer = cookie.Values("idPanier")
        Dim utilisateur As Integer = (From A In entPanier.ItemPanierJeu Where (A.Panier_idCommande = noPanier) Select A).Count

        total += itemCourant.GroupeJeu.CoursJeu.tarif.ToString
        FindChildControl(Of Label)(lvPanier, "lblSousTotalPanier").Text = total & ",00"
        Session("montantCart") = total
    End Sub
End Class
