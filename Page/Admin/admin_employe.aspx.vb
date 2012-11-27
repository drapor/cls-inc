'Créé par Samuel Bellerose
'Le 16 septembre 2012
'Dernière mise à jour le 26 novembre 2012
'Classe partielle qui ajoute un employé dans la BD

Imports modelCLS
Partial Class Page_Admin_admin_employe
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing

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

    'Fonction qui ajoute un employé dans la BD et lui met le rôle d'employé soit admin ou employé
    Sub ajouterEmployeClick(sender As Object, e As EventArgs)
        lblFelicitation.Visible = False
        lblErreurEmail.Visible = False
        If Page.IsValid = True Then
            Dim entEmploye As New modelCLSContainer
            Dim unEmploye As MembresJeu = Nothing
            Dim email As String = txtCourriel.Text
            Dim utilisateur = (From A In entEmploye.MembresJeu Where (A.courriel = email) Select A).Any

            If utilisateur = Nothing Then

                unEmploye = MembresJeu.CreateMembresJeu(0, txtNom.Text, txtPrenom.Text, txtTelephone.Text, txtMDP.Text, txtAdresse.Text, txtVille.Text, Date.Now.ToShortDateString, txtDate.Text, txtCourriel.Text, txtCodePostal.Text, 0, rdbtnSexe.SelectedItem.Value, dropDownType.SelectedItem.Value)

                entEmploye.MembresJeu.AddObject(unEmploye)

                Try
                    entEmploye.SaveChanges()
                Catch ex As Exception
                    traiteErreur(Page, "ERREUR LORS DE L'AJOUT D'UN EMPLOYÉ", ex)
                    checkImage.Visible = False
                    lblFelicitation.Visible = False
                    failImage.Visible = True
                    lblFailure.Text = "Une erreur s'est produite lors de l'ajout de l'employ&eacute; ..."
                End Try

                If dropDownType.SelectedValue = 1 Then
                    lblFelicitation.Text = "L'administrateur a &eacute;t&eacute; ajout&eacute; avec succ&egrave;s !"
                Else
                    lblFelicitation.Text = "L'employ&eacute; a &eacute;t&eacute; ajout&eacute; avec succ&egrave;s !"
                End If

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

    Protected Sub lvCourriel_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.ListViewUpdateEventArgs) Handles lvCourriel.ItemUpdating
        Dim txtCourriel As TextBox = FindChildControl(Of TextBox)(lvCourriel, "txtNouveauCourriel")

        e.NewValues("courriel") = txtCourriel.Text
    End Sub

    Protected Sub lvMotPasse_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.ListViewUpdateEventArgs) Handles lvMotPasse.ItemUpdating

        Dim txtMP As TextBox = FindChildControl(Of TextBox)(lvMotPasse, "txtNouveauMP")

        e.NewValues("motPasse") = txtMP.Text

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

        Dim txtVieuxMP As TextBox = FindChildControl(Of TextBox)(lvMotPasse, "txtPresentMP")

        If txtVieuxMP.Text = Session("membrePrincipalMotPasse") Then
            args.IsValid = True
        Else
            args.IsValid = False
            SetFocus(txtVieuxMP)
        End If
    End Sub

    Sub changeEmploye(sender As Object, e As EventArgs)
        lblFelicitation.Visible = False
        checkImage.Visible = False
    End Sub

    Protected Sub dsEmployeModifie_Updated(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsEmployeModifie.Updated
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE LA MISE À JOUR D'UN EMPLOYÉ", e.Exception)
            e.ExceptionHandled = True
            checkImage.Visible = False
            lblFelicitation.Visible = False
            failImage.Visible = True
            lblFailure.Visible = True
            lblFailure.Text = "Une erreur s'est produite lors de la mise &agrave; jour de l'employ&eacute;."
        Else
            failImage.Visible = False
            lblFailure.Visible = False
            checkImage.Visible = True
            lblFelicitation.Visible = True
            lblFelicitation.Text = "L'employ&eacute; a &eacute;t&eacute; mis &agrave; jour avec succ&egrave;s !"
        End If
    End Sub

    Protected Sub dsEmployeSupprime_Deleted(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsEmployeSupprime.Deleted
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE LA SUPPRESSION D'UN EMPLOYÉ", e.Exception)
            e.ExceptionHandled = True
            checkImage.Visible = False
            lblFelicitation.Visible = False
            failImage.Visible = True
            lblFailure.Visible = True
            lblFailure.Text = "Une erreur s'est produite lors de la suppression de l'employ&eacute;."
        Else
            failImage.Visible = False
            lblFailure.Visible = False
            checkImage.Visible = True
            lblFelicitation.Visible = True
            lblFelicitation.Text = "L'employ&eacute; a &eacute;t&eacute; supprim&eacute; jour avec succ&egrave;s !"
        End If
    End Sub
End Class
