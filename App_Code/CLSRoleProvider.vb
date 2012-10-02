Imports Microsoft.VisualBasic
Imports System.Configuration.Provider

Public MustInherit Class RoleProvider
    Inherits ProviderBase
    ' Methods
    Protected Sub New()
    End Sub
    Public MustOverride Sub AddUsersToRoles(usernames As String(), roleNames As String())
    Public MustOverride Sub CreateRole(roleName As String)
    Public MustOverride Function DeleteRole(roleName As String, throwOnPopulatedRole As Boolean) As Boolean
    Public MustOverride Function FindUsersInRole(roleName As String, usernameToMatch As String) As String()
    Public MustOverride Function GetAllRoles() As String()
    Public MustOverride Function GetRolesForUser(username As String) As String()
    Public MustOverride Function GetUsersInRole(roleName As String) As String()
    Public MustOverride Function IsUserInRole(username As String, roleName As String) As Boolean
    Public MustOverride Sub RemoveUsersFromRoles(usernames As String(), roleNames As String())
    Public MustOverride Function RoleExists(roleName As String) As Boolean

    ' Properties
    Public MustOverride Property ApplicationName() As String


End Class