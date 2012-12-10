'Créé par Francis Griggs
'Le 12 septembre 2012
'Dernière mise à jour le 2 décembre 2012

Imports modelCLS
Imports masterPage
Partial Class Page_Client_member_family_add
    Inherits System.Web.UI.Page

    Public entClient As modelCLSContainer = New modelCLSContainer

    'Événement ItemInserted du listview lvMembreFamille qui redirige vers la page du membre après qu'il soit créé
    Protected Sub lvMembreFamille_ItemInserted(sender As Object, e As System.Web.UI.WebControls.ListViewInsertedEventArgs) Handles lvMembreFamille.ItemInserted
        Dim idMembre As String = entClient.MembresJeu.OrderBy(Function(n) n.idMembre).[Select](Function(n) n.idMembre).Max

        Session("idMembreFamille") = idMembre
        Response.Redirect("../Client/member_family.aspx")
    End Sub

    'Événement ItemInserting du listview lvMembreFamille qui insert les valeurs du courriel, mot passe, id famille, adresse, etc. dans les membres
    Protected Sub lvMembreFamille_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvMembreFamille.ItemInserting
        e.Values("courriel") = Session("userCourriel")
        e.Values("motPasse") = Session("userMotPasse")
        e.Values("familleID") = Session("idFamille")
        e.Values("adresse") = Session("userAdresse")
        e.Values("ville") = Session("userVille")
        e.Values("telephoneMembre") = Session("userTelephone")
        e.Values("codePostal") = Session("userCodePostal")
        e.Values("dateInscription") = Date.Now.ToShortDateString

    End Sub

End Class
