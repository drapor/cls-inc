
Partial Class Page_Admin_admin_group_modify
    Inherits System.Web.UI.Page

    Sub confirmation(sender As Object, e As EventArgs)
        If Page.IsValid = True Then
            lblFelicitation.Visible = True
            checkImage.Visible = True
        End If
    End Sub
End Class
