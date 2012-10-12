Imports modelCLS

Partial Class Page_Client_home_member
    Inherits System.Web.UI.Page

    Public Shared Function FindChildControl(Of T As Control)(ByVal startingControl As Control, ByVal id As String) As T
        Dim found As T = Nothing
        For Each activeControl As Control In startingControl.Controls
            found = TryCast(activeControl, T)
            If found Is Nothing OrElse (String.Compare(id, found.ID, True) <> 0) Then
                found = FindChildControl(Of T)(activeControl, id)
            End If
            If found IsNot Nothing Then
                Exit For
            End If
        Next
        Return found
    End Function

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

    Sub actionAccept(sender As Object, e As EventArgs)
        Dim entEmploye As New modelCLSContainer
        Dim email As String = FindChildControl(Of TextBox)(lvCourriel, "txtNouveauCourriel").Text

        Dim utilisateur = (From A In entEmploye.MembresJeu Where (A.courriel = email) Select A).Any
    End Sub

    'Sub courrielValidate(ByVal source As System.Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs) Handles verifieCourriel.ServerValidate
    '    args.IsValid = (args.Value.Length >= 8)
    'End Sub

End Class
