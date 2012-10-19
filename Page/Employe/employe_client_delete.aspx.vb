Imports modelCLS

Partial Class Page_Employe_employe_client_delete
    Inherits System.Web.UI.Page

    Sub actionRecherche(sender As Object, e As EventArgs)

        dsListView.WhereParameters("courriel").DefaultValue = txtCourriel.Text

    End Sub

    <System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()>
    Public Shared Function GetCompletionList(ByVal prefixText As String, ByVal count As Integer) As String()

        Dim entClient As modelCLSContainer = New modelCLSContainer

        Return entClient.MembresJeu.Where(Function(n) n.courriel.StartsWith(prefixText)).OrderBy(Function(n) n.courriel).[Select](Function(n) n.courriel).Take(count).ToArray()

    End Function

End Class
