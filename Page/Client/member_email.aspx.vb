
Partial Class Page_Client_member_email
    Inherits System.Web.UI.Page

    Protected Sub lvCourriel_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvCourriel.ItemDataBound
        Dim courriel As TextBox = CType(e.Item.FindControl("txtNouveauCourriel"), TextBox)
        courriel.Text = ""
    End Sub

    Sub actionCancel(sender As Object, e As EventArgs)
        If Page.IsValid = False Then
            Response.Redirect("~/Page/Client/home_member.aspx")
        End If
    End Sub

End Class
