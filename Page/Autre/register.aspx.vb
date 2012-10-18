Imports modelCLS
Partial Class Page_Autre_register
    Inherits System.Web.UI.Page

    Private Shared leContext As modelCLSContainer = Nothing

    Protected Sub page_load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub

    Sub actionAjout(sender As Object, e As EventArgs)
        If Page.IsValid = True Then
            Dim entMembre As New modelCLSContainer
            Dim unMembre As MembresJeu = Nothing

            unMembre = MembresJeu.CreateMembresJeu(0, txtNom.Text, txtPrenom.Text, txtTelephone.Text, txtMDP.Text, txtAdresse.Text, txtVille.Text, Date.Now.ToShortDateString, txtDate.Text, txtCourriel.Text, txtCodePostal.Text, 0, dropDownSexe.SelectedItem.Text, 3)
            entMembre.MembresJeu.AddObject(unMembre)
            entMembre.SaveChanges()


            Response.Redirect("../Client/home_member.aspx")

        End If

    End Sub

End Class
