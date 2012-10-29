
Partial Class Page_login
    Inherits System.Web.UI.Page



 

    Public Sub Login_OnClick(sender As Object, args As EventArgs)

        If (Membership.ValidateUser(txtUsername.Text, txtPassword.Text)) Then
            FormsAuthentication.RedirectFromLoginPage(txtUsername.Text, NotPublicCheckBox.Checked)
        Else
            Msg.Text = "La connexion a échoué. Veuillez entrer votre adresse courriel et votre mot de passe à nouveau."
        End If

    End Sub
End Class
