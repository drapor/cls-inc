Imports System.IO
Imports masterPage
Imports modelCLS
Partial Class Site
    Inherits System.Web.UI.MasterPage


    Dim categorie As String = Nothing
    Dim url As String
    Dim entPanier As New modelCLSContainer

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
                Dim cookie As HttpCookie = Request.Cookies("noPanier")
                If cookie Is Nothing Then
                Else
                    Dim noPanier As Integer = cookie.Values("noPanier")
                    Dim utilisateur As Integer = (From A In entPanier.ItemPanierJeu Where (A.Panier_idCommande = noPanier) Select A).Count
                    lnkNumberItemCart.Text = "(" & utilisateur & ")"
                End If
                
            End If

            If (Session("membreIDList") IsNot Nothing) Then
                Dim membreID As List(Of String) = Session("membreIDList")
                Dim nombreItemCart = membreID.Count
                lnkNumberItemCart.Text = "(" & nombreItemCart & ")"
            Else
            End If
        End If
    End Sub


    Sub redirectionCourriel(sender As Object, e As EventArgs)
        If HttpContext.Current.User.IsInRole("Administrateur") Then
            Response.Redirect("~/Page/Admin/admin_home.aspx")
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

