
Partial Class Page_Admin_admin_rapport_animateur
    Inherits masterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If dropDownType.SelectedValue = 0 Then
            MVPrincipal.ActiveViewIndex = 0
            dsAnimateur.OrderBy = "it.nomMembre"
        Else
            MVPrincipal.ActiveViewIndex = 1
            dsAnimateur.OrderBy = "it.courriel"
        End If


    End Sub

End Class
