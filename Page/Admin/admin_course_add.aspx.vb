'Créé par Samuel Bellerose
'Le 25 septembre 2012
'Dernière mise à jour le 5 octobre 2012
'Classe partielle qui crée un cours pour ensuite l'insérer dans la BD

Imports modelCLS
Partial Class Page_Admin_admin_course_add
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub

    'Message affichant l'ajout du cours
    Protected Sub dsCourseAdd_Inserted(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsCourseAdd.Inserted
        lblFelicitation.Visible = True
        checkImage.Visible = True
    End Sub

End Class
