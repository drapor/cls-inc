'Imports System.Collections.Generic
'Imports System.Linq
'Imports System.Web
'Imports System.Web.Security
'Imports modelCLS
'Imports Microsoft.VisualBasic.ApplicationServices

'Namespace LocalBank.Models

'    Public Class LocalBankRepository

'#Region "Variables"

'        Private entities As New modelCLSContainer()

'        Private Const MissingRole As String = "Role does not exist"
'        Private Const MissingUser As String = "User does not exist"
'        Private Const TooManyUser As String = "User already exists"
'        Private Const TooManyRole As String = "Role already exists"
'        Private Const AssignedRole As String = "Cannot delete a role with assigned users"

'#End Region

'#Region "Properties"

'        Public ReadOnly Property NumberOfUsers() As Integer
'            Get
'                Return Me.entities.MembresJeu.Count()
'            End Get
'        End Property

'        Public ReadOnly Property NumberOfRoles() As Integer
'            Get
'                Return Me.entities.RoleJeu.Count()
'            End Get
'        End Property

'#End Region

'#Region "Constructors"

'        Public Sub New()
'            Me.entities = New modelCLSContainer()
'        End Sub

'#End Region

'#Region "Query Methods"

'        '     Public Function GetAllUsers() As IQueryable(Of User)
'        'Return From user In entities.UsersOrder By user.UserNameuser
'        '     End Function

'        'Public Function GetUser(id As Integer) As User
'        '    Return entities.Users.SingleOrDefault(Function(user) user.ID = id)
'        'End Function

'        Public Function GetUser(id As Integer) As MembresJeu
'            Return entities.MembresJeu.SingleOrDefault(Function(user) user.idMembre = id)
'        End Function

'        'Public Function GetUser(userName As String) As User
'        '    Return entities.Users.SingleOrDefault(Function(user) user.UserName = userName)
'        'End Function

'        Public Function GetUser(userName As String) As MembresJeu
'            Return entities.MembresJeu.SingleOrDefault(Function(user) user.courriel = userName)
'        End Function

'        Public Function GetUsersForRole(roleName As String) As IQueryable(Of User)
'            Return GetUsersForRole(GetRole(roleName))
'        End Function

'        Public Function GetUsersForRole(id As Integer) As IQueryable(Of User)
'            Return GetUsersForRole(GetRole(id))
'        End Function

'        Public Function GetUsersForRole(role As Role) As IQueryable(Of User)
'            If Not RoleExists(role) Then
'                Throw New ArgumentException(MissingRole)
'            End If

'        			Return From user In entities.Users Where user.RoleID = role.IDOrder By user.UserNameuser
'        End Function

'        Public Function GetAllRoles() As IQueryable(Of Role)
'        			Return From role In entities.RolesOrder By role.Namerole
'        End Function

'        'Public Function GetRole(id As Integer) As Role
'        '    Return entities.Roles.SingleOrDefault(Function(role) role.ID = id)
'        'End Function

'        Public Function GetRole(id As Integer) As RoleJeu
'            Return entities.RoleJeu.SingleOrDefault(Function(role) role.idRole = id)
'        End Function

'        'Public Function GetRole(name As String) As Role
'        '    Return entities.Roles.SingleOrDefault(Function(role) role.Name = name)
'        'End Function

'        Public Function GetRole(name As String) As RoleJeu
'            Return entities.RoleJeu.SingleOrDefault(Function(role) role.nomRole = name)
'        End Function

'        Public Function GetRoleForUser(userName As String) As RoleJeu
'            Return GetRoleForUser(GetUser(userName))
'        End Function

'        Public Function GetRoleForUser(id As Integer) As RoleJeu
'            Return GetRoleForUser(GetUser(id))
'        End Function

'        Public Function GetRoleForUser(user As RoleJeu) As RoleJeu
'            If Not UserExists(user) Then
'                Throw New ArgumentException(MissingUser)
'            End If

'            Return user.Role
'        End Function

'#End Region

