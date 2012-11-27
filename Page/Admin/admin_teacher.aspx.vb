'Créé par Samuel Bellerose
'Le 16 septembre 2012
'Dernière mise à jour le 26 novembre 2012
'Classe partielle qui ajoute un animateur dans la BD associé à un cours 

Imports modelCLS
Partial Class Page_Admin_admin_teacher_add
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing
    Dim idMembreDeleting As Integer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer

        If Request.QueryString("view") = 0 Then
            MVPrincipal.ActiveViewIndex = 0
        ElseIf Request.QueryString("view") = 1 Then
            MVPrincipal.ActiveViewIndex = 1
        Else
            MVPrincipal.ActiveViewIndex = 2
        End If
    End Sub

    'Fonction qui ajoute un animateur et lui donne le bon rôle, soit 6 pour l'animateur
    Sub ajouterEmployeClick(sender As Object, e As EventArgs)
        lblFelicitation.Visible = False
        lblErreurEmail.Visible = False
        If Page.IsValid = True Then
            Dim entMembre As New modelCLSContainer
            Dim unAnim As MembresJeu_Animateur = Nothing
            Dim unMembre As MembresJeu = Nothing
            Dim email As String = txtCourriel.Text
            Dim utilisateur = (From A In entMembre.MembresJeu Where (A.courriel = email) Select A).Any

            If utilisateur = Nothing Then
                unMembre = MembresJeu.CreateMembresJeu(0, txtNom.Text, txtPrenom.Text, txtTelephone.Text, txtMDP.Text, txtAdresse.Text, txtVille.Text, Date.Now.ToShortDateString, txtDate.Text, txtCourriel.Text, txtCodePostal.Text, 0, rdbtnSexe.SelectedItem.Value, 6)
                unAnim = MembresJeu_Animateur.CreateMembresJeu_Animateur(0, unMembre.idMembre)
                entMembre.MembresJeu.AddObject(unMembre)
                entMembre.MembresJeu_Animateur.AddObject(unAnim)

                Try
                    entMembre.SaveChanges()
                Catch ex As Exception
                    traiteErreur(Page, "ERREUR LORS DE L'AJOUT D'UN ANIMATEUR", ex)
                    checkImage.Visible = False
                    lblFelicitation.Visible = False
                    failImage.Visible = True
                    lblFailure.Text = "Une erreur s'est produite lors de l'ajout de l'animateur..."
                End Try

                lblFelicitation.Text = "L'animateur a &eacute;t&eacute; ajout&eacute; avec succ&egrave;s !"

                lblFelicitation.Visible = True
                checkImage.Visible = True
                ResetFormControlValues(Me)
            Else
                lblFelicitation.Visible = False
                checkImage.Visible = False
                SetFocus(txtCourriel)
                lblErreurEmail.Visible = True
            End If
        End If

    End Sub

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
        End Try
    End Sub

    Protected Sub lvCourriel_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.ListViewUpdateEventArgs) Handles lvCourriel.ItemUpdating
        Dim idMembre As Short = dropDownAnimateur.SelectedValue
        Dim txtNouveauCourriel As TextBox = FindChildControl(Of TextBox)(lvCourriel, "txtNouveauCourriel")
        Dim animateur As MembresJeu = (From A In leContext.MembresJeu Where (A.idMembre = idMembre) Select A).FirstOrDefault

        animateur.courriel = txtNouveauCourriel.Text
        leContext.SaveChanges()

    End Sub

    Protected Sub lvMotPasse_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.ListViewUpdateEventArgs) Handles lvMotPasse.ItemUpdating
        Dim idMembre As Short = dropDownAnimateur.SelectedValue
        Dim txtNouveauMP As TextBox = FindChildControl(Of TextBox)(lvMotPasse, "txtNouveauMP")
        Dim animateur As MembresJeu = (From A In leContext.MembresJeu Where (A.idMembre = idMembre) Select A).FirstOrDefault

        animateur.motPasse = txtNouveauMP.Text
        leContext.SaveChanges()

    End Sub

    Sub validationCourriel(sender As Object, args As ServerValidateEventArgs)

        Dim txtCourriel As TextBox = FindChildControl(Of TextBox)(lvCourriel, "txtNouveauCourriel")

        Dim utilisateur = (From A In leContext.MembresJeu Where (A.courriel = txtCourriel.Text) Select A).Any

        If utilisateur = Nothing Then
            args.IsValid = True
        Else
            args.IsValid = False
            SetFocus(txtCourriel)
        End If
    End Sub

    Sub validationMotPasse(sender As Object, args As ServerValidateEventArgs)
        Dim idMembre As Short = dropDownAnimateur.SelectedValue
        Dim vieuxMotPasse As String = leContext.MembresJeu.Where(Function(n) n.idMembre = idMembre).OrderBy(Function(n) n.idMembre).[Select](Function(n) n.motPasse).First

        Dim txtVieuxMP As TextBox = FindChildControl(Of TextBox)(lvMotPasse, "txtPresentMP")

        If txtVieuxMP.Text = vieuxMotPasse Then
            args.IsValid = True
        Else
            args.IsValid = False
            SetFocus(txtVieuxMP)
        End If
    End Sub

    Protected Sub dsAnimateurInfo_Updated(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsAnimateurInfo.Updated
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE LA MISE À JOUR D'UN ANIMATEUR", e.Exception)
            e.ExceptionHandled = True
            checkImage.Visible = False
            lblFelicitation.Visible = False
            failImage.Visible = True
            lblFailure.Visible = True
            lblFailure.Text = "Une erreur s'est produite lors de la mise &agrave; jour de l'animateur."
        Else
            failImage.Visible = False
            lblFailure.Visible = False
            checkImage.Visible = True
            lblFelicitation.Visible = True
            lblFelicitation.Text = "L'animateur a &eacute;t&eacute; mis &agrave; jour avec succ&egrave;s !"
        End If
    End Sub

    Sub changeAnimateur(sender As Object, e As EventArgs)
        lblFelicitation.Visible = False
        checkImage.Visible = False
    End Sub

    Protected Sub dsAnimateurSupprime_Deleted(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsAnimateurSupprime.Deleted
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE LA SUPPRESSION D'UN ANIMATEUR", e.Exception)
            e.ExceptionHandled = True
            checkImage.Visible = False
            lblFelicitation.Visible = False
            failImage.Visible = True
            lblFailure.Visible = True
            lblFailure.Text = "Une erreur s'est produite lors de la suppression de l'animateur."
        Else
            failImage.Visible = False
            lblFailure.Visible = False
            checkImage.Visible = True
            lblFelicitation.Visible = True
            lblFelicitation.Text = "L'animateur a &eacute;t&eacute; supprim&eacute; jour avec succ&egrave;s !"
        End If
    End Sub
End Class
