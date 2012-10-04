Imports System.Web.Security
Imports System.Configuration.Provider

Public MustInherit Class RoleProvider
    Inherits ProviderBase

    Private pApplicationName As String


    Public MustOverride Sub AddUsersToRoles(userNames As String(), rolesNames As String())


    

End Class