'#Region "Insert/Delete"

'        Private Sub AddUser(user As User)
'            If UserExists(user) Then
'                Throw New ArgumentException(TooManyUser)
'            End If

'            entities.Users.AddObject(user)
'        End Sub

'        Public Sub CreateUser(username As String, name As String, password As String, email As String, roleName As String)
'            Dim role As Role = GetRole(roleName)

'            If String.IsNullOrEmpty(username.Trim()) Then
'                Throw New ArgumentException("The user name provided is invalid. Please check the value and try again.")
'            End If
'            If String.IsNullOrEmpty(name.Trim()) Then
'                Throw New ArgumentException("The name provided is invalid. Please check the value and try again.")
'            End If
'            If String.IsNullOrEmpty(password.Trim()) Then
'                Throw New ArgumentException("The password provided is invalid. Please enter a valid password value.")
'            End If
'            If String.IsNullOrEmpty(email.Trim()) Then
'                Throw New ArgumentException("The e-mail address provided is invalid. Please check the value and try again.")
'            End If
'            If Not RoleExists(role) Then
'                Throw New ArgumentException("The role selected for this user does not exist! Contact an administrator!")
'            End If
'            If Me.entities.Users.Any(Function(user) user.UserName = username) Then
'                Throw New ArgumentException("Username already exists. Please enter a different user name.")
'            End If

'        			Dim newUser As New User() With { _
'        				Key .UserName = username, _
'        				Key .Name = name, _
'        				Key .Password = FormsAuthentication.HashPasswordForStoringInConfigFile(password.Trim(), "md5"), _
'        				Key .Email = email, _
'        				Key .RoleID = role.ID _
'        			}

'            Try
'                AddUser(newUser)
'            Catch ae As ArgumentException
'                Throw ae
'            Catch e As Exception
'                Throw New ArgumentException("The authentication provider returned an error. Please verify your entry and try again. " & "If the problem persists, please contact your system administrator.")
'            End Try

'            ' Immediately persist the user data
'            Save()
'        End Sub

'        Public Sub DeleteUser(user As User)
'            If Not UserExists(user) Then
'                Throw New ArgumentException(MissingUser)
'            End If

'            entities.Users.DeleteObject(user)
'        End Sub

'        Public Sub DeleteUser(userName As String)
'            DeleteUser(GetUser(userName))
'        End Sub

'        Public Sub AddRole(role As Role)
'            If RoleExists(role) Then
'                Throw New ArgumentException(TooManyRole)
'            End If

'            entities.Roles.AddObject(role)
'        End Sub

'        Public Sub AddRole(roleName As String)
'        			Dim role As New Role() With { _
'        				Key .Name = roleName _
'        			}

'            AddRole(role)
'        End Sub

'        Public Sub DeleteRole(role As Role)
'            If Not RoleExists(role) Then
'                Throw New ArgumentException(MissingRole)
'            End If

'            If GetUsersForRole(role).Count() > 0 Then
'                Throw New ArgumentException(AssignedRole)
'            End If

'            entities.Roles.DeleteObject(role)
'        End Sub

'        Public Sub DeleteRole(roleName As String)
'            DeleteRole(GetRole(roleName))
'        End Sub

'#End Region

'#Region "Persistence"

'        Public Sub Save()
'            entities.SaveChanges()
'        End Sub

'#End Region

'#Region "Helper Methods"

'        Public Function UserExists(user As User) As Boolean
'            If user Is Nothing Then
'                Return False
'            End If

'            Return (entities.Users.SingleOrDefault(Function(u) u.ID = user.ID OrElse u.UserName = user.UserName) IsNot Nothing)
'        End Function

'        Public Function RoleExists(role As Role) As Boolean
'            If role Is Nothing Then
'                Return False
'            End If

'            Return (entities.Roles.SingleOrDefault(Function(r) r.ID = role.ID OrElse r.Name = role.Name) IsNot Nothing)
'        End Function

'#End Region

'    End Class

'End Namespace