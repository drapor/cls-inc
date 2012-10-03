
Partial Class Page_member_MP
    Inherits System.Web.UI.Page

    Protected Sub lvMP_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvMP.ItemDataBound
        Dim courriel As TextBox = CType(e.Item.FindControl("txtNouveauMP"), TextBox)
        courriel.Text = ""
    End Sub
End Class
