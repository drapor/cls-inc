
Partial Class Page_Employe_home_employe
    Inherits System.Web.UI.Page

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

    Protected Sub lvInfoMembre_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvInfoMembre.ItemCommand

        Dim btnHideCourriel As LinkButton = FindChildControl(Of LinkButton)(lvCourriel, "btnModifierCourriel")
        Dim btnHideMP As LinkButton = FindChildControl(Of LinkButton)(lvMotPasse, "btnModifierMP")

        If e.CommandName = "Edit" Then
            btnHideCourriel.Visible = False
            btnHideMP.Visible = False

        Else
            btnHideCourriel.Visible = True
            btnHideMP.Visible = True
        End If
    End Sub



    Protected Sub lvCourriel_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvCourriel.ItemCommand

        Dim btnHideInfo As Button = FindChildControl(Of Button)(lvInfoMembre, "btnModifier")
        Dim btnHideMP As LinkButton = FindChildControl(Of LinkButton)(lvMotPasse, "btnModifierMP")

        If e.CommandName = "Edit" Then
            btnHideInfo.Visible = False
            btnHideMP.Visible = False

        Else
            btnHideInfo.Visible = True
            btnHideMP.Visible = True
        End If
    End Sub


    Protected Sub lvMotPasse_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvMotPasse.ItemCommand
        Dim btnHideInfo As Button = FindChildControl(Of Button)(lvInfoMembre, "btnModifier")
        Dim btnHideCourriel As LinkButton = FindChildControl(Of LinkButton)(lvCourriel, "btnModifierCourriel")

        If e.CommandName = "Edit" Then
            btnHideInfo.Visible = False
            btnHideCourriel.Visible = False

        Else
            btnHideInfo.Visible = True
            btnHideCourriel.Visible = True
        End If
    End Sub


    Protected Sub dsListView_Updating(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangingEventArgs) Handles dsListView.Updating
        Dim txtCourriel As TextBox = FindChildControl(Of TextBox)(lvCourriel, "txtNouveauCourriel")
        Dim txtMotPasse As TextBox = FindChildControl(Of TextBox)(lvMotPasse, "lblMP")

        e.Entity.courriel = txtCourriel.Text
    End Sub
End Class
