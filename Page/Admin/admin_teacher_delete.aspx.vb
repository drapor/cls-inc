Imports modelCLS
Partial Class Page_Admin_admin_employe_delete
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing
    Dim unErreur As Boolean = False
    Dim idMembreDeleting As Integer = Nothing

    Sub DeletingMemberID(sender As Object, e As EventArgs)
        idMembreDeleting = CType(sender, ImageButton).CommandArgument.ToString
    End Sub

    Protected Sub lvAnimateur_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.ListViewDeletedEventArgs) Handles lvAnimateur.ItemDeleted
        Dim dbContext As New modelCLSContainer()
        Dim query = From p In dbContext.MembresJeu _
            Where p.idMembre = idMembreDeleting _
            Select p
        For Each p As MembresJeu In query
            dbContext.DeleteObject(p)
        Next

        Try
            dbContext.SaveChanges()
            'Throw New Exception("L'animateur que vous tentez de supprimer est déja associé à un cours. Veuillez assigné un autre animateur au cours que celui donne déja.")
        Catch ex As Exception
            unErreur = True
            'Response.Write(String.Format("<script type=", "text/javascript", " language=", "javascript", ">alert('{0}');</script>", ex.Message))
            'Page.Response.A()
        End Try

    End Sub


    Protected Sub lvAnimateur_ItemDeleting(sender As Object, e As System.Web.UI.WebControls.ListViewDeleteEventArgs) Handles lvAnimateur.ItemDeleting
        'Dim entAnimateur As New modelCLSContainer
        'Dim animateur As MembresJeu = (From A In entAnimateur.MembresJeu Where (A.idMembre = idMembreDeleting) Select A)

        'For Each membre As MembresJeu In animateur

        'Next
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        If unErreur = True Then
            Response.Write(String.Format("<script type=", "text/javascript", " language=", "javascript", ">alert('{0}');</script>", "Impossible de supprimer l'animateur"))
            unErreur = False
        End If
    End Sub

    

End Class
