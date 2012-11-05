Imports System
Imports System.Collections
Imports System.Linq
Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Xml.Linq
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports modelCLS

Partial Class Page_Employe_employe_client_modify
    Inherits System.Web.UI.Page

    Dim cn As New SqlClient.SqlConnection()
    Dim ds As New DataSet
    Dim dt As New DataTable

    Sub actionRecherche(sender As Object, e As EventArgs)

        dsListView.WhereParameters("courriel").DefaultValue = txtCourriel.Text

    End Sub

    Protected Sub lvMembre_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvMembre.ItemCommand
        Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
        Dim idMembre As Integer = lvMembre.DataKeys(dataItem.DisplayIndex).Value.ToString()

        If e.CommandName = "modifier" Then
            Session("idClient") = idMembre
            Response.Redirect("../Employe/employe_home_member.aspx")
        End If
    End Sub

    <System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()>
    Public Shared Function GetCompletionList(ByVal prefixText As String, ByVal count As Integer) As String()

        Dim entClient As modelCLSContainer = New modelCLSContainer

        Return entClient.MembresJeu.Where(Function(n) n.courriel.StartsWith(prefixText) And n.RoleJeu_idRole = 3).OrderBy(Function(n) n.courriel).[Select](Function(n) n.courriel).Take(count).ToArray()

    End Function

End Class
