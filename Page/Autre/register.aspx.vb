Imports modelCLS
Imports masterPage
Partial Class Page_Autre_register
    Inherits System.Web.UI.Page

    Dim entClient As modelCLSContainer = New modelCLSContainer

    Dim idFamille As Integer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim famille = entClient.MembresJeu.OrderBy(Function(n) n.idMembre).[Select](Function(n) n.familleID).Any

        If famille = Nothing Then
            idFamille = 0
        Else
            idFamille = entClient.MembresJeu.OrderBy(Function(n) n.idMembre).[Select](Function(n) n.familleID).Max
        End If
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

    Sub validationCourriel(sender As Object, args As ServerValidateEventArgs)

        Dim txtCourriel As TextBox = FindChildControl(Of TextBox)(lvNouveauMembre, "txtCourriel")

        Dim utilisateur = (From A In entClient.MembresJeu Where (A.courriel = txtCourriel.Text) Select A).Any

        If utilisateur = Nothing Then
            args.IsValid = True
        Else
            args.IsValid = False
            SetFocus(txtCourriel)
        End If
    End Sub

End Class
