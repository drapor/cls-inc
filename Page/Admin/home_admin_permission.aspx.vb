Imports modelCLS
Partial Class Page_Admin_home_admin_permission
    Inherits System.Web.UI.Page


    Private Shared leContext As modelCLSContainer = Nothing

    'Protected Sub lstEmploye_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles lstEmploye.SelectedIndexChanged

    '    If dropDownType.Items.Count = 1 Then
    '        dropDownType.Items.RemoveAt(0)
    '    End If

    '    If lstEmploye.SelectedItem.Value = 0 Then
    '        lblEmployePresentement.Visible = "false"
    '        lblEmployePermission.Visible = "false"
    '        dsPermission.WhereParameters("noRole").DefaultValue = 0
    '        dsPermission.Where = ("@noRole = it.idRole")
    '        dsPermission.DataBind()
    '        dropDownType.DataBind()
    '    ElseIf lstEmploye.SelectedItem.Value = 1 Then
    '        lblEmployePresentement.Visible = "true"
    '        lblEmployePermission.Visible = "true"
    '        lblEmployePermission.Text = "Administrateur"
    '        dsPermission.WhereParameters("noRole").DefaultValue = 2
    '        dsPermission.Where = ("@noRole = it.idRole")
    '        dsPermission.DataBind()
    '        dropDownType.DataBind()
    '    ElseIf lstEmploye.SelectedItem.Value = 2 Then
    '        lblEmployePresentement.Visible = "true"
    '        lblEmployePermission.Visible = "true"
    '        lblEmployePermission.Text = "Employé"
    '        dsPermission.WhereParameters("noRole").DefaultValue = 1
    '        dsPermission.Where = ("@noRole = it.idRole")
    '        dsPermission.DataBind()
    '        dropDownType.DataBind()
    '    End If
    'End Sub

    'Sub modifierPermission(sender As Object, e As EventArgs)
    '    Dim entPermission As New modelCLSContainer
    '    Dim leRole As Integer = dropDownType.SelectedItem.Value
    '    Dim lEmploye As String = lstEmploye.SelectedItem.Text


    '    Dim unMembre As MembresJeu = Nothing

    'End Sub

    'Public Sub ChangeIDRole(membreID As Integer, membreRole As Integer)
    '    Dim membre = New MembresJeu() With {.Role_idRole = membreRole, .idMembre = membreRole}
    '    Using db = New modelCLSContainer
    '        db.MembresJeu.Attach(membre)
    '        membre.idMembre = membreRole
    '        db.SaveChanges()
    '    End Using
    'End Sub


    'Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
    '    If lstEmploye.SelectedItem.Value = 0 Then
    '        lblEmployePresentement.Visible = "false"
    '    End If
    'End Sub

End Class
