Imports modelCLS
Partial Class Page_Admin_admin_employe_add
    Inherits System.Web.UI.Page

    Private Shared leContext As modelCLSContainer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub

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

    Private Sub ResetFormControlValues(ByVal parent As Control)
        For Each c As Control In parent.Controls
            If c.Controls.Count > 0 Then
                ResetFormControlValues(c)
            Else
                Select Case (c.GetType().ToString())
                    Case "System.Web.UI.WebControls.TextBox"
                        CType(c, TextBox).Text = ""
                    Case "System.Web.UI.WebControls.RadioButtonList"
                        CType(c, RadioButtonList).ClearSelection()
                End Select
            End If
        Next c
    End Sub




End Class
