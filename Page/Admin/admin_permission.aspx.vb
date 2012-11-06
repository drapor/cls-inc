'Créé par Samuel Bellerose
'Le 16 septembre 2012
'Dernière mise à jour le 25 septembre 2012
'Classe partielle qui modifi les rôles des employé dans la BD

Imports modelCLS
Partial Class Page_Admin_admin_permission
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing

    'Affiche le nom des rôles dans les dropDownList
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

    'Petite fonction qui confirme que la modification a été fait
    Sub confirmation(sender As Object, e As EventArgs)
        If Page.IsValid = True Then
            lblFelicitation.Visible = True
            checkImage.Visible = True
        End If
    End Sub
End Class
