'Créé par Francis Griggs
'Le 14 septembre 2012
'Dernière mise à jour le 8 décembre 2012

Imports modelCLS

Partial Class Page_Employe_home_employe
    Inherits masterPage

    Public entClient As modelCLSContainer = New modelCLSContainer

    Dim idFamille As Integer = Nothing

    'Événement Page_Load qui sélectionne la view du multiview à afficher
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        dsListView.WhereParameters("membreID").DefaultValue = Session("idUser")

        Dim famille = entClient.MembresJeu.OrderBy(Function(n) n.idMembre).[Select](Function(n) n.familleID).Any

        If famille = Nothing Then
            idFamille = 1
        Else
            idFamille = entClient.MembresJeu.OrderBy(Function(n) n.idMembre).[Select](Function(n) n.familleID).Max
        End If

        If Request.QueryString("view") = 0 Then
            MVEmploye.ActiveViewIndex = 0
        ElseIf Request.QueryString("view") = 1 Then
            MVEmploye.ActiveViewIndex = 1
        Else
            MVEmploye.ActiveViewIndex = 2
        End If

        If dropDownType.SelectedValue = 0 Then
            MVPrincipal.ActiveViewIndex = 0
            dsMembre.OrderBy = "it.nomMembre"
        Else
            MVPrincipal.ActiveViewIndex = 1
            dsMembre.OrderBy = "it.courriel"
        End If
    End Sub

    'Gère l'événement itemCommand du listview lvInfoMembre pour contrôler la visibilité de certains contrôles
    Protected Sub lvInfoMembre_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvInfoMembre.ItemCommand

        Dim btnHideCourriel As LinkButton = FindChildControl(Of LinkButton)(lvCourriel, "btnModifierCourriel")
        Dim btnHideMP As LinkButton = FindChildControl(Of LinkButton)(lvMotPasse, "btnModifierMP")

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

        If e.CommandName = "Edit" Then
            btnHideInfo.Visible = False
            btnHideCourriel.Visible = False

        Else
            btnHideInfo.Visible = True
            btnHideCourriel.Visible = True
        End If
    End Sub

    'Événement ItemInserting du listview lvNouveauMembre inscrit le nouveau membre dans la BD
    Protected Sub lvNouveauMembre_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvNouveauMembre.ItemInserting
        Dim rolePrincipal As Short = 3

        e.Values("dateInscription") = Date.Now.ToShortDateString
        e.Values("familleID") = CType(idFamille + 1, Short)
        e.Values("RoleJeu_idRole") = rolePrincipal
    End Sub

    'Événement ItemUpdating du listview lvCourriel qui met à jour le courriel
    Protected Sub lvCourriel_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.ListViewUpdateEventArgs) Handles lvCourriel.ItemUpdating
        Dim txtCourriel As TextBox = FindChildControl(Of TextBox)(lvCourriel, "txtNouveauCourriel")

        e.NewValues("courriel") = txtCourriel.Text
    End Sub

    'Événement ItemUpdating du listview lvMotPasse qui met à jour le mot de passe
    Protected Sub lvMotPasse_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.ListViewUpdateEventArgs) Handles lvMotPasse.ItemUpdating

        Dim txtMP As TextBox = FindChildControl(Of TextBox)(lvMotPasse, "txtNouveauMP")

        e.NewValues("motPasse") = txtMP.Text

    End Sub

    'Valide le courriel pour qu'il ne soit pas déjà utilisé
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

    'Valide le mot de passe pour que les mot de passes fourni soient identique
    Sub validationMotPasse(sender As Object, args As ServerValidateEventArgs)

        Dim txtVieuxMP As TextBox = FindChildControl(Of TextBox)(lvMotPasse, "txtPresentMP")

        If txtVieuxMP.Text = Session("membrePrincipalMotPasse") Then
            args.IsValid = True
        Else
            args.IsValid = False
            SetFocus(txtVieuxMP)
        End If
    End Sub

    'Événement ItemCommand du listview lvMembreCourriel qui affiche la page du membre à partir du datakeynames
    Protected Sub lvMembreCourriel_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvMembreCourriel.ItemCommand
        Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
        Dim idMembre As Integer = lvMembreCourriel.DataKeys(dataItem.DisplayIndex).Value.ToString()

        Session("idMembre") = idMembre

        If e.CommandName = "Afficher" Then
            Response.Redirect("../Employe/employe_home_member.aspx")
        End If

    End Sub

    'Événement ItemCommand du listview lvMembreNom qui affiche la page du membre à partir du datakeynames
    Protected Sub lvMembreNom_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvMembreNom.ItemCommand
        Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
        Dim idMembre As Integer = lvMembreNom.DataKeys(dataItem.DisplayIndex).Value.ToString()

        Session("idMembre") = idMembre

        If e.CommandName = "Afficher" Then
            Response.Redirect("../Employe/employe_home_member.aspx")
        End If

    End Sub
End Class
