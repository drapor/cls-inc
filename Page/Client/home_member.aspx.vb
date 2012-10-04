
Partial Class Page_Client_home_member
    Inherits System.Web.UI.Page

    Protected Sub lvInfoMembre_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvInfoMembre.ItemCommand

        If e.CommandName = "Edit" Then
            btnAjouterFamille.Visible = False
            btnHistorique.Visible = False

            'Dim dateNaissance As String = CType(e.Item.FindControl("txtDate"), TextBox).ToShortDateString()
            'dateNaissance.ToShortDateString()

            'Dim boutonAffiche As Button = CType(e.Item.FindControl("btnAfficherFamille"), Button)
            'boutonAffiche.Visible = False

            'Dim boutonSupprime As Button = CType(e.Item.FindControl("btnSupprimerFamille"), Button)
            'boutonSupprime.Visible = False
        Else
            btnAjouterFamille.Visible = True
            btnHistorique.Visible = True
        End If

    End Sub

    Protected Sub lvCourriel_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvCourriel.ItemDataBound
        Dim courriel As TextBox = CType(e.Item.FindControl("txtNouveauCourriel"), TextBox)
    End Sub


End Class
