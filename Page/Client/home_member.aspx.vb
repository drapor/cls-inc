Imports modelCLS
Imports masterPage

Partial Class Page_Client_home_member
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim idClient As Integer = CType(Request.QueryString("idMembre"), Integer)
        dsListView.WhereParameters("membreID").DefaultValue = idClient
    End Sub

    Protected Sub lvInfoMembre_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvInfoMembre.ItemCommand

        Dim btnHideCourriel As LinkButton = FindChildControl(Of LinkButton)(lvCourriel, "btnModifierCourriel")
        Dim btnHideMP As LinkButton = FindChildControl(Of LinkButton)(lvMotPasse, "btnModifierMP")
        Dim btnHideAfficherFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnAfficherFamille")
        Dim btnHideSupprimerFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnSupprimerFamille")

        If e.CommandName = "Edit" Then
            btnAjouterFamille.Visible = False
            btnHistorique.Visible = False
            btnHideCourriel.Visible = False
            btnHideMP.Visible = False
            btnAjouterFamille.Visible = False
            btnHideAfficherFamille.Visible = False
            btnHideSupprimerFamille.Visible = False

        Else
            btnAjouterFamille.Visible = True
            btnHistorique.Visible = True
            btnHideCourriel.Visible = True
            btnHideMP.Visible = True
            btnAjouterFamille.Visible = True
            btnHideAfficherFamille.Visible = True
            btnHideSupprimerFamille.Visible = True
        End If
    End Sub

    Protected Sub lvCourriel_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvCourriel.ItemCommand

        Dim btnHideInfo As Button = FindChildControl(Of Button)(lvInfoMembre, "btnModifier")
        Dim btnHideMP As LinkButton = FindChildControl(Of LinkButton)(lvMotPasse, "btnModifierMP")
        Dim btnHideAfficherFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnAfficherFamille")
        Dim btnHideSupprimerFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnSupprimerFamille")

        If e.CommandName = "Edit" Then
            btnAjouterFamille.Visible = False
            btnHistorique.Visible = False
            btnHideInfo.Visible = False
            btnHideMP.Visible = False
            btnAjouterFamille.Visible = False
            btnHideAfficherFamille.Visible = False
            btnHideSupprimerFamille.Visible = False


        Else
            btnAjouterFamille.Visible = True
            btnHistorique.Visible = True
            btnHideInfo.Visible = True
            btnHideMP.Visible = True
            btnAjouterFamille.Visible = True
            btnHideAfficherFamille.Visible = True
            btnHideSupprimerFamille.Visible = True
        End If
    End Sub


    Protected Sub lvMotPasse_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvMotPasse.ItemCommand
        Dim btnHideInfo As Button = FindChildControl(Of Button)(lvInfoMembre, "btnModifier")
        Dim btnHideCourriel As LinkButton = FindChildControl(Of LinkButton)(lvCourriel, "btnModifierCourriel")
        Dim btnHideAfficherFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnAfficherFamille")
        Dim btnHideSupprimerFamille As LinkButton = FindChildControl(Of LinkButton)(lvFamille, "btnSupprimerFamille")

        If e.CommandName = "Edit" Then
            btnAjouterFamille.Visible = False
            btnHistorique.Visible = False
            btnHideInfo.Visible = False
            btnHideCourriel.Visible = False
            btnAjouterFamille.Visible = False
            btnHideAfficherFamille.Visible = False
            btnHideSupprimerFamille.Visible = False

        Else
            btnAjouterFamille.Visible = True
            btnHistorique.Visible = True
            btnHideInfo.Visible = True
            btnHideCourriel.Visible = True
            btnAjouterFamille.Visible = True
            btnHideAfficherFamille.Visible = True
            btnHideSupprimerFamille.Visible = True
        End If
    End Sub

    Protected Sub dsListView_Updating(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangingEventArgs) Handles dsListView.Updating

        Dim txtCourriel As TextBox = FindChildControl(Of TextBox)(lvCourriel, "txtNouveauCourriel")
        Dim txtMotPasse As TextBox = FindChildControl(Of TextBox)(lvMotPasse, "lblMP")

        'Dim lblErreur As Label = FindChildControl(Of Label)(lvMotPasse, "lblErreurMotPasse")

        'If (txtMotPasse.Text <> e.Entity.motPasse) Then
        '    lblErreur.Text = "Le mot de passe est incorrect!"
        'End If

        e.Entity.courriel = txtCourriel.Text

    End Sub

End Class
