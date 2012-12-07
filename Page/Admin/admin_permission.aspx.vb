'Créé par Samuel Bellerose
'Le 16 septembre 2012
'Dernière mise à jour le 7 novembre 2012
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

#Region "Traitements des erreurs"
    Protected Sub dsEmploye_Updated(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsEmploye.Updated
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE LA MISE À JOUR D'UN ROLE", e.Exception)
            e.ExceptionHandled = True
            activeControles(failImage, lblFailure)
            lblFailure.Text = "Une erreur s'est produite lors de la mise &agrave; jour du role de l'employ&eacute;."
        Else
            activeControles(checkImage, lblFelicitation)
            lblFelicitation.Text = "La permission de l'employ&eacute; a &eacute;t&eacute; mis &agrave; jour avec succ&egrave;s !"
        End If
    End Sub

    Sub resetLabel(sender As Object, e As EventArgs)
        desactiveControles(checkImage, lblFelicitation)
        desactiveControles(failImage, lblFailure)
    End Sub
#End Region
End Class
