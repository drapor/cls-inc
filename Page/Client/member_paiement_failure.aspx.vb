
Partial Class Page_Client_member_paiement_failure
    Inherits masterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        ''Affichage du panier
        'Dim counter As Integer
        'Dim annee As Integer = Date.Now.ToString("yyyy")
        'For counter = 0 To 10 Step 1
        '    ddlAnnee.Items.Insert(counter, annee)
        '    annee += 1
        'Next
        Dim aCookie As HttpCookie = Request.Cookies("inscription")
        'lblNomClient.Text = aCookie.Values("prenom") & aCookie.Values("nom")
    End Sub
End Class
