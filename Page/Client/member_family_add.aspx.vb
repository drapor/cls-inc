Imports modelCLS
Imports masterPage
Partial Class Page_Autre_register
    Inherits System.Web.UI.Page

    Protected Sub lvMembreFamille_ItemInserted(sender As Object, e As System.Web.UI.WebControls.ListViewInsertedEventArgs) Handles lvMembreFamille.ItemInserted
        Response.Redirect("../Client/member_family.aspx")
    End Sub

    Protected Sub lvMembreFamille_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvMembreFamille.ItemInserting
        e.Values("courriel") = Session("userCourriel")
        e.Values("motPasse") = Session("userMotPasse")
        e.Values("familleID") = Session("userIdFamille")
        e.Values("adresse") = Session("userAdresse")
        e.Values("ville") = Session("userVille")
        e.Values("telephoneMembre") = Session("userTelephone")
        e.Values("codePostal") = Session("userCodePostal")
        e.Values("dateInscription") = Date.Now.ToShortDateString

    End Sub

End Class
