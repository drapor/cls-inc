'Créé par Samuel Bellerose
'Le 16 septembre 2012
'Dernière mise à jour le 25 septembre 2012
'Classe partielle qui modifi les tarifs relatifs aux inscriptions et aux paiements

Partial Class Page_Admin_admin_group_modify
    Inherits masterPage

    'Petite fonction qui affiche la réussite des changements
    Sub confirmation(sender As Object, e As EventArgs)
        If Page.IsValid = True Then
            lblFelicitation.Visible = True
            checkImage.Visible = True
        End If
    End Sub

End Class
