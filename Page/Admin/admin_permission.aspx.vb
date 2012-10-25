Imports modelCLS

Partial Class Page_Admin_admin_permission
    Inherits System.Web.UI.Page


    Private Shared leContext As modelCLSContainer = Nothing

    Protected Sub lvPermission_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvPermission.ItemDataBound

        Dim ddlRole As DropDownList = CType(e.Item.FindControl("ddlPermission"), DropDownList)

        For Each item As ListItem In ddlRole.Items
            If item.Value = 1 Then
                item.Text = "Administrateur"
            Else
                item.Text = "Employe"
            End If
        Next
    End Sub

    Sub confirmation(sender As Object, e As EventArgs)
        If Page.IsValid = True Then
            lblFelicitation.Visible = True
            checkImage.Visible = True
        End If
    End Sub
End Class
