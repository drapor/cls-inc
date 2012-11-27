'Créé par Francis Griggs
'Le 16 septembre 2012
'Dernière mise à jour le 25 septembre 2012
'Classe partielle qui ajoute un groupe dans la BD associé à un cours

Imports masterPage
Imports modelCLS
Imports System.Data

Partial Class Page_Admin_admin_group_add
    Inherits masterPage

    Dim entClient As modelCLSContainer = New modelCLSContainer

    Protected Sub actionAjout(sender As Object, e As EventArgs)
        Dim groupeNo As Short = Nothing
        Dim ddlCoursNo As Short = Nothing
        Dim ddlCoursNom As String = Nothing
        Dim ddlCours = Nothing

        Dim txtNbMax As TextBox = FindChildControl(Of TextBox)(listeGroupe, "txtNombreAjout")

        Dim groupe As GroupeJeu = Nothing

        ddlCoursNo = ddlNomCoursAjout.SelectedValue
        ddlCoursNom = ddlNomCoursAjout.SelectedItem.Text

        ddlCours = entClient.GroupeJeu.Where(Function(n) n.Cours_idCours = ddlCoursNo).[Select](Function(n) n.idGroupe).Any

        If ddlCours = Nothing Then
            groupeNo = 1
        Else
            groupeNo = entClient.GroupeJeu.Where(Function(n) n.Cours_idCours = ddlCoursNo).OrderBy(Function(n) n.noGroupe).[Select](Function(n) n.noGroupe).Max
            groupeNo += 1
        End If

        groupe = GroupeJeu.CreateGroupeJeu(0, ddlCoursNom + CType(groupeNo, String), txtNbMax.Text, ddlCoursNo, groupeNo)
        entClient.GroupeJeu.AddObject(groupe)
        entClient.SaveChanges()
        listeGroupe.DataBind()

    End Sub

End Class
