'Créé par Francis Griggs
'Le 16 septembre 2012
'Dernière mise à jour le 25 septembre 2012
'Classe partielle qui ajoute un groupe dans la BD associé à un cours
Imports modelCLS
Imports System.Net.Mail
Imports System.Net
Imports System.Net.Mail.SmtpClient
Imports System.Data

Partial Class Page_Admin_admin_group_add
    Inherits masterPage

    Private Shared leContext As modelCLSContainer = Nothing

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        leContext = New modelCLSContainer
    End Sub

    Protected Sub lvGroupe_ItemInserting(sender As Object, e As System.Web.UI.WebControls.ListViewInsertEventArgs) Handles lvGroupe.ItemInserting
        Dim groupeNo As Short = Nothing
        Dim coursNo As Short = Nothing
        Dim coursNom As String = Nothing
        Dim coursGroupe = Nothing

        desactiveControles(failImage, lblFailure)
        desactiveControles(checkImage, lblFelicitation)

        coursNo = ddlNomCoursAjout.SelectedValue
        coursNom = ddlNomCoursAjout.SelectedItem.Text

        coursGroupe = leContext.GroupeJeu.Where(Function(n) n.Cours_idCours = coursNo).[Select](Function(n) n.idGroupe).Any

        If coursGroupe = Nothing Then
            groupeNo = 1
        Else
            groupeNo = leContext.GroupeJeu.Where(Function(n) n.Cours_idCours = coursNo).OrderBy(Function(n) n.noGroupe).[Select](Function(n) n.noGroupe).Max
            groupeNo += 1
        End If

        e.Values("nomGroupe") = coursNom + CType(groupeNo, String)
        e.Values("noGroupe") = groupeNo
        e.Values("Cours_idCours") = coursNo

        'Lorsque tous les groupes sont complets et qu'on en ajoute un, on envoit un message à tous les membres qui ont choisit se cours dans la liste d'attente
        If coursComplet(coursNo) Then

            'On va chercher le premier membre dans la liste d'attente
            Dim membreListeAttente As ListeAttenteJeu = (From A In leContext.ListeAttenteJeu Where (A.Cours_idCours = coursNo) Select A).FirstOrDefault
            Dim nomCours As String = membreListeAttente.CoursJeu.nomCours.ToString
            'Boucle qui s'exécute tant qu'il y a un membre dans la liste d'attente en rapport avec le cours
            While membreListeAttente IsNot Nothing

                'On va chercher le membre principal du membre dans la liste d'attente pour l'envoi du courriel personnalisé
                Dim membrePrincipal As MembresJeu = (From A In leContext.MembresJeu Where (A.familleID = membreListeAttente.MembresJeu.familleID) Select A).FirstOrDefault

                'Message initiale
                Dim message As String = "<p>Bonjour " & membrePrincipal.prenomMembre & " " & membrePrincipal.nomMembre & "! </p><br /><p>Ce message est pour vous informer que suite à l'inscription de vous ou un des membres de votre famille à la liste d'attente du cours de " & membreListeAttente.CoursJeu.nomCours & ", les membres suivants pourront s'inscrire dès maintenant puisqu'un groupe à été ouvert !</p><br /><br />"

                'Boucle qui s'exécute tant qu'il y a plusieurs membre dans la même famille qui attente pour ce cours
                While membreListeAttente.MembresJeu.familleID = membrePrincipal.familleID
                    message += membreListeAttente.MembresJeu.prenomMembre & " " & membreListeAttente.MembresJeu.nomMembre & " pourra s'inscrire au cours de " & membreListeAttente.CoursJeu.nomCours & "<br /><br />"
                    leContext.DeleteObject(membreListeAttente)
                    leContext.SaveChanges()
                    membreListeAttente = (From A In leContext.ListeAttenteJeu Where (A.Cours_idCours = coursNo) Select A).FirstOrDefault
                    If membreListeAttente Is Nothing Then
                        Exit While
                    End If
                End While

                'Création de l'email personnalisé
                Dim mm As MailMessage = New MailMessage()
                mm.From = New MailAddress("samuel.bellerose@me.com")
                mm.Subject = "Ouverture d'un nouveau groupe pour le cours de " & nomCours & ""
                mm.Body = message
                mm.IsBodyHtml = True
                mm.To.Add(New MailAddress(membrePrincipal.courriel))

                'Envoie de l'email personnalisé grâce à un compte GMAIL
                Dim smtp As SmtpClient = New SmtpClient
                smtp.Host = "smtp.gmail.com"
                smtp.EnableSsl = True
                Dim NetworkCred As NetworkCredential = New System.Net.NetworkCredential()
                NetworkCred.UserName = "samuel.bellerose1991@gmail.com"
                NetworkCred.Password = "imten100"
                smtp.UseDefaultCredentials = True
                smtp.Credentials = NetworkCred
                smtp.Port = 587
                smtp.Send(mm)
            End While
        End If
    End Sub

    'Fonction qui vérifie si le cours est complet. Retourne vrai s'il est complet ou faux s'il y a encore des groupes avec de la place disponible
    Public Function coursComplet(ByVal noCours As Integer) As Boolean
        coursComplet = True
        Dim nbGroupe As Integer = (From A In leContext.GroupeJeu Where (A.Cours_idCours = noCours) Select A).Count
        Dim nbGroupeComplet As Integer = 0

        For Each groupe As GroupeJeu In leContext.GroupeJeu
            If calculeNbPlaceRestante(groupe.idGroupe) = 0 And groupe.Cours_idCours = noCours Then
                nbGroupeComplet += 1
            End If
        Next

        If nbGroupe = nbGroupeComplet Then
            coursComplet = True
        Else
            coursComplet = False
        End If

        If nbGroupe = 0 Then
            coursComplet = False
        End If

        Dim nbPersonneListeAttente As Integer = (From A In leContext.ListeAttenteJeu Where (A.Cours_idCours = noCours) Select A).Count

        If nbPersonneListeAttente Then
        Else
            coursComplet = False
        End If

        Return coursComplet
    End Function

    'Fonction qui calcule le nombre de place qui reste dans un groupe
    Public Function calculeNbPlaceRestante(ByVal idGroupe As Integer) As Integer
        Dim leGroupe As GroupeJeu = (From A In leContext.GroupeJeu Where (A.idGroupe = idGroupe) Select A).FirstOrDefault
        Dim nbAbonne As Integer = (From A In leContext.AbonnementJeu Where (A.Groupe_idGroupe = idGroupe) Select A).Count
        Dim placeRestante As Integer = leGroupe.nbMax - nbAbonne
        Return placeRestante
    End Function

    'Affiche le nombre de personne dans la liste d'attente pour une activité
    Protected Sub ddlNomCoursAjout_DataBound(sender As Object, e As System.EventArgs) Handles ddlNomCoursAjout.DataBound
        Dim noCours As Integer = ddlNomCoursAjout.SelectedValue
        noCours = (From A In leContext.ListeAttenteJeu Where (A.Cours_idCours = noCours) Select A).Count
        If noCours = 0 Then
            lblListeAttente.Visible = False
        Else
            lblListeAttente.Text = "Il y a " & noCours & " personnes dans la liste d'attente."
            lblListeAttente.Visible = True
        End If
    End Sub

    'Affiche le nombre de personne dans la liste d'attente pour une activité lorsque l'on change de cours
    Protected Sub ddlNomCoursAjout_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles ddlNomCoursAjout.SelectedIndexChanged
        Dim noCours As Integer = ddlNomCoursAjout.SelectedValue
        noCours = (From A In leContext.ListeAttenteJeu Where (A.Cours_idCours = noCours) Select A).Count
        If noCours = 0 Then
            lblListeAttente.Visible = False
        Else
            lblListeAttente.Text = "*Il y a " & noCours & " personnes dans la liste d'attente."
            lblListeAttente.Visible = True
        End If
        desactiveControles(checkImage, lblFelicitation)
        desactiveControles(failImage, lblFailure)
    End Sub

    'Petite fonction qui reset les labels de message d'erreur/succès de mise-à-jour/suppression/ajout
    Sub resetLabel(sender As Object, e As EventArgs)
        desactiveControles(checkImage, lblFelicitation)
        desactiveControles(failImage, lblFailure)
    End Sub

