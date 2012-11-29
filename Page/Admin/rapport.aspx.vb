Partial Class Page_Admin_rapport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If dropDownType.SelectedValue = 0 Then
            MVPrincipal.ActiveViewIndex = 0
        ElseIf dropDownType.SelectedValue = 1 Then
            MVPrincipal.ActiveViewIndex = 1
        Else
            MVPrincipal.ActiveViewIndex = 2
        End If
    End Sub

End Class
