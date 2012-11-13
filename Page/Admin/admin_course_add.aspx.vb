'Créé par Samuel Bellerose
'Le 25 septembre 2012
'Dernière mise à jour le 5 octobre 2012
'Classe partielle qui crée un cours pour ensuite l'insérer dans la BD

Imports modelCLS
Partial Class Page_Admin_admin_course_add
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing
    Dim idCoursDeleting As Integer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub

    Sub DeletingCoursID(sender As Object, e As EventArgs)
        idCoursDeleting = CType(sender, ImageButton).CommandArgument.ToString
    End Sub

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

    Sub viewSupprimer(sender As Object, e As EventArgs)
        mvCours.ActiveViewIndex = 1
    End Sub

    Sub viewAjouter(sender As Object, e As EventArgs)
        mvCours.ActiveViewIndex = 0
    End Sub

    Sub viewModifier(sender As Object, e As EventArgs)
        mvCours.ActiveViewIndex = 2
    End Sub

    'Message affichant l'ajout du cours
    Protected Sub dsCourseAdd_Inserted(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsCourseAdd.Inserted

        If e.Exception IsNot Nothing Then
            masterPage.traiteErreur(Page, "ERREUR LORS DE L'INSERTION D'UN COURS", e.Exception)
            lblFelicitation.Text = "ERREUR LORS DE L'INSERTION D'UN COURS: " & CType(e.Entity, CoursJeu).nomCours
            e.ExceptionHandled = True
        Else
            lblFelicitation.Visible = True
            checkImage.Visible = True
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


End Class
