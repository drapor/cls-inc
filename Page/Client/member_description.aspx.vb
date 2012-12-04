Imports modelCLS
Partial Class Page_Client_member_description
    Inherits masterPage

    Dim leContext As New modelCLSContainer
    Dim nbGroupeComplet As New Integer
    Dim noGroupeActuel As New Integer

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        nbGroupeComplet = 0
        Dim cours As Integer = Session("idCours")
        dsCours.WhereParameters("cours").DefaultValue = cours
        dsGroupes.WhereParameters("coursID").DefaultValue = cours
        Dim categorie As String = Request.QueryString("categorie")
        Session("categorie") = categorie
        If categorie = "Sport" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/sports_banner.png"
        ElseIf categorie = "Loisir" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/loisir_banner.png"
        ElseIf categorie = "Culture" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/culture_banner.png"
        End If
        lblNomCours.Text = FindChildControl(Of HiddenField)(lvCours, "hiddenNomCours").Value.ToString
    End Sub

    Sub inscriptionCours(sender As Object, e As EventArgs)
        Session("idCoursSelected") = Session("idCours")
        Session("idGroupeSelected") = CType(sender, Button).CommandArgument.ToString
        Response.Redirect("~/Page/Client/member_inscription_memberchoice.aspx")
    End Sub

    Sub inscriptionListeAttente(sender As Object, e As EventArgs)
        Session("idCoursSelected") = Session("idCours")
        Response.Redirect("~/Page/Client/member_inscription_waitinglist.aspx")
    End Sub

    Sub retourCategorie(sender As Object, e As EventArgs)
        Dim categorie As String = Request.QueryString("categorie")
        Dim url As String
        url = "../Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub

    Protected Sub lvGroupes_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvGroupes.ItemDataBound
        Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
        Dim idGroupe As Integer = lvGroupes.DataKeys(dataItem.DisplayIndex).Value.ToString()
        Dim dataSourceHoraire As EntityDataSource = FindChildControl(Of EntityDataSource)(dataItem , "dsHoraire")
        Dim hiddenNoGroupe As HiddenField = FindChildControl(Of HiddenField)(lvGroupes, "hiddenNoGroupe")
        dataSourceHoraire.WhereParameters("groupeID").DefaultValue = idGroupe

        'Affichage du nombre de place d'un groupe
        Dim lblPlaceRestante As Label = CType(e.Item.FindControl("lblNbPlace"), Label)
        Dim nbPlaceRestante As Integer = calculeNbPlaceRestante(idGroupe)
        If nbPlaceRestante = 0 Then
            Dim imageComplet As Image = CType(e.Item.FindControl("completeImage"), Image)
            Dim lblComplet As Label = CType(e.Item.FindControl("lblGroupeComplet"), Label)
            Dim lblNbPlaceRestanteTexte As Label = CType(e.Item.FindControl("lblNbPlaceRestant"), Label)
            Dim lblNbPlaceRestante As Label = CType(e.Item.FindControl("lblNbPlace"), Label)
            Dim btnInscription As Button = CType(e.Item.FindControl("btnJeMinscris"), Button)
            btnInscription.Visible = False
            imageComplet.Visible = True
            lblComplet.Visible = True
            lblNbPlaceRestante.Visible = False
            lblNbPlaceRestanteTexte.Visible = False
        Else
            Dim imageComplet As Image = CType(e.Item.FindControl("completeImage"), Image)
            imageComplet.Visible = False
            lblPlaceRestante.Text = nbPlaceRestante
        End If

        'Affichage du bouton Inscription à la liste d'attente
        Dim btnInscrire As Button = CType(e.Item.FindControl("btnJeMinscris"), Button)
        If btnInscrire.Visible = False Then
            Dim btnListeAttente As Button = FindChildControl(Of Button)(lvGroupes, "btnInscriptionListeAttente")
            btnListeAttente.Visible = True
        Else
            Dim btnListeAttente As Button = FindChildControl(Of Button)(lvGroupes, "btnInscriptionListeAttente")
            btnListeAttente.Visible = False
        End If

    End Sub

#Region "Calcule du nombre de place restante dans un groupe"
    Public Function calculeNbPlaceRestante(ByVal idGroupe As Integer) As Integer
        Dim leGroupe As GroupeJeu = (From A In leContext.GroupeJeu Where (A.idGroupe = idGroupe) Select A).FirstOrDefault
        Dim nbAbonne As Integer = (From A In leContext.AbonnementJeu Where (A.Groupe_idGroupe = idGroupe) Select A).Count
        Dim placeRestante As Integer = leGroupe.nbMax - nbAbonne
        Return placeRestante
    End Function
#End Region

End Class
