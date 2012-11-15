
Partial Class Page_Autre_cart_paiement
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim counter As Integer

        Dim annee As Integer = Date.Now.ToString("yyyy")

        For counter = 0 To 10 Step 1
            ddlAnnee.Items.Insert(counter, annee)
            annee += 1
        Next


    End Sub

End Class
