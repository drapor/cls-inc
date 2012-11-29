<<<<<<< HEAD
﻿
Partial Class Page_Admin_rapport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If dropDownType.SelectedValue = 0 Then
            MVPrincipal.ActiveViewIndex = 0
        ElseIf dropDownType.SelectedValue = 1 Then
            MVPrincipal.ActiveViewIndex = 1
        Else
            MVPrincipal.ActiveViewIndex = 2
        End If
    End Sub

    Sub actionImprimer(sender As Object, e As EventArgs)
        Response.Redirect("javascript:PrintThisPage()")
    End Sub

    'Protected Sub Button1_Click(sender As Object, e As System.EventArgs) Handles Button1.Click
    '    Response.Redirect("javascript:PrintThisPage();")
    'End Sub
End Class
=======
﻿
Partial Class Page_Admin_rapport
    Inherits System.Web.UI.Page

End Class
>>>>>>> 64ec71e1f69872a6ad41842e2afe5c4f1c3657f0
