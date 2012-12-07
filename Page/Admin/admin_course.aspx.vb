'Créé par Samuel Bellerose
'Le 25 septembre 2012
'Dernière mise à jour le 5 octobre 2012
'Classe partielle qui crée un cours pour ensuite l'insérer dans la BD

Imports modelCLS
Partial Class Page_Admin_admin_course
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing
    Dim idCoursDeleting As Integer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer

        If Request.QueryString("view") = 0 Then
            mvCours.ActiveViewIndex = 0
        ElseIf Request.QueryString("view") = 1 Then
            mvCours.ActiveViewIndex = 1
        Else
            mvCours.ActiveViewIndex = 2
        End If
    End Sub

    Sub DeletingCoursID(sender As Object, e As EventArgs)
        idCoursDeleting = CType(sender, ImageButton).CommandArgument.ToString
    End Sub

    'Cette fonction modifie l'age maximum si l'utilisateur sélectionne "et +" dans le dropdownlist
    Sub changementAgeMod(sender As Object, e As EventArgs)
        Dim txtBoxAgeMax As TextBox = FindChildControl(Of TextBox)(lvCourseAdd, "txtGroupeAgeMax")
        If CType(sender, DropDownList).SelectedIndex = 1 Then
            txtBoxAgeMax.Text = "99"
            txtBoxAgeMax.Visible = False
        Else
            txtBoxAgeMax.Text = ""
            txtBoxAgeMax.Visible = True
        End If
    End Sub

    Protected Sub lvCourseAdd_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.ListViewDeletedEventArgs) Handles lvCourseAdd.ItemDeleted
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

    Sub changeCours(sender As Object, e As EventArgs)
        desactiveControles(checkImage, lblFelicitation)
    End Sub

#Region "TRAITEMENT DES ERREURS"
    'Ajout Cours
    Protected Sub dsCourseAdd_Inserted(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsCourseAdd.Inserted
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE L'AJOUT D'UN COURS", e.Exception)
            e.ExceptionHandled = True
            activeControles(failImage, lblFailure)
            lblFailure.Text = "Une erreur s'est produite lors de l'ajout du cours..."
        Else
            activeControles(checkImage, lblFelicitation)
            lblFelicitation.Text = "Le cours a &eacute;t&eacute; ajout&eacute; avec succ&egrave;s !"
        End If
    End Sub

    'MAJ Cours
    Protected Sub dsModifyCourse_Updated(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsModifyCourse.Updated
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE LA MISE À JOUR D'UN COURS", e.Exception)
            e.ExceptionHandled = True
            activeControles(failImage, lblFailure)
            lblFailure.Text = "Une erreur s'est produite lors de la mise &agrave; jour du cours."
        Else
            activeControles(checkImage, lblFelicitation)
            lblFelicitation.Text = "Le cours a &eacute;t&eacute; mis &agrave; jour avec succ&egrave;s !"
        End If
    End Sub

    'Suppression Cours
    Protected Sub dsCours_Deleted(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsCours.Deleted
        If e.Exception IsNot Nothing Then
            masterPage.traiteErreur(Page, "ERREUR LORS DE LA SUPPRESSION D'UN COURS", e.Exception)
            e.ExceptionHandled = True
            desactiveControles(checkImage, lblFelicitation)
            activeControles(failImage, lblFailure)
            lblFailure.Text = "Une erreur s'est produite lors de la suppression du cours."
        Else
            desactiveControles(failImage, lblFailure)
            activeControles(checkImage, lblFelicitation)
            lblFelicitation.Text = "Le cours a &eacute;t&eacute; supprimer avec succ&egrave;s !"
        End If
    End Sub
#End Region
End Class
