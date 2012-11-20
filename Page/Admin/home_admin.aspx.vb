
Partial Class Page_Admin_home_admin
    Inherits System.Web.UI.Page

    Sub actionAjoutCours(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_course.aspx?view=" & 0
        Response.Redirect(url)
    End Sub

    Sub actionModifieCours(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_course.aspx?view=" & 2
        Response.Redirect(url)
    End Sub

    Sub actionSupprimeCours(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_course.aspx?view=" & 1
        Response.Redirect(url)
    End Sub

End Class
