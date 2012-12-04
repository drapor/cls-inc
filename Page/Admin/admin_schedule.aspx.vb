Imports masterPage
Imports modelCLS

Partial Class Page_Admin_admin_schedule
    Inherits System.Web.UI.Page

    Protected Function GetCssName(container As Object) As String
        If container IsNot Nothing Then
            If container.[GetType]() Is GetType(ListViewDataItem) Then
                If (DirectCast(container, ListViewDataItem).DisplayIndex Mod 2) = 0 Then
                    Return "even"
                Else
                    Return "odd"
                End If
            End If
        End If
        Return Nothing
    End Function

    Protected Sub lvHoraire_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvHoraire.ItemInserting
        Dim semaine As String = FindChildControl(Of DropDownList)(lvHoraire, "ddlSemaine").SelectedValue
        Dim idGroupe As Short = FindChildControl(Of DropDownList)(Me, "ddlNomGroupe").SelectedValue

        e.Values("GroupeJeu_idGroupe") = idGroupe
        e.Values("JourSemaine_idSemaine") = semaine
    End Sub
End Class
