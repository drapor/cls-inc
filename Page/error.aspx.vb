
Partial Class Page_error
    Inherits masterPage

    Protected Sub lnkReturn_Click(sender As Object, e As System.EventArgs) Handles lnkReturn.Click
        Dim pagePrecedente As String = Request.QueryString("pagePrecedente")
        Response.Redirect(pagePrecedente)
    End Sub
End Class
