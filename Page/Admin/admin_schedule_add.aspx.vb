Imports masterPage
Imports modelCLS

Partial Class Page_Admin_admin_group_add
    Inherits System.Web.UI.Page

    Public entClient As modelCLSContainer = New modelCLSContainer

    Protected Sub lvHoraire_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvHoraire.ItemInserting
        Dim idGroupe As Short = FindChildControl(Of DropDownList)(Me, "ddlNomGroupe").SelectedValue
        Dim local As String = FindChildControl(Of TextBox)(lvHoraire, "txtLocal").Text

        Dim horaire = (From A In entClient.HoraireJeu Where (A.Groupe_idGroupe = idGroupe) Select A).Any

        If horaire = Not Nothing Then
            e.Cancel = True
        End If

        e.Values("Groupe_idGroupe") = idGroupe
        e.Values("local") = local
    End Sub

    Protected Sub lvJourSemaine_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvJourSemaine.ItemInserting
        Dim idHoraire As Short = Nothing
        Dim idGroupe As Short = FindChildControl(Of DropDownList)(Me, "ddlNomGroupe").SelectedValue

        Dim horaire = (From A In entClient.HoraireJeu Where (A.Groupe_idGroupe = idGroupe) Select A).Any

        If horaire = Not Nothing Then
            idHoraire = entClient.HoraireJeu.Where(Function(n) n.Groupe_idGroupe = idGroupe).[Select](Function(n) n.idHoraire).Max
        Else
            idHoraire += 1
        End If


        e.Values("HoraireJeu_idHoraire") = idHoraire
    End Sub

    Protected Sub ServerValidate(sender As Object, args As ServerValidateEventArgs)
        Dim debut As String = FindChildControl(Of TextBox)(lvJourSemaine, "txtDebut").Text
        Dim fin As String = FindChildControl(Of TextBox)(lvJourSemaine, "txtFin").Text

        If String.IsNullOrEmpty(debut) AndAlso String.IsNullOrEmpty(fin) Then
            args.IsValid = True
        ElseIf Not String.IsNullOrEmpty(debut) AndAlso Not String.IsNullOrEmpty(fin) Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub

End Class
