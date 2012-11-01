Imports Microsoft.VisualBasic
Imports modelCLS
Imports System.Configuration.Provider

Public Class CustomMembershipProvider
    Inherits MembershipProvider



    Private Shared leContext As modelCLSContainer = Nothing

#Region "Fonction du Membership Provider non-implémenter"
    Public Overrides Property ApplicationName As String
        Get

        End Get
        Set(value As String)

        End Set
    End Property

    Public Overrides Function ChangePassword(username As String, oldPassword As String, newPassword As String) As Boolean

    End Function

    Public Overrides Function ChangePasswordQuestionAndAnswer(username As String, password As String, newPasswordQuestion As String, newPasswordAnswer As String) As Boolean

    End Function

    Public Overrides Function CreateUser(username As String, password As String, email As String, passwordQuestion As String, passwordAnswer As String, isApproved As Boolean, providerUserKey As Object, ByRef status As System.Web.Security.MembershipCreateStatus) As System.Web.Security.MembershipUser

    End Function

    Public Overrides Function DeleteUser(username As String, deleteAllRelatedData As Boolean) As Boolean

    End Function

    Public Overrides ReadOnly Property EnablePasswordReset As Boolean
        Get

        End Get
    End Property

    Public Overrides ReadOnly Property EnablePasswordRetrieval As Boolean
        Get

        End Get
    End Property

    Public Overrides Function FindUsersByEmail(emailToMatch As String, pageIndex As Integer, pageSize As Integer, ByRef totalRecords As Integer) As System.Web.Security.MembershipUserCollection

    End Function

    Public Overrides Function FindUsersByName(usernameToMatch As String, pageIndex As Integer, pageSize As Integer, ByRef totalRecords As Integer) As System.Web.Security.MembershipUserCollection

    End Function

    Public Overrides Function GetAllUsers(pageIndex As Integer, pageSize As Integer, ByRef totalRecords As Integer) As System.Web.Security.MembershipUserCollection

    End Function

    Public Overrides Function GetNumberOfUsersOnline() As Integer

    End Function

    Public Overrides Function GetPassword(username As String, answer As String) As String

    End Function

    Public Overloads Overrides Function GetUser(providerUserKey As Object, userIsOnline As Boolean) As System.Web.Security.MembershipUser

    End Function

    Public Overloads Overrides Function GetUser(username As String, userIsOnline As Boolean) As System.Web.Security.MembershipUser

    End Function

    Public Overrides Function GetUserNameByEmail(email As String) As String

    End Function

    Public Overrides ReadOnly Property MaxInvalidPasswordAttempts As Integer
        Get

        End Get
    End Property

    Public Overrides ReadOnly Property MinRequiredNonAlphanumericCharacters As Integer
        Get

        End Get
    End Property

    Public Overrides ReadOnly Property MinRequiredPasswordLength As Integer
        Get

        End Get
    End Property

    Public Overrides ReadOnly Property PasswordAttemptWindow As Integer
        Get

        End Get
    End Property

    Public Overrides ReadOnly Property PasswordFormat As System.Web.Security.MembershipPasswordFormat
        Get

        End Get
    End Property

    Public Overrides ReadOnly Property PasswordStrengthRegularExpression As String
        Get

        End Get
    End Property

    Public Overrides ReadOnly Property RequiresQuestionAndAnswer As Boolean
        Get

        End Get
    End Property

    Public Overrides ReadOnly Property RequiresUniqueEmail As Boolean
        Get

        End Get
    End Property

    Public Overrides Function ResetPassword(username As String, answer As String) As String

    End Function

    Public Overrides Function UnlockUser(userName As String) As Boolean

    End Function

    Public Overrides Sub UpdateUser(user As System.Web.Security.MembershipUser)

    End Sub

#End Region

    'Fonction qui vérifi si l'utilisateur est valide
    Public Overrides Function ValidateUser(username As String, password As String) As Boolean
        If username Is Nothing OrElse username = "" Then Throw New ProviderException("Le nom d'utilisateur ne peut être vide ou nulle.")
        If password Is Nothing OrElse password = "" Then Throw New ProviderException("Le mot de passe ne peut être vide ou nulle.")

        Dim entUser As New modelCLSContainer
        Dim isUserValid As Boolean = False
        Dim utilisateur As MembresJeu = Nothing

        Try
            utilisateur = (From A In entUser.MembresJeu Where (A.courriel = username And A.motPasse = password) Select A).First()
        Catch ex As Exception
            Throw New ProviderException("Le courriel ou le mot de passe ne corresponde pas.")
        End Try



        If utilisateur IsNot Nothing Then
            isUserValid = True
        End If
        Return isUserValid
    End Function

    Shared Function GetRoleForUser(username As String) As String
        Dim entUser As New modelCLSContainer
        Dim roleUser As String = Nothing

        Dim user As MembresJeu = (From A In entUser.MembresJeu Where (A.courriel = username) Select A).First()
        Dim role As RoleJeu = (From A In entUser.RoleJeu Where (A.idRole = user.RoleJeu_idRole) Select A).First()

        roleUser = role.nomRole

        Return roleUser
    End Function

    Shared Function GetUserId(username As String) As String
        Dim entUser As New modelCLSContainer
        Dim idUser As String = Nothing

        Dim user As MembresJeu = (From A In entUser.MembresJeu Where (A.courriel = username) Select A).First()

        idUser = user.idMembre

        Return idUser
    End Function

End Class
