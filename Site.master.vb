Imports System.IO
Imports masterPage
Partial Class Site
    Inherits System.Web.UI.MasterPage


    Dim categorie As String = Nothing
    Dim url As String

#Region "Redirection des boutons de catégorie"
    Protected Sub btnCulture_Click(sender As Object, e As System.EventArgs) Handles btnCulture.Click
        categorie = btnCulture.Text
        url = "~/Page/Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub

    Protected Sub btnLoisir_Click(sender As Object, e As System.EventArgs) Handles btnLoisir.Click
        categorie = btnLoisir.Text
        url = "~/Page/Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub

    Protected Sub btnSport_Click(sender As Object, e As System.EventArgs) Handles btnSport.Click
        categorie = btnSport.Text
        url = "~/Page/Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub
#End Region

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If HttpContext.Current.User.Identity.IsAuthenticated = True Then

            'Apparition des boutons de l'utilisateur
            lnkConnecter.Visible = False
            lnkInscrire.Visible = False
            lnkUserName.Visible = True
            lnkLogOut.Visible = True
            lnkProfile.Visible = True
            imgProfileIcon.Visible = True
            lnkUserName.Text = HttpContext.Current.User.Identity.Name

            If HttpContext.Current.User.IsInRole("Administrateur") Then
            Else
                imgCart.Visible = True
                lnkNumberItemCart.Visible = True
            End If
            

            If (Session("membreIDList") IsNot Nothing) Then
                Dim membreID As List(Of String) = Session("membreIDList")
                Dim nombreItemCart = membreID.Count
                lnkNumberItemCart.Text = "(" & nombreItemCart & ")"
            Else
                lnkNumberItemCart.Text = "(0)"
            End If
        End If
    End Sub


    Sub redirectionCourriel(sender As Object, e As EventArgs)
        If HttpContext.Current.User.IsInRole("Administrateur") Then
            Response.Redirect("~/Page/Admin/home_admin.aspx")
        ElseIf HttpContext.Current.User.IsInRole("Employé") Then
            Response.Redirect("~/Page/Employe/home_employe.aspx")
        ElseIf HttpContext.Current.User.IsInRole("Adulte") Then
            Response.Redirect("~/Page/Client/home_member.aspx")
        End If
    End Sub

    Sub redirectionProfil(sender As Object, e As EventArgs)
        If HttpContext.Current.User.IsInRole("Administrateur") Then
            Response.Redirect("~/Page/Employe/home_employe.aspx")
        ElseIf HttpContext.Current.User.IsInRole("Employé") Then
            Response.Redirect("~/Page/Employe/home_employe.aspx")
        ElseIf HttpContext.Current.User.IsInRole("Adulte") Then
            Response.Redirect("~/Page/Client/home_member.aspx")
        End If
    End Sub

    Protected Sub lnkLogOut_Click(sender As Object, e As System.EventArgs) Handles lnkLogOut.Click
        Session("idUser") = Nothing
        Session("groupeIDList") = Nothing
        Session("coursIDList") = Nothing
        Session("membreIDList") = Nothing
        FormsAuthentication.SignOut()
        Response.Redirect("~/Page/login.aspx")
    End Sub



End Class