#Region "Traitements des erreurs"
    Protected Sub dsGroupeAjout_Deleted(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsGroupeAjout.Deleted
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE LA SUPPRESSION D'UN GROUPE", e.Exception)
            e.ExceptionHandled = True
            desactiveControles(checkImage, lblFelicitation)
            activeControles(failImage, lblFailure)
            lblFailure.Text = "Impossible de supprimer le groupe, des membres y sont déjà inscrit."
        Else
            desactiveControles(failImage, lblFailure)
            activeControles(checkImage, lblFelicitation)
            lblFelicitation.Text = "Le groupe a &eacute;t&eacute; supprimer avec succ&egrave;s !"
        End If
    End Sub

    Protected Sub dsGroupeAjout_Inserted(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsGroupeAjout.Inserted
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE L'AJOUT D'UN GROUPE", e.Exception)
            e.ExceptionHandled = True
            activeControles(failImage, lblFailure)
            lblFailure.Text = "Une erreur s'est produite lors de l'ajout du groupe..."
        Else
            activeControles(checkImage, lblFelicitation)
            lblFelicitation.Text = "Le groupe a &eacute;t&eacute; ajout&eacute; avec succ&egrave;s !"
        End If
    End Sub

    Protected Sub dsGroupeAjout_Updated(sender As Object, e As System.Web.UI.WebControls.EntityDataSourceChangedEventArgs) Handles dsGroupeAjout.Updated
        If e.Exception IsNot Nothing Then
            traiteErreur(Page, "ERREUR LORS DE LA MISE À JOUR D'UN GROUPE", e.Exception)
            e.ExceptionHandled = True
            activeControles(failImage, lblFailure)
            lblFailure.Text = "Une erreur s'est produite lors de la mise &agrave; jour du groupe."
        Else
            activeControles(checkImage, lblFelicitation)
            lblFelicitation.Text = "Le groupe a &eacute;t&eacute; mis &agrave; jour avec succ&egrave;s !"
        End If
    End Sub
#End Region
End Class

