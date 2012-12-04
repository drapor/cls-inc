Imports System
Imports System.Collections
Imports System.Linq
Imports System.Web
Imports System.Web.Services
Imports System.Web.Services.Protocols
Imports System.Xml.Linq
Imports System.Collections.Generic
Imports modelCLS
Partial Class Page_Employe_employe_client
    Inherits masterPage

    Dim entClient As modelCLSContainer = New modelCLSContainer

    Dim idFamille As Integer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim famille = entClient.MembresJeu.OrderBy(Function(n) n.idMembre).[Select](Function(n) n.familleID).Any

        If famille = Nothing Then
            idFamille = 1
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

        Response.Redirect("../Client/home_member.aspx")
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

    Sub actionRecherche(sender As Object, e As EventArgs)

        dsListView.WhereParameters("courriel").DefaultValue = txtCourriel.Text

    End Sub

    Protected Sub lvMembre_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvMembre.ItemCommand
        Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
        Dim idMembre As Integer = lvMembre.DataKeys(dataItem.DisplayIndex).Value.ToString()

        If e.CommandName = "modifier" Then
            Session("idClient") = idMembre
            Response.Redirect("../Employe/employe_home_member.aspx")
        End If
    End Sub

    Protected Sub lvMembreSupprime_ItemDeleted(sender As Object, e As System.Web.UI.WebControls.ListViewDeletedEventArgs) Handles lvMembreSupprime.ItemDeleted
        txtCourrielSupprime.Text = ""
        lblSupprime.Visible = True
    End Sub

    <System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()>
    Public Shared Function GetCompletionList(ByVal prefixText As String, ByVal count As Integer) As String()

        Dim entClient As modelCLSContainer = New modelCLSContainer

        Return entClient.MembresJeu.Where(Function(n) n.courriel.StartsWith(prefixText) And n.RoleJeu_idRole = 3).OrderBy(Function(n) n.courriel).[Select](Function(n) n.courriel).Take(count).ToArray()

    End Function

    Sub actionAjout(sender As Object, e As EventArgs)
        MVPrincipal.SetActiveView(viewAjout)
    End Sub

    Sub actionModifie(sender As Object, e As EventArgs)
        MVPrincipal.SetActiveView(viewModifie)
    End Sub

    Sub actionSupprime(sender As Object, e As EventArgs)
        MVPrincipal.SetActiveView(viewSupprime)
    End Sub
End Class
