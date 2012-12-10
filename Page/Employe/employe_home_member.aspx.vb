'Créé par Francis Griggs
'Le 6 septembre 2012
'Dernière mise à jour le 29 octobre 2012
'Classe partielle qui crée un objet session pour stocké certaines informations utiles sur d'autres pages du site. Récupère le queryString pour l'affichage du bon membre.
'Affiche ou rend invible certains contrôles selon l'Item Command et finalement vérifie si certaines données sont présentes dans la BD.

Imports modelCLS
Imports masterPage
Partial Class Page_Employe_employe_home_member
    Inherits System.Web.UI.Page

    Public entClient As modelCLSContainer = New modelCLSContainer

    'Récupère le queryString et crée plusieurs objets session
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Dim idClient As Integer = Session("idmembre")
        Dim idFamille As String = entClient.MembresJeu.Where(Function(n) n.idMembre = idClient).OrderBy(Function(n) n.idMembre).[Select](Function(n) n.familleID).First

        Session("userCourriel") = entClient.MembresJeu.Where(Function(n) n.idMembre = idClient).OrderBy(Function(n) n.idMembre).[Select](Function(n) n.courriel).First
        Session("userMotPasse") = entClient.MembresJeu.Where(Function(n) n.idMembre = idClient).OrderBy(Function(n) n.idMembre).[Select](Function(n) n.motPasse).First
        Session("idFamille") = entClient.MembresJeu.Where(Function(n) n.idMembre = idClient).OrderBy(Function(n) n.idMembre).[Select](Function(n) n.familleID).First
        Session("userAdresse") = entClient.MembresJeu.Where(Function(n) n.idMembre = idClient).OrderBy(Function(n) n.idMembre).[Select](Function(n) n.adresse).First
        Session("userVille") = entClient.MembresJeu.Where(Function(n) n.idMembre = idClient).OrderBy(Function(n) n.idMembre).[Select](Function(n) n.ville).First
        Session("userTelephone") = entClient.MembresJeu.Where(Function(n) n.idMembre = idClient).OrderBy(Function(n) n.idMembre).[Select](Function(n) n.telephoneMembre).First
        Session("userCodePostal") = entClient.MembresJeu.Where(Function(n) n.idMembre = idClient).OrderBy(Function(n) n.idMembre).[Select](Function(n) n.codePostal).First

        dsListView.WhereParameters("membreID").DefaultValue = idClient

        dsAbonnement.WhereParameters("membreID").DefaultValue = idClient

        dsFamille.WhereParameters("idFamille").DefaultValue = idFamille

    End Sub

    'Gère l'événement itemCommand du listview lvInfoMembre pour contrôler la visibilité de certains contrôles
    Protected Sub lvInfoMembre_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvInfoMembre.ItemCommand

        Dim btnHideCourriel As LinkButton = FindChildControl(Of LinkButton)(lvCourriel, "btnModifierCourriel")
        Dim btnHideMP As LinkButton = FindChildControl(Of LinkButton)(lvMotPasse, "btnModifierMP")
        Dim btnHideAfficherFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnAfficherFamille")
        Dim btnHideSupprimerFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnSupprimerFamille")
        Dim btnHideAjouterFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnAjouterFamille")

        If e.CommandName = "Edit" Then
            btnHideCourriel.Visible = False
            btnHideMP.Visible = False
        Else
            btnHideCourriel.Visible = True
            btnHideMP.Visible = True
        End If
    End Sub

    'Gère l'événement itemCommand du listview lvCourriel pour contrôler la visibilité de certains contrôles
    Protected Sub lvCourriel_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvCourriel.ItemCommand

        Dim btnHideInfo As Button = FindChildControl(Of Button)(lvInfoMembre, "btnModifier")
        Dim btnHideMP As LinkButton = FindChildControl(Of LinkButton)(lvMotPasse, "btnModifierMP")
        Dim btnHideAfficherFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnAfficherFamille")
        Dim btnHideSupprimerFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnSupprimerFamille")
        Dim btnHideAjouterFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnAjouterFamille")

        If e.CommandName = "Edit" Then
            btnHideInfo.Visible = False
            btnHideMP.Visible = False
        Else
            btnHideInfo.Visible = True
            btnHideMP.Visible = True
        End If
    End Sub

    'Gère l'événement itemCommand du listview lvMotPasse pour contrôler la visibilité de certains contrôles
    Protected Sub lvMotPasse_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvMotPasse.ItemCommand
        Dim btnHideInfo As Button = FindChildControl(Of Button)(lvInfoMembre, "btnModifier")
        Dim btnHideCourriel As LinkButton = FindChildControl(Of LinkButton)(lvCourriel, "btnModifierCourriel")
        Dim btnHideAfficherFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnAfficherFamille")
        Dim btnHideSupprimerFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnSupprimerFamille")
        Dim btnHideAjouterFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnAjouterFamille")

        If e.CommandName = "Edit" Then
            btnHideInfo.Visible = False
            btnHideCourriel.Visible = False
        Else
            btnHideInfo.Visible = True
            btnHideCourriel.Visible = True
        End If
    End Sub

    'Gère l'événement itemCommand du listview lvFamille qui redirige vers la page member_family du idMembre du datakeyNames
    Protected Sub lvFamille_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvFamille.ItemCommand
        Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
        Dim idMembre As Integer = lvFamille.DataKeys(dataItem.DisplayIndex).Value.ToString()

        Session("idMembreFamille") = idMembre

        If e.CommandName = "afficher" Then
            Response.Redirect("../Employe/employe_member_family.aspx")
        End If

    End Sub

    'Met à jour le courriel à partir du textBox
    Protected Sub lvCourriel_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.ListViewUpdateEventArgs) Handles lvCourriel.ItemUpdating
        Dim txtCourriel As TextBox = FindChildControl(Of TextBox)(lvCourriel, "txtNouveauCourriel")

        e.NewValues("courriel") = txtCourriel.Text
    End Sub

    'Met à jour le nouveau mot de passe
    Protected Sub lvMotPasse_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.ListViewUpdateEventArgs) Handles lvMotPasse.ItemUpdating

        Dim txtMP As TextBox = FindChildControl(Of TextBox)(lvMotPasse, "txtNouveauMP")

        e.NewValues("motPasse") = txtMP.Text

    End Sub

    'Valide le courriel pour s'assurer qu'il n'est pas déjà utilisé
    Sub validationCourriel(sender As Object, args As ServerValidateEventArgs)

        Dim txtCourriel As TextBox = FindChildControl(Of TextBox)(lvCourriel, "txtNouveauCourriel")

        Dim utilisateur = (From A In entClient.MembresJeu Where (A.courriel = txtCourriel.Text) Select A).Any

        If utilisateur = Nothing Then
            args.IsValid = True
        Else
            args.IsValid = False
            SetFocus(txtCourriel)
        End If
    End Sub

    'Valide le mot de passe pour les mots de passes fourni soient identique
    Sub validationMotPasse(sender As Object, args As ServerValidateEventArgs)

        Dim txtVieuxMP As TextBox = FindChildControl(Of TextBox)(lvMotPasse, "txtPresentMP")

        If txtVieuxMP.Text = Session("membrePrincipalMotPasse") Then
            args.IsValid = True
        Else
            args.IsValid = False
            SetFocus(txtVieuxMP)
        End If
    End Sub

End Class

