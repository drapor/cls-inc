Imports modelCLS

Partial Class Page_Client_member_inscription_memberchoice
    Inherits masterPage
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim cours As Integer = Session("idCoursSelected")
        dsCours.WhereParameters("cours").DefaultValue = cours
        dsGroupes.WhereParameters("groupeID").DefaultValue = Session("idGroupeSelected")
        dsMembreFamille.WhereParameters("familleID").DefaultValue = Session("idFamille")
    End Sub

    Sub retourCategorie(sender As Object, e As EventArgs)
        Dim categorie As String = Request.QueryString("categorie")
        Dim url As String
        url = "../Client/member_description.aspx?categorie=" & (Session("categorie").ToString)
        Response.Redirect(url)
    End Sub

    Protected Sub lvGroupes_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvMembreInscrire.ItemCommand
        If e.CommandName = "inscription" Then
            Dim idMembreInscrit As Integer = FindChildControl(Of DropDownList)(lvMembreInscrire, "ddlMembreFamille").SelectedValue
        End If
    End Sub

    Sub inscriptionMembre(sender As Object, e As EventArgs)
        Dim entCommande As New modelCLSContainer
        Dim cookie As HttpCookie = Request.Cookies("panier")
        Dim unItemPanier As ItemPanierJeu = Nothing
        unItemPanier = ItemPanierJeu.CreateItemPanierJeu(0, Session("idGroupeSelected"), ddlMembreFamille.SelectedItem.Value, cookie.Values("idPanier"))
        entCommande.ItemPanierJeu.AddObject(unItemPanier)
        entCommande.SaveChanges()
        Response.Redirect(Request.RawUrl)
    End Sub

    Sub ddlMembreFamille_databound(sender As Object, e As EventArgs)
        Dim ddlMembreFamille As DropDownList = CType(sender, DropDownList)

        If ddlMembreFamille.SelectedItem Is Nothing Then
        Else
            Dim listeMembreDeleter As New List(Of Integer)

            Dim index As Integer = 0
            For Each membre As ListItem In ddlMembreFamille.Items
                If ageRequis(membre.Value, Session("idCoursSelected")) And dansPanier(membre.Value, Session("idGroupeSelected")) = False And dansAbonnement(membre.Value, Session("idGroupeSelected")) = False Then
                Else
                    listeMembreDeleter.Add(index)
                End If
                index += 1
            Next

            Dim indexInitialListe As Integer = listeMembreDeleter.Count - 1
            For i As Integer = 0 To listeMembreDeleter.Count - 1
                ddlMembreFamille.Items.RemoveAt(listeMembreDeleter(indexInitialListe))
                indexInitialListe -= 1
            Next
        End If

        If ddlMembreFamille.Items.Count = 0 Then
            lblMembre.Visible = False
            ddlMembreFamille.Visible = False
            btnRegisterMember.Visible = False
            lblErreur.Visible = True
        End If
    End Sub


End Class
