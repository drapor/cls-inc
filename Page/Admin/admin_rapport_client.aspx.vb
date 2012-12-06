
Partial Class Page_Admin_admin_rapport_client
    Inherits masterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If dropDownType.SelectedValue = 0 Then
            MVPrincipal.ActiveViewIndex = 0
            dsMembre.OrderBy = "it.nomMembre"
        Else
            MVPrincipal.ActiveViewIndex = 1
            dsMembre.OrderBy = "it.courriel"
        End If


    End Sub

End Class
