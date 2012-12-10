'Cr�� par Samuel Bellerose
'Le 25 septembre 2012
'Derni�re mise � jour le 5 octobre 2012
'Classe partielle qui cr�e un cours pour ensuite l'ins�rer dans la BD
'Principaux intrants:  Nom du cours; Cat�gorie; Description du cours; Pr�requis; Tarif; Groupe d'�ge minimum/maximum; Date d�but des inscriptions; Date fin des inscriptions; Date d�but des cours; Date fin des cours; Animateurs du cours;
'Principaux extrants: Nom du cours; Cat�gorie; Description du cours; Pr�requis; Tarif; Groupe d'�ge minimum/maximum; Date d�but des inscriptions; Date fin des inscriptions; Date d�but des cours; Date fin des cours; Animateurs du cours;

Imports modelCLS
Partial Class Page_Admin_admin_course
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing
    Dim idCoursDeleting As Integer = Nothing

    'Change la view du Multiview selon le QueryString
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

    'Petite fonction qui ira chercher l'id du cours � supprimer
    Sub DeletingCoursID(sender As Object, e As EventArgs)
        idCoursDeleting = CType(sender, ImageButton).CommandArgument.ToString
    End Sub

    'Cette fonction modifie l'age maximum si l'utilisateur s�lectionne "et +" dans le dropdownlist
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

    'Fonction qui mettera le textbox de l'age maximum invisible si l'utilisateur s�lectionne "et +"
    Sub changementAgeModModifier(sender As Object, e As EventArgs)
        Dim txtBoxAgeMax As TextBox = FindChildControl(Of TextBox)(lvCourseModify, "txtGroupeAgeMax")
        If CType(sender, DropDownList).SelectedIndex = 1 Then
            txtBoxAgeMax.Text = "99"
            txtBoxAgeMax.Visible = False
        Else
            txtBoxAgeMax.Text = ""
            txtBoxAgeMax.Visible = True
        End If
    End Sub

    'Fonction qui d�sactive les message d'erreurs/succ�s lors des mise-a-jour/suppression/ajout de cours
    Sub changeCours(sender As Object, e As EventArgs)
        desactiveControles(checkImage, lblFelicitation)
    End Sub

    'Fonction binder sur le listeView qui modifie les cours, qui fonctionne pareil � celle pr�d�dente, mais que l'on doit
    'aller chercher les controle gr�ce a la fonction FindChildControl, puisqu'il est impossible d'aller les chercher dans un listView
    Protected Sub lvCourseModify_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvCourseModify.ItemDataBound
        Dim groupeAgeMod As Label = FindChildControl(Of Label)(lvCourseModify, "lblGroupeAgeMod")
        Dim ageMax As Label = FindChildControl(Of Label)(lvCourseModify, "lblGroupeAgeMax")
        Dim ddl As DropDownList = FindChildControl(Of DropDownList)(lvCourseModify, "ddlGroupeAgeMod")
        Dim txtBoxAgeMax As TextBox = FindChildControl(Of TextBox)(lvCourseModify, "txtGroupeAgeMax")

        If ageMax Is Nothing Then
        Else
            If groupeAgeMod.Text = "et +" Then
                ageMax.Visible = False
            End If
        End If

        If ddl Is Nothing Then
        Else
            If ddl.SelectedItem.Text = "et +" Then
                txtBoxAgeMax.Visible = False
            End If
        End If
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
            traiteErreur(Page, "ERREUR LORS DE LA MISE � JOUR D'UN COURS", e.Exception)
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
