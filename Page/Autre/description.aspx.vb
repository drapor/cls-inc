﻿
Partial Class Page_Autre_description
    Inherits masterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim cours As Integer = Session("idCours")
        dsCours.WhereParameters("cours").DefaultValue = cours
        dsGroupes.WhereParameters("coursID").DefaultValue = cours

        Dim categorie As String = Request.QueryString("categorie")
        If categorie = "Sport" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/sports_banner.png"
        ElseIf categorie = "Loisir" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/loisir_banner.png"
        ElseIf categorie = "Culture" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/culture_banner.png"
        End If
        lblNomCours.Text = FindChildControl(Of HiddenField)(lvCours, "hiddenNomCours").Value.ToString

    End Sub

    Sub retourCategorie(sender As Object, e As EventArgs)
        Dim categorie As String = Request.QueryString("categorie")
        Dim url As String
        url = "../Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub

    Sub redirection(sender As Object, e As EventArgs)
        If User.Identity.IsAuthenticated = False Then
            MsgBox("Vous devez être inscrit chez CLS pour pouvoir vous inscrire à une activité.", MsgBoxStyle.OkOnly, "Inscription")
            Response.Redirect("~/Page/login.aspx")
        Else
        End If
    End Sub
End Class
