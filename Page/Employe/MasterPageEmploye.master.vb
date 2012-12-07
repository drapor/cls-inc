
Partial Class Page_Employe_MasterPageEmploye
    Inherits System.Web.UI.MasterPage

    Sub actionAccueil(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Employe/home_employe.aspx?view=" & 0
        Response.Redirect(url)
    End Sub

    Sub actionAjout(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Employe/home_employe.aspx?view=" & 1
        Response.Redirect(url)
    End Sub

    Sub actionModifie(sender As Object, e As EventArgs)
        Dim url As String = "~/Page/Employe/home_employe.aspx?view=" & 2
        Response.Redirect(url)
    End Sub
End Class

