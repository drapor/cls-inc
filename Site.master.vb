'Créé par Samuel Bellerose
'Le 16 septembre 2012
'Dernière mise à jour le 26 novembre 2012

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

    Sub search(sender As Object, e As EventArgs)
        Dim searchRequest As String = txtSearch.Text
        url = "~/Page/Autre/search.aspx?searchResult=" & searchRequest
        Response.Redirect(url)
    End Sub

    'Événement Page_Load affiche les boutons de l'utilisateur, récupère le panier de l'utilisateur s'il en a un et affiche le nombre d'item dans le cart
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

                Dim membreConnecter As MembresJeu = (From A In entPanier.MembresJeu Where (A.courriel = HttpContext.Current.User.Identity.Name) Select A).FirstOrDefault
                Dim idMembreConnecter As Integer = membreConnecter.idMembre
                Dim panierExistant As PanierJeu = (From A In entPanier.PanierJeu Where (A.MembresJeu_idMembre = idMembreConnecter) Select A).FirstOrDefault
                If panierExistant IsNot Nothing Then
                    Dim nbItemCart As Integer = (From A In entPanier.ItemPanierJeu Where (A.Panier_idCommande = panierExistant.idCommande) Select A).Count
                    Dim panierCookie As HttpCookie = Request.Cookies("panier")
                    If panierCookie IsNot Nothing Then
                        Dim nouveauCookie As New HttpCookie("panier")
                        lnkNumberItemCart.Text = "(" & nbItemCart & ")"
                        nouveauCookie.Values("idPanier") = panierExistant.idCommande
                        nouveauCookie.Values("idMembre") = panierExistant.MembresJeu_idMembre
                        nouveauCookie.Expires = System.DateTime.Now.AddDays(365)
                        Response.Cookies.Add(nouveauCookie)
                    Else
                        Dim nouveauCookie As New HttpCookie("panier")
                        nouveauCookie.Values("idPanier") = panierExistant.idCommande
                        nouveauCookie.Values("idUser") = panierExistant.MembresJeu_idMembre
                        nouveauCookie.Expires = System.DateTime.Now.AddDays(365)
                        Response.Cookies.Add(nouveauCookie)
                        lnkNumberItemCart.Text = "(" & nbItemCart & ")"
                    End If
                Else
                    lnkNumberItemCart.Text = "(0)"
                    Dim nouveauCookie As New HttpCookie("panier")
                    nouveauCookie.Values("idMembre") = Session("idUser")
                    Dim unPanier As PanierJeu = Nothing
                    unPanier = PanierJeu.CreatePanierJeu(0, Session("idUser"))
                    entPanier.PanierJeu.AddObject(unPanier)
                    entPanier.SaveChanges()
                    nouveauCookie.Values("idPanier") = unPanier.idCommande
                    nouveauCookie.Expires = System.DateTime.Now.AddDays(365)
                    Response.Cookies.Add(nouveauCookie)
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

    'Redirige vers la bonne page d'accueil selon le role de l'utilisateur en cliquant sur le bouton courriel
    Sub redirectionCourriel(sender As Object, e As EventArgs)
        If HttpContext.Current.User.IsInRole("Administrateur") Then
            Response.Redirect("~/Page/Admin/admin_home.aspx")
        ElseIf HttpContext.Current.User.IsInRole("Employé") Then
            Response.Redirect("~/Page/Employe/home_employe.aspx")
        ElseIf HttpContext.Current.User.IsInRole("Adulte") Then
            Response.Redirect("~/Page/Client/home_member.aspx")
        End If
    End Sub

    'Redirige vers la bonne page d'accueil selon le role de l'utilisateur en cliquant sur le bouton profil
    Sub redirectionProfil(sender As Object, e As EventArgs)
        If HttpContext.Current.User.IsInRole("Administrateur") Then
            Response.Redirect("~/Page/Admin/admin_home.aspx")
        ElseIf HttpContext.Current.User.IsInRole("Employé") Then
            Response.Redirect("~/Page/Employe/home_employe.aspx")
        ElseIf HttpContext.Current.User.IsInRole("Adulte") Then
            Response.Redirect("~/Page/Client/home_member.aspx")
        End If
    End Sub

    'Remet les objets session à nothing lorsque l'on se déconnecte
    Protected Sub lnkLogOut_Click(sender As Object, e As System.EventArgs) Handles lnkLogOut.Click
        Session("idUser") = Nothing
        Session("groupeIDList") = Nothing
        Session("coursIDList") = Nothing
        Session("membreIDList") = Nothing
        FormsAuthentication.SignOut()
        Response.Redirect("~/Page/login.aspx")
    End Sub



End Class

