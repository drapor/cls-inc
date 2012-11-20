
Partial Class Page_login
    Inherits masterPage

    Protected Sub loginCLS_LoggedIn(sender As Object, e As System.EventArgs) Handles loginCLS.LoggedIn
        If (Membership.ValidateUser(loginCLS.UserName.ToString, loginCLS.Password.ToString)) Then
            Dim role As String = CustomMembershipProvider.GetRoleForUser(loginCLS.UserName.ToString)
            If (Roles.IsUserInRole(loginCLS.UserName.ToString, role)) Then
                Session("idUser") = CustomMembershipProvider.GetUserId(loginCLS.UserName.ToString)
                Session.Timeout = 10
                If role = "Administrateur" Then
                    Response.Redirect("~/Page/Admin/admin_home.aspx")
                ElseIf role = "Employé" Then
                    Response.Redirect("~/Page/Employe/home_employe.aspx")
                ElseIf role = "Adulte" Then
                    Response.Redirect("~/Page/Client/home_member.aspx")
                Else
                    Response.Redirect("~/Page/Default.aspx")
                End If
            End If
        Else
            Msg.Text = "Le nom d'utilisateur ou le mot de passe ne correspond pas."
        End If
    End Sub
End Class
