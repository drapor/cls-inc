Imports modelCLS
Partial Class Page_Autre_register
    Inherits System.Web.UI.Page

    Private Shared leContext As modelCLSContainer = Nothing

    Protected Sub page_load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub

    Sub actionAjout(sender As Object, e As EventArgs)
        If Page.IsValid = True Then
        End If

    End Sub

End Class