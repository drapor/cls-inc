Imports masterPage
Imports modelCLS

Partial Class Page_Admin_admin_schedule
    Inherits System.Web.UI.Page

    Public entClient As modelCLSContainer = New modelCLSContainer

    Protected Sub actionAjout(sender As Object, e As EventArgs)
        Dim idGroupe As Short = FindChildControl(Of DropDownList)(Me, "ddlNomGroupe").SelectedValue
        Dim semaine As String = FindChildControl(Of DropDownList)(listeHoraire, "ddlSemaineAjout").SelectedValue
        Dim debut As String = FindChildControl(Of TextBox)(listeHoraire, "txtDebutAjout").Text
        Dim fin As String = FindChildControl(Of TextBox)(listeHoraire, "txtFinAjout").Text
        Dim local As String = FindChildControl(Of TextBox)(listeHoraire, "txtLocalAjout").Text

        Dim horaire As HoraireJeu = Nothing

        horaire = HoraireJeu.CreateHoraireJeu(0, debut, fin, local, idGroupe, semaine)
        entClient.HoraireJeu.AddObject(horaire)
        entClient.SaveChanges()
        listeHoraire.DataBind()
    End Sub

End Class
