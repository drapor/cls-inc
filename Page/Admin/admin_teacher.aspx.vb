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
End Class
