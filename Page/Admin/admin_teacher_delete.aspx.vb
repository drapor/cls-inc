'Créé par Samuel Bellerose
'Le 31 octobre 2012
'Dernière mise à jour le 5 novembre 2012
'Classe partielle qui supprime un animateur dans la BD associé à un cours 

Imports System.Web.Script.Serialization
Imports modelCLS
Partial Class Page_Admin_admin_employe_delete
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing
    Dim idMembreDeleting As Integer = Nothing

    Sub DeletingMemberID(sender As Object, e As EventArgs)
        idMembreDeleting = CType(sender, ImageButton).CommandArgument.ToString
    End Sub

    'Supprimera l'animateur dans la table Membres
    Protected Sub lvAnimateur_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.ListViewDeletedEventArgs) Handles lvAnimateur.ItemDeleted
        Dim dbContext As New modelCLSContainer()
        Dim query = From p In dbContext.MembresJeu _
            Where p.idMembre = idMembreDeleting _
            Select p
        For Each p As MembresJeu In query
            dbContext.DeleteObject(p)
        Next

        Try
            dbContext.SaveChanges()
        Catch ex As Exception
            MsgBox("La suppression est impossible puisqu'il est déjà associé à un cours. Assurez-vous qu'il ne soit pas assigné à aucun cours avant de le supprimer.", MsgBoxStyle.OkOnly, "Impossible de supprimer l'animateur.")
            Response.Redirect("~/Page/Admin/admin_teacher_delete.aspx")
        End Try
    End Sub

End Class
