
Partial Class Page_Admin_admin_group_delete
    Inherits System.Web.UI.Page

    Protected Sub lvGroupe_ItemDeleting(sender As Object, e As System.Web.UI.WebControls.ListViewDeleteEventArgs) Handles lvGroupe.ItemDeleting
        ddlNomGroupe.Items.RemoveAt(ddlNomGroupe.SelectedIndex)
    End Sub
End Class
