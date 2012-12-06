Imports modelCLS
Imports masterPage
Partial Class Page_Autre_search
    Inherits System.Web.UI.Page

    Dim entClient As modelCLSContainer = New modelCLSContainer
    Dim url As String = Nothing
    Dim idFamille As Integer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim resultat As String = Request.QueryString("searchResult")
        dsCours.WhereParameters("leTexte").DefaultValue = resultat
    End Sub


    Protected Sub lvSearch_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvSearch.ItemCommand
        Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
        Dim idCours As Integer = lvSearch.DataKeys(dataItem.DisplayIndex).Value.ToString()
        Session("idCours") = idCours
        Dim leCours As CoursJeu = (From A In entClient.CoursJeu Where (A.idCours = idCours) Select A).FirstOrDefault
        Dim categorie = leCours.categorie
        If e.CommandName = "selection" Then
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
