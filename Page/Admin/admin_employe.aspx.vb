'Créé par Samuel Bellerose
'Le 16 septembre 2012
'Dernière mise à jour le 25 septembre 2012
'Classe partielle qui ajoute un employé dans la BD

Imports modelCLS
Partial Class Page_Admin_admin_employe_add
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
        If Page.IsValid = True Then
            Dim entEmploye As New modelCLSContainer
            Dim unEmploye As MembresJeu = Nothing
            Dim email As String = txtCourriel.Text
            Dim utilisateur = (From A In entEmploye.MembresJeu Where (A.courriel = email) Select A).Any

            If utilisateur = Nothing Then
                unEmploye = MembresJeu.CreateMembresJeu(0, txtNom.Text, txtPrenom.Text, txtTelephone.Text, txtMDP.Text, txtAdresse.Text, txtVille.Text, Date.Now.ToShortDateString, txtDate.Text, txtCourriel.Text, txtCodePostal.Text, 0, rdbtnSexe.SelectedItem.Value, dropDownType.SelectedItem.Value)
                entEmploye.MembresJeu.AddObject(unEmploye)
                entEmploye.SaveChanges()

                If dropDownType.SelectedValue = 1 Then
                    lblFelicitation.Text = "L'administrateur a &eacute;t&eacute; ajout&eacute; avec succ&egrave;s !"
                Else
                    lblFelicitation.Text = "L'employ&eacute; a &eacute;t&eacute; ajout&eacute; avec succ&egrave;s !"
                End If

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
