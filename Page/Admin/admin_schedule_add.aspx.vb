
Partial Class Page_Admin_admin_group_add
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

    'Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
    '    Dim txtGroupe As TextBox = FindChildControl(Of TextBox)(lvGroupe, "txtNomGroupe")
    '    Dim ddlCours As String = CType(FindChildControl(Of DropDownList)(lvGroupe, "ddlNomCours").SelectedValue, String)
    '    FindChildControl(Of TextBox)(lvGroupe, "txtNomGroupe").Text = ddlCours
    'End Sub

    Protected Sub lvGroupe_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvGroupe.ItemDataBound
        '    Dim petanque As String = "petanque"
        '    Dim txtGroupe As TextBox = e.Item.FindControl("txtNomGroupe")
        'Dim ddlCours As String = CType(FindChildControl(Of DropDownList)(lvGroupe, "ddlNomCours").SelectedValue, String)
        '    txtGroupe.Text = petanque
    End Sub

End Class
