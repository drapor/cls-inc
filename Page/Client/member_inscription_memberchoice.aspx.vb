Imports modelCLS

Partial Class Page_Client_member_inscription_memberchoice
    Inherits masterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim cours As Integer = Session("idCoursSelected")
        dsCours.WhereParameters("cours").DefaultValue = cours
        dsGroupes.WhereParameters("groupeID").DefaultValue = Session("idGroupeSelected")
        dsMembreFamille.WhereParameters("familleID").DefaultValue = Session("idFamille")

    End Sub

    Sub retourCategorie(sender As Object, e As EventArgs)
        Dim categorie As String = Request.QueryString("categorie")
        Dim url As String
        url = "../Client/member_description.aspx?categorie=" & (Session("categorie").ToString)
        Response.Redirect(url)
    End Sub

    Protected Sub lvGroupes_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvMembreInscrire.ItemCommand
        If e.CommandName = "inscription" Then
            Dim idMembreInscrit As Integer = FindChildControl(Of DropDownList)(lvMembreInscrire, "ddlMembreFamille").SelectedValue

        End If
    End Sub

    

    Sub inscriptionMembre(sender As Object, e As EventArgs)
        Dim entCommande As New modelCLSContainer
        Dim cookie As HttpCookie = Request.Cookies("noPanier")
        Dim unPanier As PanierJeu = Nothing
        Dim unItemPanier As ItemPanierJeu = Nothing

        If cookie Is Nothing Then
            cookie = New HttpCookie("noPanier")
            unPanier = PanierJeu.CreatePanierJeu(0, Session("idUser"))
            unItemPanier = ItemPanierJeu.CreateItemPanierJeu(0, Session("idGroupeSelected"), ddlMembreFamille.SelectedItem.Value, unPanier.idCommande)
            entCommande.PanierJeu.AddObject(unPanier)
            entCommande.ItemPanierJeu.AddObject(unItemPanier)
            entCommande.SaveChanges()
            cookie.Values("noPanier") = unPanier.idCommande
            cookie.Expires = System.DateTime.Now.AddDays(365)
            Response.Cookies.Add(cookie)
            Response.Redirect(Request.Url.AbsoluteUri, False)
        Else
            unItemPanier = ItemPanierJeu.CreateItemPanierJeu(0, Session("idGroupeSelected"), ddlMembreFamille.SelectedItem.Value, cookie.Values("noPanier"))
            entCommande.ItemPanierJeu.AddObject(unItemPanier)
            entCommande.SaveChanges()
            Response.Redirect(Request.Url.AbsoluteUri, False)
        End If

    End Sub

    Protected Sub ddlMembreFamille_DataBound(sender As Object, e As System.EventArgs) Handles ddlMembreFamille.DataBound
        Dim membreInscritID As List(Of String) = Session("membreIDList")
        Dim groupeChoisis As List(Of String) = Session("groupeIDList")
        Dim membresDropDown As DropDownList = ddlMembreFamille
        Dim itemDeleter As New List(Of String)
        Dim nbItemSupprimer As Integer = Nothing

        


        








        'If membreInscritID IsNot Nothing Then
        '    For i As Integer = 0 To groupeChoisis.Count - 1 Step 1
        '        If groupeChoisis(i).ToString = Session("idGroupeSelected") Then
        '            For b As Integer = 0 To ddlMembreFamille.Items.Count - 1 Step 1
        '                If membreInscritID(i).ToString = ddlMembreFamille.Items.Item(b).Value Then
        '                    Dim itemToDelete As String = ddlMembreFamille.Items.Item(b).Value
        '                    itemDeleter.Add(itemToDelete)
        '                End If
        '            Next
        '        End If
        '    Next
        '    For i As Integer = 0 To itemDeleter.Count - 1 Step 1
        '    For b As Integer = 0 To ddlMembreFamille.Items.Count - 1 - nbItemSupprimer Step 1
        '        If ddlMembreFamille.Items.Item(b).Value = itemDeleter(i).ToString Then
        '            ddlMembreFamille.Items.RemoveAt(b)
        '            nbItemSupprimer += 1
        '            If ddlMembreFamille.Items.Count - 1 - nbItemSupprimer = 0 Then
        '                Exit For
        '            End If
        '        End If
        '    Next
        '    Next

        'Else
        'End If

    End Sub
End Class
