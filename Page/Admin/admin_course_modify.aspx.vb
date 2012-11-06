'Créé par Samuel Bellerose
'Le 25 septembre 2012
'Dernière mise à jour le 5 octobre 2012
'Classe partielle qui modifi les informations d'un cours pour ensuite les enregistrer dans la BD

Imports modelCLS
Partial Class Page_Admin_admin_course_modify
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub

End Class
