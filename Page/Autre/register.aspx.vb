Imports modelCLS
Partial Class Page_Autre_register
    Inherits System.Web.UI.Page

    Private Shared leContext As modelCLSContainer = Nothing

    Protected Sub page_load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub

    Sub actionAjout(sender As Object, e As EventArgs)
        If Page.IsValid = True Then
            Dim leContext As New modelCLSContainer
            Dim unMembre As MembresJeu = Nothing

            unMembre = MembresJeu.CreateMembresJeu(0, txtNom.Text, txtPrenom.Text, txtTelephone.Text, txtMDP.Text, txtAdresse.Text, txtVille.Text, Date.Now.ToShortDateString, txtDate.Text, txtCourriel.Text, txtCodePostal.Text, 3, 0, dropDownSexe.SelectedValue)
            leContext.MembresJeu.AddObject(unMembre)
            leContext.SaveChanges()
        End If

    End Sub

End Class
