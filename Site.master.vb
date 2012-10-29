Imports System.Web.Services
Imports System.Configuration
Imports modelCLS


Partial Class Site
    Inherits System.Web.UI.MasterPage


    Dim categorie As String = Nothing
    Dim url As String

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

End Class

