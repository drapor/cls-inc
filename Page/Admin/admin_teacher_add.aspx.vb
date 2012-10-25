Imports modelCLS
Partial Class Page_Admin_admin_teacher_add
    Inherits System.Web.UI.Page

    Private Shared leContext As modelCLSContainer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        leContext = New modelCLSContainer
    End Sub

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
