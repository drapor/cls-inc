Imports modelCLS

Partial Class Page_Client_member_inscription_waitinglist
    Inherits masterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim cours As Integer = Session("idCoursSelected")
        dsCours.WhereParameters("cours").DefaultValue = cours
        dsMembreFamille.WhereParameters("familleID").DefaultValue = Session("idFamille")
        Dim hiddenCours As HiddenField = FindChildControl(Of HiddenField)(lvListeAttente, "hiddenCoursID")
        hiddenCours.Value = Session("idCoursSelected")
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
        Dim membreSelectionner As DropDownList = FindChildControl(Of DropDownList)(lvListeAttente, "ddlMembreFamille")
        unItemPanier = ItemPanierJeu.CreateItemPanierJeu(0, Session("idGroupeSelected"), membreSelectionner.SelectedItem.Value, cookie.Values("idPanier"))
        entCommande.ItemPanierJeu.AddObject(unItemPanier)
        entCommande.SaveChanges()
        Response.Redirect(Request.Url.AbsoluteUri, False)
    End Sub

#Region "Traitements des erreurs"
    Protected Sub dsListeAttente_Inserted(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsListeAttente.Inserted
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE L'AJOUT À LA LISTE D'ATTENTE", e.Exception)
            e.ExceptionHandled = True
            failImage.Visible = True
            lblFailure.Visible = True
            lblFailure.Text = "Une erreur s'est produite lors de l'ajout a la liste d'attente..."
        Else
            checkImage.Visible = True
            lblFelicitation.Visible = True
            lblFelicitation.Text = "Votre nom a &eacute;t&eacute; ajout&eacute; avec succ&egrave;s a la liste d'attente !"
        End If
    End Sub
#End Region

End Class
