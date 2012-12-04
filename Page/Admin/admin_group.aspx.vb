'Créé par Francis Griggs
'Le 16 septembre 2012
'Dernière mise à jour le 25 septembre 2012
'Classe partielle qui ajoute un groupe dans la BD associé à un cours

Imports modelCLS
Imports System.Data

Partial Class Page_Admin_admin_group_add
    Inherits masterPage

    Dim entClient As modelCLSContainer = New modelCLSContainer

    Protected Sub lvGroupe_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvGroupe.ItemInserting
        Dim groupeNo As Short = Nothing
        Dim coursNo As Short = Nothing
        Dim coursNom As String = Nothing
        Dim coursGroupe = Nothing

        coursNo = ddlNomCoursAjout.SelectedValue
        coursNom = ddlNomCoursAjout.SelectedItem.Text

        coursGroupe = entClient.GroupeJeu.Where(Function(n) n.Cours_idCours = coursNo).[Select](Function(n) n.idGroupe).Any

        If coursGroupe = Nothing Then
            groupeNo = 1
        Else
            groupeNo = entClient.GroupeJeu.Where(Function(n) n.Cours_idCours = coursNo).OrderBy(Function(n) n.noGroupe).[Select](Function(n) n.noGroupe).Max
            groupeNo += 1
        End If

        e.Values("nomGroupe") = coursNom + CType(groupeNo, String)
        e.Values("noGroupe") = groupeNo
        e.Values("Cours_idCours") = coursNo

    End Sub

End Class

