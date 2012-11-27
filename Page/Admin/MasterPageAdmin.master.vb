
Partial Class Page_Admin_MasterPageAdmin
    Inherits System.Web.UI.MasterPage

    Sub actionAjoutCours(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_course.aspx?view=" & 0
        Response.Redirect(url)
    End Sub

    Sub actionModifieCours(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_course.aspx?view=" & 1
        Response.Redirect(url)
    End Sub

    Sub actionSupprimeCours(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_course.aspx?view=" & 2
        Response.Redirect(url)
    End Sub

    Sub actionAjoutHoraire(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_schedule.aspx?view=" & 0
        Response.Redirect(url)
    End Sub

    Sub actionModifieHoraire(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_schedule.aspx?view=" & 1
        Response.Redirect(url)
    End Sub

    Sub actionSupprimeHoraire(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_schedule.aspx?view=" & 2
        Response.Redirect(url)
    End Sub



    Sub actionAjoutEmploye(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_employe.aspx?view=" & 0
        Response.Redirect(url)
    End Sub

    Sub actionModifieEmploye(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_employe.aspx?view=" & 1
        Response.Redirect(url)
    End Sub

    Sub actionSupprimeEmploye(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_employe.aspx?view=" & 2
        Response.Redirect(url)
    End Sub


    Sub actionAjoutAnimateur(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_teacher.aspx?view=" & 0
        Response.Redirect(url)
    End Sub

    Sub actionModifieAnimateur(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_teacher.aspx?view=" & 1
        Response.Redirect(url)
    End Sub

    Sub actionSupprimeAnimateur(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_teacher.aspx?view=" & 2
        Response.Redirect(url)
    End Sub

    Sub actionAjoutMembre(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_membre.aspx?view=" & 0
        Response.Redirect(url)
    End Sub

    Sub actionModifieMembre(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_membre.aspx?view=" & 1
        Response.Redirect(url)
    End Sub

    Sub actionSupprimeMembre(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Admin/admin_membre.aspx?view=" & 2
        Response.Redirect(url)
    End Sub

End Class

