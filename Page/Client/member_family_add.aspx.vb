Imports modelCLS
Partial Class Page_Autre_register
    Inherits System.Web.UI.Page

    Protected Sub lvMembreFamille_ItemInserted(sender As Object, e As System.Web.UI.WebControls.ListViewInsertedEventArgs) Handles lvMembreFamille.ItemInserted
        Dim url As String
        url = "../Client/home_member.aspx?idMembre=" & Session("membrePrincipalId")
        Response.Redirect(url)
    End Sub

    Protected Sub lvMembreFamille_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvMembreFamille.ItemInserting
        e.Values("courriel") = Session("membrePrincipalCourriel")
        e.Values("motPasse") = Session("membrePrincipalMotPasse")
        e.Values("familleID") = Session("membrePrincipalIdFamille")
        e.Values("dateInscription") = Date.Now.ToShortDateString

    End Sub

End Class
