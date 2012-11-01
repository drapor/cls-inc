Imports System.Configuration.Provider
Imports modelCLS

Public Class CustomRoleProvider
    Inherits RoleProvider

    Private Shared leContext As modelCLSContainer = Nothing

    Private _ApplicationName As String

#Region "Fonction du RoleProvider non-implémenter"
    Public Overrides Sub AddUsersToRoles(usernames() As String, roleNames() As String)
        Throw New System.NotSupportedException("No saving")
    End Sub

    Public Overrides Property ApplicationName As String
        Get
            Return _ApplicationName
        End Get
        Set(value As String)
            _ApplicationName = value
        End Set
    End Property

    Public Overrides Function GetUsersInRole(roleName As String) As String()
        Throw New System.NotSupportedException("No saving")
    End Function

    Public Overrides Sub CreateRole(roleName As String)
        Throw New System.NotSupportedException("No saving")
    End Sub

    Public Overrides Function DeleteRole(roleName As String, throwOnPopulatedRole As Boolean) As Boolean
        Throw New System.NotSupportedException("No saving")
    End Function

    Public Overrides Function FindUsersInRole(roleName As String, usernameToMatch As String) As String()
        Throw New System.NotSupportedException("No saving")
    End Function

    Public Overrides Function GetAllRoles() As String()
        Throw New System.NotSupportedException("No saving")
    End Function

    Public Overrides Function GetRolesForUser(username As String) As String()
        Dim entUser As New modelCLSContainer
        Dim roleUser(0) As String

        Dim user As MembresJeu = (From A In entUser.MembresJeu Where (A.courriel = username) Select A).First()
        Dim role As RoleJeu = (From A In entUser.RoleJeu Where (A.idRole = user.RoleJeu_idRole) Select A).First()

        roleUser(0) = role.nomRole.ToString

        Return roleUser
    End Function

    Public Overrides Sub RemoveUsersFromRoles(usernames() As String, roleNames() As String)
        Throw New System.NotSupportedException("No saving")
    End Sub

    Public Overrides Function RoleExists(roleName As String) As Boolean
        Throw New System.NotSupportedException("No saving")
    End Function
#End Region


    Public Function GetRoleForUser(username As String) As String
        Dim entUser As New modelCLSContainer
        Dim roleUser As String = Nothing

        Dim user As MembresJeu = (From A In entUser.MembresJeu Where (A.courriel = username) Select A)
        Dim role As RoleJeu = (From A In entUser.RoleJeu Where (A.idRole = user.RoleJeu_idRole) Select A)

        roleUser = role.nomRole

        Return roleUser

    End Function

    

    Public Overrides Function IsUserInRole(username As String, roleName As String) As Boolean
        If username Is Nothing OrElse username = "" Then Throw New ProviderException("Le nom d'utilisateur ne peut être vide ou nulle.")
        If roleName Is Nothing OrElse roleName = "" Then Throw New ProviderException("Le role ne peut être vide ou nulle.")

        Dim entUser As New modelCLSContainer
        Dim userIsInRole As Boolean = False

        Dim utilisateur As MembresJeu = (From A In entUser.MembresJeu Where (A.courriel = username) Select A).First()

        If utilisateur IsNot Nothing Then
            Dim roleUtilisateur As RoleJeu = (From A In entUser.RoleJeu Where (A.idRole = utilisateur.RoleJeu_idRole) Select A).First()
            If roleUtilisateur.nomRole = roleName Then
                userIsInRole = True
            Else
                userIsInRole = False
            End If
        End If


        Return userIsInRole

    End Function

End Class