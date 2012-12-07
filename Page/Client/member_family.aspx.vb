Imports modelCLS
Imports masterPage

Partial Class Page_Client_client_membre_famille
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        dsFamille.WhereParameters("MembreID").DefaultValue = Session("idMembreFamille")

        dsAbonnement.WhereParameters("MembreID").DefaultValue = Session("idMembreFamille")

    End Sub

    Protected Sub lvAbonnement_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvAbonnement.ItemDataBound
        Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
        Dim dataSourceHoraire As EntityDataSource = FindChildControl(Of EntityDataSource)(dataItem, "dsHoraire")
        Dim idGroupe As Integer = FindChildControl(Of HiddenField)(lvAbonnement, "hiddenNoGroupe").Value
        dataSourceHoraire.WhereParameters("groupeID").DefaultValue = idGroupe
    End Sub

End Class
