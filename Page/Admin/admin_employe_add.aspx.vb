Imports modelCLS
Partial Class Page_Admin_admin_employe_add
    Inherits System.Web.UI.Page

    Private Shared leContext As modelCLSContainer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub

    Sub ajouterEmployeClick(sender As Object, e As EventArgs)
        If Page.IsValid = True Then
            Dim entMembre As New modelCLSContainer
            Dim entEmploye As New modelCLSContainer
            Dim entRole As New Integer

            Dim unMembre As MembresJeu = Nothing
            Dim unEmploye As MembresJeu_Employe = Nothing

            unMembre = MembresJeu.CreateMembresJeu(0, txtNom.Text, txtPrenom.Text, txtTelephone.Text, txtMDP.Text, txtAdresse.Text, txtVille.Text, Date.Now.ToShortDateString, txtDate.Text, txtCourriel.Text, txtCodePostal.Text, dropDownType.SelectedValue, 0, dropDownSexe.SelectedItem.Text)

            entMembre.MembresJeu.AddObject(unMembre)
            entMembre.SaveChanges()

            unEmploye = MembresJeu_Employe.CreateMembresJeu_Employe(0, unMembre.idMembre)
            entEmploye.MembresJeu_Employe.AddObject(unEmploye)
            entEmploye.SaveChanges()
            lblFelicitation.Visible = True
            checkImage.Visible = True
        Else
            lblFelicitation.Visible = False
            checkImage.Visible = False
        End If
    End Sub



End Class
