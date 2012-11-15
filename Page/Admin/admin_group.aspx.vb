'Créé par Francis Griggs
'Le 16 septembre 2012
'Dernière mise à jour le 25 septembre 2012
'Classe partielle qui ajoute un groupe dans la BD associé à un cours

Imports masterPage
Imports modelCLS

Partial Class Page_Admin_admin_group_add
    Inherits masterPage

    Dim entClient As modelCLSContainer = New modelCLSContainer

    Protected Sub lvAjout_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvAjout.ItemInserting
        Dim groupeNo As Short = Nothing
        Dim ddlCoursNo As Short = Nothing
        Dim ddlCoursNom As String = Nothing
        Dim ddlCours = Nothing

        ddlCoursNo = ddlNomCoursAjout.SelectedValue
        ddlCoursNom = ddlNomCoursAjout.SelectedItem.Text

        ddlCours = entClient.GroupeJeu.Where(Function(n) n.Cours_idCours = ddlCoursNo).[Select](Function(n) n.idGroupe).Any

        If ddlCours = Nothing Then
            groupeNo = 1
        Else
            groupeNo = entClient.GroupeJeu.Where(Function(n) n.Cours_idCours = ddlCoursNo).OrderBy(Function(n) n.noGroupe).[Select](Function(n) n.noGroupe).Max
            groupeNo += 1
        End If

        e.Values("Cours_idCours") = ddlCoursNo
        e.Values("noGroupe") = groupeNo
        e.Values("nomGroupe") = ddlCoursNom + CType(groupeNo, String)

        dsGroupeAjout.DataBind()

    End Sub

    Protected Sub lvSupprime_ItemDeleting(sender As Object, e As System.Web.UI.WebControls.ListViewDeleteEventArgs) Handles lvSupprime.ItemDeleting
        ddlNomGroupeSupprime.Items.RemoveAt(ddlNomGroupeSupprime.SelectedIndex)
    End Sub

    Sub actionAjout(sender As Object, e As EventArgs)
        MVPrincipal.SetActiveView(viewAjout)
    End Sub

    Sub actionModifie(sender As Object, e As EventArgs)
        MVPrincipal.SetActiveView(viewModifie)
    End Sub

    Sub actionSupprime(sender As Object, e As EventArgs)
        MVPrincipal.SetActiveView(viewSupprime)
        lvSupprime.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load

    End Sub
End Class
