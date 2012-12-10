'Créé par Francis Griggs
'Le 26 septembre 2012
'Dernière mise à jour le 2 décembre 2012

Imports modelCLS

Partial Class Page_Client_member_inscription_waitinglist
    Inherits masterPage

    Dim leContext As New modelCLSContainer
    Dim ajout As Boolean = False

    'Événement Page_Load qui set le whereparameter des datasources dsCours et dsMembreFamille
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim cours As Integer = Session("idCoursSelected")
        dsCours.WhereParameters("cours").DefaultValue = cours
        dsMembreFamille.WhereParameters("familleID").DefaultValue = Session("idFamille")
        Dim hiddenCours As HiddenField = FindChildControl(Of HiddenField)(lvListeAttente, "hiddenCoursID")
        hiddenCours.Value = Session("idCoursSelected")
    End Sub

    'recupère la catégorie grace au queryString et redirige la page vers la page description de la bonne catégorie
    Sub retourCategorie(sender As Object, e As EventArgs)
        Dim categorie As String = Request.QueryString("categorie")
        Dim url As String
        url = "../Client/member_description.aspx?categorie=" & (Session("categorie").ToString)
        Response.Redirect(url)
    End Sub

    'Événement dataBound du dropdownlist ddlMembreFamille qui met à jour le dropdownlist losqu'un membre s'inscrit dans la liste d'attente
    Sub ddlMembreFamille_databound(sender As Object, e As EventArgs)
        Dim ddlMembreFamille As DropDownList = CType(sender, DropDownList)

        If ddlMembreFamille.SelectedItem Is Nothing Then
        Else
            Dim listeMembreDeleter As New List(Of Integer)

            Dim index As Integer = 0
            For Each membre As ListItem In ddlMembreFamille.Items
                If ageRequis(membre.Value, Session("idCoursSelected")) And dansLaListeDattente(membre.Value, Session("idCoursSelected")) = False And dansAbonnement(membre.Value, Session("idGroupeSelected")) = False Then
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
            Dim lblMembre As Label = FindChildControl(Of Label)(lvListeAttente, "lblMembre")
            Dim ddlListeMembre As DropDownList = FindChildControl(Of DropDownList)(lvListeAttente, "ddlMembreFamille")
            Dim btnInscrire As Button = FindChildControl(Of Button)(lvListeAttente, "btnRegisterMember")
            lblMembre.Visible = False
            ddlListeMembre.Visible = False
            btnInscrire.Visible = False
            lblErreur.Visible = True
        End If

        If ajout Then
            lblErreur.Visible = False
        End If
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
            ajout = True
        End If
    End Sub
#End Region


End Class
