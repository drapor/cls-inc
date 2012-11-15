
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

    Protected Sub ddlMembreFamille_DataBound(sender As Object, e As System.EventArgs) Handles ddlMembreFamille.DataBound
        Dim membreInscritID As List(Of String) = Session("membreIDList")
        Dim groupeChoisis As List(Of String) = Session("groupeIDList")
        Dim membresDropDown As DropDownList = ddlMembreFamille
        Dim itemDeleter As New List(Of String)
        Dim nbItemSupprimer As Integer = Nothing


            If membreInscritID IsNot Nothing Then
                For i As Integer = 0 To groupeChoisis.Count - 1 Step 1
                    If groupeChoisis(i).ToString = Session("idGroupeSelected") Then
                        For b As Integer = 0 To ddlMembreFamille.Items.Count - 1 Step 1
                            If membreInscritID(i).ToString = ddlMembreFamille.Items.Item(b).Value Then
                                Dim itemToDelete As String = ddlMembreFamille.Items.Item(b).Value
                                itemDeleter.Add(itemToDelete)
                            End If
                        Next
                    End If
                Next

                For i As Integer = 0 To itemDeleter.Count - 1 Step 1
                For b As Integer = 0 To ddlMembreFamille.Items.Count - 1 - nbItemSupprimer Step 1
                    If ddlMembreFamille.Items.Item(b).Value = itemDeleter(i).ToString Then
                        ddlMembreFamille.Items.RemoveAt(b)
                        nbItemSupprimer += 1
                        If ddlMembreFamille.Items.Count - 1 - nbItemSupprimer = 0 Then
                            Exit For
                        End If
                    End If
                Next
                Next


                'For i As Integer = 0 To ddlMembreFamille.Items.Count - 1 Step 1
                '    For b As Integer = 0 To itemDeleter.Count + nbItemSupprimer - 1 Step 1
                '        If ddlMembreFamille.Items.Item(i).Value = itemDeleter(b).ToString Then
                '            ddlMembreFamille.Items.RemoveAt(i)
                '        End If
                '    Next
                'Next

                'For Each groupe In groupeChoisis
                '    If groupe.ToString = Session("idGroupeSelected").ToString Then
                '        For Each membre In membreInscritID
                '            If membreInscritID.IndexOf(membre).ToString = groupeChoisis.IndexOf(groupe).ToString Then
                '                For Each membreFamille As ListItem In ddlMembreFamille.Items
                '                    If membre.ToString = membreFamille.Value Then
                '                        Dim itemToDelete As String = membreFamille.ToString
                '                        itemDeleter.Add(itemToDelete)
                '                    End If
                '                Next
                '            End If
                '        Next
                '    End If
                'Next
            Else
            End If

            'If groupe.ToString = Session("idGroupeSelected").ToString Then
            '    For Each membre In membreInscritID



            '        If ddlMembreFamille.SelectedItem IsNot Nothing Then
            '            If membre.ToString = ddlMembreFamille.SelectedItem.Value Then
            '                Dim itemToDelete As ListItem = ddlMembreFamille.SelectedItem
            '                membresDropDown.Items.Remove(itemToDelete)
            '            End If
            '        Else
            '        End If
            '    Next
            'End If
    End Sub

    Protected Sub dsMembreFamille_DataBinding(sender As Object, e As System.EventArgs) Handles dsMembreFamille.DataBinding

    End Sub
End Class
