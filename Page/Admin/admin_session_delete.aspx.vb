'Créé par Francis Griggs
'Le 16 septembre 2012
'Dernière mise à jour le 25 septembre 2012
'Classe partielle qui supprime une session dans la BD associé à un groupe 

Partial Class Page_Admin_admin_session_delete
    Inherits masterPage

    'Supprime la session qui vient d'être supprimer du dropDownList
    Protected Sub lvSession_ItemDeleting(sender As Object, e As System.Web.UI.WebControls.ListViewDeleteEventArgs) Handles lvSession.ItemDeleting
        ddlNomSession.Items.RemoveAt(ddlNomSession.SelectedIndex)
    End Sub
End Class
