Imports masterPage
Imports modelCLS

Partial Class Page_Admin_admin_schedule_add
    Inherits System.Web.UI.Page

    Public entClient As modelCLSContainer = New modelCLSContainer

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        If Request.QueryString("view") = 0 Then
            MVPrincipal.ActiveViewIndex = 0
        ElseIf Request.QueryString("view") = 1 Then
            MVPrincipal.ActiveViewIndex = 1
        Else
            MVPrincipal.ActiveViewIndex = 2
        End If
    End Sub

    Protected Sub lvAjout_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvAjout.ItemInserting
        Dim idGroupe As Short = FindChildControl(Of DropDownList)(Me, "ddlNomGroupeAjout").SelectedValue

        e.Values("GroupeJeu_idGroupe") = idGroupe

    End Sub

    Sub actionAjout(sender As Object, e As EventArgs)
        MVPrincipal.SetActiveView(viewAjout)
    End Sub

    Sub actionModifie(sender As Object, e As EventArgs)
        Dim horaire As DropDownList = FindChildControl(Of DropDownList)(Me, "ddlHoraire")
        MVPrincipal.SetActiveView(viewModifie)
        horaire.DataBind()
    End Sub

    Sub actionSupprime(sender As Object, e As EventArgs)
        MVPrincipal.SetActiveView(viewSupprime)
        lvSupprime.DataBind()
    End Sub
End Class
