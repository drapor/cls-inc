Imports modelCLS
Imports masterPage
Partial Class Page_Autre_register
    Inherits System.Web.UI.Page

    Dim entClient As modelCLSContainer = New modelCLSContainer

    Dim idFamille As Integer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim famille = entClient.MembresJeu.OrderBy(Function(n) n.idMembre).[Select](Function(n) n.familleID).Any
        imgFailEmail.Visible = False
        lblEmailErro.Visible = False
        If famille = Nothing Then
            idFamille = 1
        Else
            idFamille = entClient.MembresJeu.OrderBy(Function(n) n.idMembre).[Select](Function(n) n.familleID).Max + 1
        End If
    End Sub

    Sub emailVerification(sender As Object, e As EventArgs)
        Dim utilisateur = (From A In entClient.MembresJeu Where (A.courriel = txtCourriel.Text) Select A).Any
        If utilisateur = Nothing Then
        Else
            imgFailEmail.Visible = True
            lblEmailErro.Visible = True
            SetFocus(txtCourriel)
        End If
    End Sub
    Sub inscription(sender As Object, e As EventArgs)
        Dim utilisateur = (From A In entClient.MembresJeu Where (A.courriel = txtCourriel.Text) Select A).Any
        If utilisateur = Nothing Then
            Dim aCookie As New HttpCookie("inscription")
            aCookie.Values("prenom") = txtPrenom.Text
            aCookie.Values("nom") = txtNom.Text
            aCookie.Values("adresse") = txtAdresse.Text
            aCookie.Values("codePostal") = txtCodePostal.Text
            aCookie.Values("courriel") = txtCourriel.Text
            aCookie.Values("dateNaissance") = txtDate.Text
            aCookie.Values("motDePasse") = txtMDP.Text
            aCookie.Values("telephone") = txtTelephone.Text
            aCookie.Values("ville") = txtVille.Text
            aCookie.Values("sexe") = rdbtnSexe.SelectedItem.Value
            aCookie.Values("dateInscription") = System.DateTime.Now.ToShortDateString
            aCookie.Values("idFamille") = idFamille
            aCookie.Expires.AddDays(1)
            Response.Cookies.Add(aCookie)
            Response.Redirect("~/Page/Autre/inscription_paiement.aspx")
        Else
            imgFailEmail.Visible = True
            lblEmailErro.Visible = True
            SetFocus(txtCourriel)
        End If
    End Sub

End Class
