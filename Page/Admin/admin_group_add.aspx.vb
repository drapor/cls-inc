Imports masterPage
Imports modelCLS

Partial Class Page_Admin_admin_group_add
    Inherits System.Web.UI.Page

    Dim entClient As modelCLSContainer = New modelCLSContainer

    Protected Sub lvGroupe_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvGroupe.ItemInserting
        Dim groupeNo As Short = Nothing
        Dim ddlCoursNo As Short = Nothing
        Dim ddlCoursNom As String = Nothing
        Dim ddlCours = Nothing

        ddlCoursNo = ddlNomCours.SelectedValue
        ddlCoursNom = ddlNomCours.SelectedItem.Text

        ddlCours = entClient.GroupeJeu.Where(Function(n) n.Cours_idCours = ddlCoursNo).[Select](Function(n) n.idGroupe).Any

        If ddlCours = Nothing Then
            groupeNo = 1
        Else
            groupeNo = entClient.GroupeJeu.Where(Function(n) n.Cours_idCours = ddlCoursNo).OrderBy(Function(n) n.noGroupe).[Select](Function(n) n.noGroupe).Max
            groupeNo += 1
        End If

        e.Values("Cours_idCours") = ddlCoursNo
        e.Values("noGroupe") = groupeNo
        e.Values("nomGroupe") = ddlCoursNom + CType(groupeNo, String)

    End Sub

End Class
