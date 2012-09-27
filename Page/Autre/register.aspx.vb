Imports modelCLS
Partial Class Page_Autre_register
    Inherits System.Web.UI.Page

    Private Shared leContext As modelCLSContainer = Nothing
    Dim unMembre As Membres = Nothing

    Protected Sub page_load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub

    Sub actionAjout(sender As Object, e As EventArgs)

        Dim leContext As New modelCLSContainer

        If Page.IsValid = True Then
            'unMembre = Membres.CreateMembres(0, txtNom.Text, txtPrenom.Text, txtTelephone.Text, txtMDP.Text, txtAdresse.Text, txtVille.Text, Date.Now, txtDate.Text, txtCourriel.Text, txtCodePostal.Text)
            'leContext.MembresJeu.AddObject(unMembre)
            'leContext.SaveChanges()
        End If

    End Sub

End Class
