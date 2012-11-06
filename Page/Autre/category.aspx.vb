
Partial Class Page_Autre_category
    Inherits System.Web.UI.Page
    Dim cours As String
    Dim url As String
    Dim categorie As String


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim categorie As String = Request.QueryString("categorie")
        dsCategorie.WhereParameters("categorie").DefaultValue = categorie
        lblCategorie.Text = categorie
        If categorie = "Sport" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/sports_banner.png"
        ElseIf categorie = "Loisir" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/loisir_banner.png"
        ElseIf categorie = "Culture" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/culture_banner.png"
        End If

    End Sub


    Protected Sub lvCours_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvCours.ItemCommand
        Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
        Dim idCours As Integer = lvCours.DataKeys(dataItem.DisplayIndex).Value.ToString()
        Session("idCours") = idCours
        categorie = Request.QueryString("categorie")
        If e.CommandName = "selection" Then
            cours = idCours
            If User.Identity.IsAuthenticated = False Then
                url = "../Autre/description.aspx?categorie=" & categorie
                Response.Redirect(url)
            Else
                url = "../Client/member_description.aspx?categorie=" & categorie
                Response.Redirect(url)
            End If
        End If
    End Sub
End Class
