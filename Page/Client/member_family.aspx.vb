
Partial Class Page_Client_client_membre_famille
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        dsFamille.WhereParameters("MembreID").DefaultValue = Session("idUserFamille")

    End Sub

    Protected Sub lvInfoMembre_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvInfoMembre.ItemCommand

        If e.CommandName = "Edit" Then
            btnHistorique.Visible = False

        Else
            btnHistorique.Visible = True
        End If

    End Sub

End Class
