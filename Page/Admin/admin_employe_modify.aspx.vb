'Créé par Samuel Bellerose
'Le 16 septembre 2012
'Dernière mise à jour le 25 septembre 2012
'Classe partielle qui modifi les informations d'un employé dans la BD

Imports modelCLS
Partial Class Page_Admin_admin_employe_modify
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing
    
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim entEmploye As New modelCLSContainer
        leContext = New modelCLSContainer
    End Sub
End Class
