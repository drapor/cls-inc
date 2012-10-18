
Partial Class Page_Employe_employe_client_delete
    Inherits System.Web.UI.Page

    Public Shared Function FindChildControl(Of T As Control)(ByVal startingControl As Control, ByVal id As String) As T
        Dim found As T = Nothing
        For Each activeControl As Control In startingControl.Controls
            found = TryCast(activeControl, T)
            If found Is Nothing OrElse (String.Compare(id, found.ID, True) <> 0) Then
                found = FindChildControl(Of T)(activeControl, id)
            End If
            If found IsNot Nothing Then
                Exit For
            End If
        Next
        Return found
    End Function

    Sub actionDelete(sender As Object, e As EventArgs)

        Dim courriel As TextBox = FindChildControl(Of TextBox)(lvMembre, "txtCourriel")

        dsListView.WhereParameters("courriel").DefaultValue = courriel.Text

    End Sub

    'Protected Sub dsListView_Deleting(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangingEventArgs) Handles dsListView.Deleting


    '    dsListView.WhereParameters("courriel").DefaultValue = courriel.Text

    'End Sub
End Class
