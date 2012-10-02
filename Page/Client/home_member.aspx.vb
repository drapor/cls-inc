
Partial Class Page_Client_home_member
    Inherits System.Web.UI.Page

    Protected Sub lvInfoMembre_ItemEditing(sender As Object, e As System.Web.UI.WebControls.ListViewEditEventArgs) Handles lvInfoMembre.ItemEditing
        btnAjouterFamille.Visible = False
        btnHistorique.Visible = False
        btnModifierCourriel.Visible = False
        btnModifierMP.Visible = False
        'Dim item As ListView = sender
        'Dim btnAfficher As LinkButton = item.FindControl("btnAfficherFamille")
        'btnAfficher.Visible = False
        'lvInfoMembre.EditItem.FindControl("btnAfficherFamille").Visible = False
        'lvInfoMembre.EditItem.FindControl("btnSupprimerFamille").Visible = False
    End Sub

    Protected Sub lvInfoMembre_Load(sender As Object, e As System.EventArgs) Handles lvInfoMembre.Load
        btnAjouterFamille.Visible = True
        btnHistorique.Visible = True
        btnModifierCourriel.Visible = True
        btnModifierMP.Visible = True
    End Sub
End Class
