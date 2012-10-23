
Partial Class Page_Client_client_membre_famille
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        Dim idClient As Integer = CType(Request.QueryString("idMembre"), Integer)

        dsFamille.WhereParameters("MembreID").DefaultValue = idClient

    End Sub

    Protected Sub lvInfoMembre_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvInfoMembre.ItemCommand

        If e.CommandName = "Edit" Then
            btnHistorique.Visible = False

        Else
            btnHistorique.Visible = True
        End If

    End Sub

    Sub actionRetour(sender As Object, e As EventArgs)

        Dim url As String
        url = "../Client/home_member.aspx?idMembre=" & Session("membrePrincipalId")
        Response.Redirect(url)

    End Sub
End Class
