Imports modelCLS
Partial Class Page_Admin_admin_course_add
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub


    Private Sub ResetFormControlValues(ByVal parent As Control)
        For Each c As Control In parent.Controls
            If c.Controls.Count > 0 Then
                ResetFormControlValues(c)
            Else
                Select Case (c.GetType().ToString())
                    Case "System.Web.UI.WebControls.TextBox"
                        CType(c, TextBox).Text = ""
                    Case "System.Web.UI.WebControls.RadioButtonList"
                        CType(c, RadioButtonList).ClearSelection()
                End Select
            End If
        Next c
    End Sub

    Protected Sub dsCourseAdd_Inserted(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsCourseAdd.Inserted
        lblFelicitation.Visible = True
        checkImage.Visible = True
    End Sub
End Class
