'Créé par Francis Griggs
'Le 16 septembre 2012
'Dernière mise à jour le 25 septembre 2012
'Classe partielle qui supprime un groupe dans la BD associé à un cours

Partial Class Page_Admin_admin_group_delete
    Inherits masterPage

    Protected Sub lvGroupe_ItemDeleting(sender As Object, e As System.Web.UI.WebControls.ListViewDeleteEventArgs) Handles lvGroupe.ItemDeleting
        ddlNomGroupe.Items.RemoveAt(ddlNomGroupe.SelectedIndex)
    End Sub
End Class
