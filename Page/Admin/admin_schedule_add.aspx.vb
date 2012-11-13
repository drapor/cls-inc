Imports masterPage
Imports modelCLS

Partial Class Page_Admin_admin_group_add
    Inherits System.Web.UI.Page

    Public entClient As modelCLSContainer = New modelCLSContainer

    Protected Sub lvAjout_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvAjout.ItemInserting
        Dim idGroupe As Short = FindChildControl(Of DropDownList)(Me, "ddlNomGroupeAjout").SelectedValue

        e.Values("GroupeJeu_idGroupe") = idGroupe

    End Sub

    Sub actionAjout(sender As Object, e As EventArgs)
        MVPrincipal.SetActiveView(viewAjout)
    End Sub

    'Sub actionModifie(sender As Object, e As EventArgs)
    '    MVPrincipal.SetActiveView(viewModifie)
    'End Sub

    'Sub actionSupprime(sender As Object, e As EventArgs)
    '    MVPrincipal.SetActiveView(viewSupprime)
    'End Sub
End Class
