
Partial Class Page_Autre_description
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim cours As Integer = Session("idCours")
        dsCours.WhereParameters("cours").DefaultValue = cours
        Dim categorie As String = Request.QueryString("categorie")
        If categorie = "Sport" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/sports_banner.png"
        ElseIf categorie = "Loisir" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/loisir_banner.png"
        ElseIf categorie = "Culture" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/culture_banner.png"
        End If

    End Sub

    Public Shared Function FindChildControl(Of T As Control)(ByVal startingControl As Control, ByVal id As String) As T
        Dim found As T = Nothing
        For Each activeControl As Control In startingControl.Controls
            found = TryCast(activeControl, T)
            If found Is Nothing OrElse (String.Compare(id, found.ID, True) <> 0) Then
                found = FindChildControl(Of T)(activeControl, id)
            End If
            If found IsNot Nothing Then
                Exit For
            End If
        Next
        Return found
    End Function


    'Protected Sub lvCours_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvCours.ItemCommand

    '    Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
    '    Dim idCours As Integer = lvCours.DataKeys(dataItem.DisplayIndex).Value.ToString()

    '    If e.CommandName = "selection" Then

    '    End If

    'End Sub


    
    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        Dim lblNomCoursHid As Label = FindChildControl(Of Label)(lvCours, "lblNomCoursHide")
        lblNomCours.Text = lblNomCoursHid.Text
    End Sub
End Class
