
Partial Class Page_Autre_category
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim categorie As String = Request.QueryString("categorie")
        dsCategorie.WhereParameters("categorie").DefaultValue = categorie
        lblCategorie.Text = categorie
    End Sub


End Class
