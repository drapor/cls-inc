Imports modelCLS
Partial Class Page_Admin_admin_employe_modify
    Inherits System.Web.UI.Page


    Private Shared leContext As modelCLSContainer = Nothing
    
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim entEmploye As New modelCLSContainer
        leContext = New modelCLSContainer


    End Sub
End Class
