Imports modelCLS
Imports masterPage
Partial Class Page_Autre_register
    Inherits System.Web.UI.Page

    Dim entClient As modelCLSContainer = New modelCLSContainer
    Dim idFamille As Integer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        idFamille = entClient.MembresJeu.OrderBy(Function(n) n.idMembre).[Select](Function(n) n.familleID).Max
    End Sub

    Protected Sub lvNouveauMembre_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvNouveauMembre.ItemInserting
        Dim rolePrincipal As Short = 3

        e.Values("dateInscription") = Date.Now.ToShortDateString
        e.Values("familleID") = CType(idFamille + 1, Short)
        e.Values("RoleJeu_idRole") = rolePrincipal
    End Sub

    Protected Sub lvNouveauMembre_ItemInserted(sender As Object, e As System.Web.UI.WebControls.ListViewInsertedEventArgs) Handles lvNouveauMembre.ItemInserted
        Dim idMembre As String = entClient.MembresJeu.OrderBy(Function(n) n.idMembre).[Select](Function(n) n.idMembre).Max

        Dim url As String
        url = "../Client/home_member.aspx?idMembre=" & idMembre
        Response.Redirect(url)
    End Sub

    Private Function ValidateValue(PropertyToCheck As String) As Boolean
        '// Return true if Username is Unique
        Dim rtnValue = False

        If (entClient.MembresJeu.Any()) Then ' Check if there are "any" records in the Employee table

            Dim courrielClient = From c In entClient.MembresJeu Select c.courriel ' Select just the PayrollNumber column to work with

            For Each item As Object In courrielClient ' Loop through each employee in the Employees entity

                If (item = PropertyToCheck) Then ' Check if PayrollNumber in current row matches PropertyToCheck

                    '// Found a match, throw exception and return False
                    rtnValue = False
                    Exit For
                Else
                    '// No matches, return True (Unique)
                    rtnValue = True
                End If
            Next
        Else
            '// The is currently no employees in the person entity so return True (Unqiue)
            rtnValue = True
        End If
        Return rtnValue

    End Function

    Sub validationCourriel(sender As Object, args As ServerValidateEventArgs)

        Dim txtCourriel As TextBox = FindChildControl(Of TextBox)(lvNouveauMembre, "txtCourriel")

        If ValidateValue(txtCourriel.Text) Then
            args.IsValid = True
        Else
            args.IsValid = False
        End If
    End Sub

End Class
