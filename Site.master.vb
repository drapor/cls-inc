Imports System.IO
Imports masterPage
Partial Class Site
    Inherits System.Web.UI.MasterPage


    Dim categorie As String = Nothing
    Dim url As String

#Region "Redirection des boutons de catégorie"
    Protected Sub btnCulture_Click(sender As Object, e As System.EventArgs) Handles btnCulture.Click
        categorie = btnCulture.Text
        url = "~/Page/Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub

    Protected Sub btnLoisir_Click(sender As Object, e As System.EventArgs) Handles btnLoisir.Click
        categorie = btnLoisir.Text
        url = "~/Page/Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub

    Protected Sub btnSport_Click(sender As Object, e As System.EventArgs) Handles btnSport.Click
        categorie = btnSport.Text
        url = "~/Page/Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub
#End Region



    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If HttpContext.Current.User.Identity.IsAuthenticated = True Then
            'Apparition des boutons de l'utilisateur
            lnkConnecter.Visible = False
            lnkInscrire.Visible = False
            lnkUserName.Visible = True
            lnkLogOut.Visible = True
            lnkProfile.Visible = True
            imgProfileIcon.Visible = True
            lnkUserName.Text = HttpContext.Current.User.Identity.Name
        End If
    End Sub


    Protected Sub lnkLogOut_Click(sender As Object, e As System.EventArgs) Handles lnkLogOut.Click
        FormsAuthentication.SignOut()
        Response.Redirect("~/Page/login.aspx")
        Session("idUser") = Nothing
    End Sub

End Class

