Imports masterPage

Partial Class Page_Admin_admin_group_add
    Inherits System.Web.UI.Page



    'Protected Sub lvGroupe_ItemInserted(sender As Object, e As System.Web.UI.WebControls.ListViewInsertedEventArgs) Handles lvGroupe.ItemInserted
    '    lblAjoute.Visible = True
    'End Sub

    'Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
    '    Dim txtGroupe As TextBox = FindChildControl(Of TextBox)(lvGroupe, "txtNomGroupe")
    '    Dim ddlCours As String = CType(FindChildControl(Of DropDownList)(lvGroupe, "ddlNomCours").SelectedValue, String)
    '    FindChildControl(Of TextBox)(lvGroupe, "txtNomGroupe").Text = ddlCours
    'End Sub

    Protected Sub lvGroupe_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvGroupe.ItemInserting
        Dim txtNo As TextBox = FindChildControl(Of TextBox)(lvGroupe, "txtNoGroupe")
        Dim ddlCours As String = FindChildControl(Of DropDownList)(lvGroupe, "ddlNomCours").SelectedItem.Text

        e.Values("nomGroupe") = ddlCours + txtNo.Text
    End Sub

    'Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
    '    lblAjoute.Visible = False
    'End Sub
End Class
