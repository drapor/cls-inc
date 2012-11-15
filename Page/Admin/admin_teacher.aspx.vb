'Créé par Samuel Bellerose
'Le 16 septembre 2012
'Dernière mise à jour le 25 septembre 2012
'Classe partielle qui ajoute un animateur dans la BD associé à un cours 

Imports modelCLS
Partial Class Page_Admin_admin_teacher_add
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing
    Dim idMembreDeleting As Integer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub

    'Fonction qui ajoute un animateur et lui donne le bon rôle, soit 6 pour l'animateur
    Sub ajouterEmployeClick(sender As Object, e As EventArgs)
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
                entMembre.SaveChanges()
                lblFelicitation.Text = "L'animateur a &eacute;t&eacute; ajout&eacute; avec succ&egrave;s !"

                lblFelicitation.Visible = True
                checkImage.Visible = True
                ResetFormControlValues(Me)
            Else
                lblErreurEmail.Visible = True
                lblFelicitation.Visible = False
                checkImage.Visible = False

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
            Response.Redirect("~/Page/Admin/admin_teacher_delete.aspx")
        End Try
    End Sub

    Sub actionAjout(sender As Object, e As EventArgs)
        MVPrincipal.SetActiveView(viewAjout)
    End Sub

    Sub actionModifie(sender As Object, e As EventArgs)
        MVPrincipal.SetActiveView(viewModifie)
    End Sub

    Sub actionSupprime(sender As Object, e As EventArgs)
        MVPrincipal.SetActiveView(viewSupprime)
    End Sub
End Class
