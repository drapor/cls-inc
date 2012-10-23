Imports System.Web.Services
Imports System.Configuration
Imports modelCLS


Partial Class Site
    Inherits System.Web.UI.MasterPage


    Dim categorie As String = Nothing
    Dim url As String

    Protected Sub btnCulture_Click(sender As Object, e As System.EventArgs) Handles btnCulture.Click
        categorie = btnCulture.Text
        url = "../Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub

    Protected Sub btnLoisir_Click(sender As Object, e As System.EventArgs) Handles btnLoisir.Click
        categorie = btnLoisir.Text
        url = "../Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub

    Protected Sub btnSport_Click(sender As Object, e As System.EventArgs) Handles btnSport.Click
        categorie = btnSport.Text
        url = "../Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub

    '<System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()>
    'Public Shared Function GetCompletionList(ByVal prefixText As String, ByVal count As Integer) As String()

    '    Dim entCours As modelCLSContainer = New modelCLSContainer

    '    Return entCours.CoursJeu.Where(Function(n) n.nomCours.StartsWith(prefixText)).OrderBy(Function(n) n.nomCours).[Select](Function(n) n.nomCours).Take(count).ToArray()

    'End Function


End Class

