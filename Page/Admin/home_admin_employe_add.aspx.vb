Imports modelCLS

Partial Class Page_Admin_home_admin_employe_add
    Inherits System.Web.UI.Page


    Private Shared leContext As modelCLSContainer = Nothing
    Dim unEmploye As Employe = Nothing

    Sub ajouterEmployeClick(sender As Object, e As EventArgs)


        If Page.IsValid = True Then
            Dim entEmploye As New modelCLSContainer
            unEmploye = Employe.CreateEmploye(0, txtNom.Text, txtPrenom.Text, txtTelephone.Text, txtMDP.Text, txtAdresse.Text, txtVille.Text, Now.Date.ToShortDateString, txtDate.Text, txtCourriel.Text, txtCodePostal.Text, 0)
            entEmploye.MembresJeu.AddObject(unEmploye)
            entEmploye.SaveChanges()
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub
End Class
