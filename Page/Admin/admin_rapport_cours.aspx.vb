
Partial Class Page_Admin_admin_rapport_cours
    Inherits masterPage


    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If dropDownType.SelectedValue = 0 Then
            MVPrincipal.ActiveViewIndex = 0
            dsCours.OrderBy = "it.nomCours ASC"
            lvCoursAlpha.DataBind()
        ElseIf dropDownType.SelectedValue = 1 Then
            MVPrincipal.ActiveViewIndex = 0
            dsCours.OrderBy = "it.nomCours DESC"
            lvCoursAlpha.DataBind()
        Else
            MVPrincipal.ActiveViewIndex = 1
            dsCours.OrderBy = "it.categorie"
        End If


    End Sub
End Class
