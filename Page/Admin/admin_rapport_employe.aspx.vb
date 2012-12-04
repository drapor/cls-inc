Partial Class Page_Admin_admin_rapport_employe
    Inherits masterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If dropDownType.SelectedValue = 0 Then
            MVPrincipal.ActiveViewIndex = 0
            dsEmploye.OrderBy = "it.nomMembre"
        Else
            MVPrincipal.ActiveViewIndex = 1
            dsEmploye.OrderBy = "it.courriel"
        End If


    End Sub

    Protected Function GetCssName(container As Object) As String
        If container IsNot Nothing Then
            If container.[GetType]() Is GetType(ListViewDataItem) Then
                If (DirectCast(container, ListViewDataItem).DisplayIndex Mod 2) = 0 Then
                    Return "even"
                Else
                    Return "odd"
                End If
            End If
        End If
        Return Nothing
    End Function

End Class
