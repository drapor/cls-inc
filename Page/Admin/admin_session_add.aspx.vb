'Créé par Francis Griggs
'Le 16 septembre 2012
'Dernière mise à jour le 25 septembre 2012
'Classe partielle qui ajoute une session dans la BD associé à un groupe 

Imports masterPage
Partial Class Page_Admin_admin_session_add
    Inherits masterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim anneeDDL As DropDownList = FindChildControl(Of DropDownList)(lvSession, "ddlAnnee")
        Dim counter As Integer = 0
        Dim annee As Integer = Date.Now.ToString("yyyy")

        For counter = 0 To 1 Step 1
            anneeDDL.Items.Insert(counter, annee)
            annee += 1
        Next
    End Sub

    Protected Sub lvSession_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvSession.ItemInserting
        Dim saisonDDL As DropDownList = FindChildControl(Of DropDownList)(lvSession, "ddlSaison")
        Dim anneeDDL As DropDownList = FindChildControl(Of DropDownList)(lvSession, "ddlAnnee")

        e.Values("nomSession") = saisonDDL.SelectedItem.Text + "-" + anneeDDL.SelectedItem.Text
    End Sub


End Class
