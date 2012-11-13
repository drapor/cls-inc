
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
        If (ddlMembreFamille.Items.Count <> 0) Then
            Dim groupIDInt As Integer = Session("idGroupeSelected")
            Dim coursIDInt As Integer = Session("idCoursSelected")
            Dim membreIDSrting As String = ddlMembreFamille.SelectedItem.Value.ToString


            If (Session("groupeIDList") Is Nothing) Then
                Dim groupeID As New List(Of String)
                Dim coursID As New List(Of String)
                Dim membreID As New List(Of String)

                groupeID.Add(groupIDInt.ToString)
                coursID.Add(coursIDInt.ToString)
                membreID.Add(membreIDSrting)

                Session("groupeIDList") = groupeID
                Session("coursIDList") = coursID
                Session("membreIDList") = membreID

            Else
                Dim groupeIDList As List(Of String) = Session("groupeIDList")
                Dim coursIDList As List(Of String) = Session("coursIDList")
                Dim membreIDList As List(Of String) = Session("membreIDList")

                'Création d'une liste pour chaque éléments ajouter pour un membre
                groupeIDList = Session("groupeIDList")
                coursIDList = Session("coursIDList")
                membreIDList = Session("membreIDList")

                groupeIDList.Add(groupIDInt.ToString)
                coursIDList.Add(coursIDInt.ToString)
                membreIDList.Add(membreIDSrting)

                Session("groupeIDList") = groupeIDList
                Session("coursIDList") = coursIDList
                Session("membreIDList") = membreIDList
            End If
            ddlMembreFamille.Items.RemoveAt(ddlMembreFamille.SelectedIndex)
            Response.Redirect(Request.Url.AbsolutePath)
        End If
        
    End Sub

End Class
