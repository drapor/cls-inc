'Créé par Samuel Bellerose
'Le 27 septembre 2012
'Dernière mise à jour le 5 novembre 2012
'Classe partielle qui supprime un cours dans la BD

Imports System.Web.Script.Serialization
Imports modelCLS
Partial Class Page_Admin_admin_course_delete
    Inherits masterPage

    Private Shared leContexte As modelCLSContainer = Nothing
    Dim idCoursDeleting As Integer = Nothing

    Sub DeletingCoursID(sender As Object, e As EventArgs)
        idCoursDeleting = CType(sender, ImageButton).CommandArgument.ToString
    End Sub

    'Supprimera le cours dans la table cours
    Protected Sub lvCours_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.ListViewDeletedEventArgs) Handles lvCours.ItemDeleted
        Dim dbContext As New modelCLSContainer()
        Dim query = From p In dbContext.CoursJeu _
                    Where p.idCours = idCoursDeleting _
                    Select p
        For Each p As CoursJeu In query
            dbContext.DeleteObject(p)
        Next
        Try
            dbContext.SaveChanges()
        Catch ex As Exception
            MsgBox("La suppression est impossible puisque ce cours contient déjà des groupes. Assurez-vous de supprimer tous les groupes en premier.", MsgBoxStyle.OkOnly, "Impossible de supprimer le cours.")
            Response.Redirect("~/Page/Admin/admin_course_delete.aspx")
        End Try
    End Sub
End Class
