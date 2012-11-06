
Partial Class Page_Autre_description
    Inherits masterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim cours As Integer = Session("idCours")
        dsCours.WhereParameters("cours").DefaultValue = cours
        dsGroupes.WhereParameters("coursID").DefaultValue = cours
        dsMembreFamille.WhereParameters("familleID").DefaultValue = Session("idFamille")

        Dim categorie As String = Request.QueryString("categorie")
        If categorie = "Sport" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/sports_banner.png"
        ElseIf categorie = "Loisir" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/loisir_banner.png"
        ElseIf categorie = "Culture" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/culture_banner.png"
        End If
        lblNomCours.Text = FindChildControl(Of HiddenField)(lvCours, "hiddenNomCours").Value.ToString

    End Sub

    'Protected Sub lvCours_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvCours.ItemCommand

    '    Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
    '    Dim idCours As Integer = lvCours.DataKeys(dataItem.DisplayIndex).Value.ToString()

    '    If e.CommandName = "selection" Then

    '    End If

    'End Sub
    Sub retourCategorie(sender As Object, e As EventArgs)
        Dim categorie As String = Request.QueryString("categorie")
        Dim url As String
        url = "../Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub
End Class
