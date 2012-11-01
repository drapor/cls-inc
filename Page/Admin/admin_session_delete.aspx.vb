
Partial Class Page_Admin_admin_session_delete
    Inherits System.Web.UI.Page

    Protected Sub lvSession_ItemDeleting(sender As Object, e As System.Web.UI.WebControls.ListViewDeleteEventArgs) Handles lvSession.ItemDeleting
        ddlNomSession.Items.RemoveAt(ddlNomSession.SelectedIndex)
    End Sub
End Class
