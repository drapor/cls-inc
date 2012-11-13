
Partial Class Page_Client_description
    Inherits masterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim cours As Integer = Session("idCours")
        dsCours.WhereParameters("cours").DefaultValue = cours
        dsGroupes.WhereParameters("coursID").DefaultValue = cours

        Dim categorie As String = Request.QueryString("categorie")
        Session("categorie") = categorie
        If categorie = "Sport" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/sports_banner.png"
        ElseIf categorie = "Loisir" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/loisir_banner.png"
        ElseIf categorie = "Culture" Then
            imgCategory.ImageUrl = "~/App_Themes/Original/img/culture_banner.png"
        End If
        lblNomCours.Text = FindChildControl(Of HiddenField)(lvCours, "hiddenNomCours").Value.ToString

    End Sub

    'Protected Sub lvCours_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvCours.ItemCommand

    '    Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
    '    Dim idCours As Integer = lvCours.DataKeys(dataItem.DisplayIndex).Value.ToString()

    '    If e.CommandName = "selection" Then

    '    End If

    'End Sub

    Sub inscriptionCours(sender As Object, e As EventArgs)

        Session("idCoursSelected") = Session("idCours")
        Session("idGroupeSelected") = CType(sender, Button).CommandArgument.ToString
        Response.Redirect("~/Page/Client/member_inscription_memberchoice.aspx")

        'Dim aCookie As New HttpCookie("commande")
        'aCookie.Values("idMembre") = Session("idUser")
    End Sub

    Sub retourCategorie(sender As Object, e As EventArgs)
        Dim categorie As String = Request.QueryString("categorie")
        Dim url As String
        url = "../Autre/category.aspx?categorie=" & categorie
        Response.Redirect(url)
    End Sub

    Protected Sub lvGroupes_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvGroupes.ItemCommand
        If e.CommandName = "inscription" Then
            Dim idMembreInscrit As Integer = FindChildControl(Of DropDownList)(lvGroupes, "ddlMembreFamille").SelectedValue

        End If
    End Sub

    'Protected Sub lvFamille_ItemCommand(sender As Object, e As System.Web.UI.WebControls.ListViewCommandEventArgs) Handles lvFamille.ItemCommand
    '    Dim dataItem As ListViewDataItem = DirectCast(e.Item, ListViewDataItem)
    '    Dim idMembre As Integer = lvFamille.DataKeys(dataItem.DisplayIndex).Value.ToString()

    '    Session("idMembreFamille") = idMembre

    '    If e.CommandName = "afficher" Then
    '        Response.Redirect("../Client/member_family.aspx")
    '    ElseIf e.CommandName = "ajouter" Then
    '        Response.Redirect("../Client/member_family_add.aspx")
    '    End If

    'End Sub
End Class
