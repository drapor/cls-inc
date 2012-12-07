Imports modelCLS
Imports masterPage

Partial Class Page_Admin_admin_member_family_add
    Inherits System.Web.UI.Page

    Public entClient As modelCLSContainer = New modelCLSContainer

    Protected Sub lvMembreFamille_ItemInserted(sender As Object, e As System.Web.UI.WebControls.ListViewInsertedEventArgs) Handles lvMembreFamille.ItemInserted
        Dim idMembre As String = entClient.MembresJeu.OrderBy(Function(n) n.idMembre).[Select](Function(n) n.idMembre).Max

        Session("idMembreFamille") = idMembre
        Response.Redirect("../Employe/employe_home_member.aspx")
    End Sub

    Protected Sub lvMembreFamille_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvMembreFamille.ItemInserting
        e.Values("courriel") = Session("userCourriel")
        e.Values("motPasse") = Session("userMotPasse")
        e.Values("familleID") = Session("idFamille")
        e.Values("adresse") = Session("userAdresse")
        e.Values("ville") = Session("userVille")
        e.Values("telephoneMembre") = Session("userTelephone")
        e.Values("codePostal") = Session("userCodePostal")
        e.Values("dateInscription") = Date.Now.ToShortDateString

    End Sub
End Class
