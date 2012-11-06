Imports masterPage
Imports modelCLS

Partial Class Page_Admin_admin_group_add
    Inherits System.Web.UI.Page

    Protected Sub lvHoraire_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvHoraire.ItemInserting
        Dim idGroupe As Short = FindChildControl(Of DropDownList)(Me, "ddlNomGroupe").SelectedValue
        e.Values("Groupe_idGroupe") = idGroupe
    End Sub

    Protected Sub ServerValidate(sender As Object, args As ServerValidateEventArgs)
        Dim debut As String = FindChildControl(Of TextBox)(lvHoraire, "txtDebut").Text
        Dim fin As String = FindChildControl(Of TextBox)(lvHoraire, "txtFin").Text

        If String.IsNullOrEmpty(debut) AndAlso String.IsNullOrEmpty(fin) Then
            args.IsValid = True
        ElseIf Not String.IsNullOrEmpty(debut) AndAlso Not String.IsNullOrEmpty(fin) Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub

End Class
