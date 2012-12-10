﻿'Créé par Francis Griggs
'Le 16 septembre 2012
'Dernière mise à jour le 12 décembre 2012
'Classe partielle qui ajoute/modifie/supprime un horaire dans la BD associé à un groupe
'Principaux intrants:  Jour de la semaine; Heure de début; Heure de fin; No de local;
'Principaux extrants: Jour de la semaine; Heure de début; Heure de fin; No de local; Groupe; Cours;

Imports modelCLS

Partial Class Page_Admin_admin_schedule
    Inherits masterPage

    'Evénement Inserting du listview lvHoraire qui ajoute un horaire au groupe sélectionné dans le dropdownlist ddlNomGroupe
    Protected Sub lvHoraire_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvHoraire.ItemInserting
        Dim semaine As String = FindChildControl(Of DropDownList)(lvHoraire, "ddlSemaine").SelectedValue
        Dim idGroupe As Short = FindChildControl(Of DropDownList)(Me, "ddlNomGroupe").SelectedValue

        e.Values("GroupeJeu_idGroupe") = idGroupe
        e.Values("JourSemaine_idSemaine") = semaine
    End Sub

#Region "Traitements des erreurs"

    'Traite les erreurs de l'événement Deleted du datasource dsHoraire
    Protected Sub dsHoraire_Deleted(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsHoraire.Deleted
        If e.Exception IsNot Nothing Then
            masterPage.traiteErreur(Page, "ERREUR LORS DE LA SUPPRESSION D'UNE HORAIRE", e.Exception)
            e.ExceptionHandled = True
            desactiveControles(checkImage, lblFelicitation)
            activeFailure()
            lblFailure.Text = "Impossible de supprimer l'horaire."
        Else
            desactiveFailure()
            activeSuccess()
            lblFelicitation.Text = "L'horaire a &eacute;t&eacute; supprimer avec succ&egrave;s !"
        End If
    End Sub

    'Traite les erreurs de l'événement Inserted du datasource dsHoraire
    Protected Sub dsHoraire_Inserted(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsHoraire.Inserted
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE L'AJOUT D'UNE HORAIRE", e.Exception)
            e.ExceptionHandled = True
            activeFailure()
            lblFailure.Text = "Une erreur s'est produite lors de l'ajout de l'horaire..."
        Else
            activeSuccess()
            lblFelicitation.Text = "L'horaire a &eacute;t&eacute; ajout&eacute; avec succ&egrave;s !"
        End If
    End Sub

    'Traite les erreurs de l'événement Updated du datasource dsHoraire
    Protected Sub dsHoraire_Updated(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsHoraire.Updated
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE LA MISE À JOUR D'UN HORAIRE", e.Exception)
            e.ExceptionHandled = True
            activeFailure()
            lblFailure.Text = "Une erreur s'est produite lors de la mise &agrave; jour de l'horaire."
        Else
            activeSuccess()
            lblFelicitation.Text = "L'horaire a &eacute;t&eacute; mis &agrave; jour avec succ&egrave;s !"
        End If
    End Sub

    Sub resetLabel(sender As Object, e As EventArgs)
        desactiveFailure()
        desactiveSuccess()
    End Sub

    'Activation/Désactivation des messages d'erreur/succès de mise-à-jour/suppression/ajout de donné dans une horaire
    Sub activeSuccess()
        checkImage.Visible = True
        lblFelicitation.Visible = True
    End Sub

    Sub desactiveSuccess()
        checkImage.Visible = False
        lblFelicitation.Visible = False
    End Sub

    Sub activeFailure()
        failImage.Visible = True
        lblFailure.Visible = True
    End Sub

    Sub desactiveFailure()
        failImage.Visible = False
        lblFailure.Visible = False
    End Sub

#End Region
End Class
