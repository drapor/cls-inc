'Créé par Francis Griggs
'Le 12 septembre 2012
'Dernière mise à jour le 2 décembre 2012

Imports modelCLS
Imports masterPage

Partial Class Page_Client_client_membre_famille
    Inherits System.Web.UI.Page

    'Événement Page_Load qui set les whereparameter des datasources dsFamille et dsAbonnement
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

        dsFamille.WhereParameters("MembreID").DefaultValue = Session("idMembreFamille")

        dsAbonnement.WhereParameters("MembreID").DefaultValue = Session("idMembreFamille")

    End Sub

    'Événement ItemDataBound du listview lvAbonnement qui set le whereparameter du datasource dsHoraire grace au datakey
    Protected Sub lvAbonnement_ItemDataBound(sender As Object, e As System.Web.UI.WebControls.ListViewItemEventArgs) Handles lvAbonnement.ItemDataBound
        Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
        Dim dataSourceHoraire As EntityDataSource = FindChildControl(Of EntityDataSource)(dataItem, "dsHoraire")
        Dim idGroupe As Integer = FindChildControl(Of HiddenField)(lvAbonnement, "hiddenNoGroupe").Value
        dataSourceHoraire.WhereParameters("groupeID").DefaultValue = idGroupe
    End Sub

End Class
