Imports Microsoft.VisualBasic
Imports System.Globalization
Imports System.Threading
Imports System.Configuration
Imports System.Data
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Web.HttpRequest
Imports System.Web.Services
Imports modelCLS
Imports System.IO

Public Class masterPage
    Inherits System.Web.UI.Page

    Public Shared Function FindChildControl(Of T As Control)(ByVal startingControl As Control, ByVal id As String) As T
        Dim found As T = Nothing
        For Each activeControl As Control In startingControl.Controls
            found = TryCast(activeControl, T)
            If found Is Nothing OrElse (String.Compare(id, found.ID, True) <> 0) Then
                found = FindChildControl(Of T)(activeControl, id)
            End If
            If found IsNot Nothing Then
                Exit For
            End If
        Next
        Return found
    End Function

    Public Sub ResetFormControlValues(ByVal parent As Control)
        For Each c As Control In parent.Controls
            If c.Controls.Count > 0 Then
                ResetFormControlValues(c)
            Else
                Select Case (c.GetType().ToString())
                    Case "System.Web.UI.WebControls.TextBox"
                        CType(c, TextBox).Text = ""
                    Case "System.Web.UI.WebControls.RadioButtonList"
                        CType(c, RadioButtonList).ClearSelection()
                End Select
            End If
        Next c
    End Sub

    'Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
    '    Dim erreur As Exception = Server.GetLastError
    '    masterPage.traiteErreur(Page, "UNE ERREUR EST SURVENUE:", erreur)
    '    Dim pagePrecedente As String = Request.Url.AbsolutePath
    '    Dim url As String
    '    url = "~/Page/error.aspx?pagePrecedente=" & pagePrecedente
    '    Response.Redirect(url)

    '    Server.ClearError()
    '    'Response.Redirect(utile.utilall.pageerreur, True)
    'End Sub

    'Public Shared Function traiteErreur(ByRef page As Page, ByVal msg As String, ByVal ex As Exception) As String
    '    Try
    '        File.AppendAllText(page.Server.MapPath("~/App_Data/logErreur.txt"), "ERREUR " & Now.ToLongDateString & ControlChars.CrLf)
    '        File.AppendAllText(page.Server.MapPath("~/App_Data/logErreur.txt"), msg & ex.ToString())
    '    Catch ex2 As Exception
    '    End Try
    '    Return "UNE ERREUR S'EST PRODUITE: " & ex.ToString
    'End Function


End Class
