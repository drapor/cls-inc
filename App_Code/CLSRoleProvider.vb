Imports Microsoft.VisualBasic
Imports System.Configuration.Provider
Imports System.Web.Services
Imports System.Web.Services.Description

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
    Public MustOverride Function IsUserInRole(userName As String, roleName As String) As Boolean
    Public MustOverride Sub RemoveUsersFromRoles(usernames As String(), roleNames As String())
    Public MustOverride Function RoleExists(roleName As String) As Boolean

    ' Properties
    Public MustOverride Property ApplicationName() As String

    Protected Function GetProvider(ByVal providerName As String, ByVal applicationName As String) As System.Web.Security.RoleProvider
        Dim provider As System.Web.Security.RoleProvider
        If ((Not (providerName) Is Nothing) _
                    AndAlso (Not (System.Web.Security.Roles.Providers(providerName)) Is Nothing)) Then
            provider = System.Web.Security.Roles.Providers(providerName)
        Else
            provider = System.Web.Security.Roles.Provider
        End If
        If (Not (applicationName) Is Nothing) Then
            provider.ApplicationName = applicationName
        End If
        Return provider
    End Function

    <WebMethod(Description:="")> _
    Public Sub AddUsersToRoles(ByVal providerName As String, ByVal applicationName As String, ByVal usernames() As String, ByVal roleNames() As String)
        GetProvider(providerName, applicationName).AddUsersToRoles(usernames, roleNames)
    End Sub

    <WebMethod(Description:="")> _
    Public Sub CreateRole(ByVal providerName As String, ByVal applicationName As String, ByVal roleName As String)
        GetProvider(providerName, applicationName).CreateRole(roleName)
    End Sub

    <WebMethod(Description:="")> _
    Public Function DeleteRole(ByVal providerName As String, ByVal applicationName As String, ByVal roleName As String, ByVal throwOnPopulatedRole As Boolean) As Boolean
        Return GetProvider(providerName, applicationName).DeleteRole(roleName, throwOnPopulatedRole)
    End Function

    <WebMethod(Description:="")> _
    Public Function FindUsersInRole(ByVal providerName As String, ByVal applicationName As String, ByVal roleName As String, ByVal usernameToMatch As String) As String()
        Return GetProvider(providerName, applicationName).FindUsersInRole(roleName, usernameToMatch)
    End Function

    <WebMethod(Description:="")> _
    Public Function GetAllRoles(ByVal providerName As String, ByVal applicationName As String) As String()
        Return GetProvider(providerName, applicationName).GetAllRoles
    End Function

    <WebMethod(Description:="")> _
    Public Function GetRolesForUser(ByVal providerName As String, ByVal applicationName As String, ByVal username As String) As String()
        Return GetProvider(providerName, applicationName).GetRolesForUser(username)
    End Function

    <WebMethod(Description:="")> _
    Public Function GetUsersInRole(ByVal providerName As String, ByVal applicationName As String, ByVal roleName As String) As String()
        Return GetProvider(providerName, applicationName).GetUsersInRole(roleName)
    End Function

    <WebMethod(Description:="")> _
    Public Function IsUserInRole(ByVal providerName As String, ByVal applicationName As String, ByVal username As String, ByVal roleName As String) As Boolean
        Return GetProvider(providerName, applicationName).IsUserInRole(username, roleName)
    End Function

    <WebMethod(Description:="")> _
    Public Sub RemoveUsersFromRoles(ByVal providerName As String, ByVal applicationName As String, ByVal usernames() As String, ByVal roleNames() As String)
        GetProvider(providerName, applicationName).RemoveUsersFromRoles(usernames, roleNames)
    End Sub

    <WebMethod(Description:="")> _
    Public Function RoleExists(ByVal providerName As String, ByVal applicationName As String, ByVal roleName As String) As Boolean
        Return GetProvider(providerName, applicationName).RoleExists(roleName)
    End Function

    'Public Overrides Sub Initialize(name As String, config As System.Collections.Specialized.NameValueCollection)
    '    If config("roleProviderUri") IsNot Nothing Then
    '        Service.Url = config("roleProviderUri")
    '    End If

    '    ApplicationName = config("applicationName")
    '    If String.IsNullOrEmpty(ApplicationName) Then

    '        ApplicationName = ProviderUtility.GetDefaultAppName()
    '    End If

    '    RemoteProviderName = config("remoteProviderName")

    '    MyBase.Initialize(name, config)
    'End Sub

End Class