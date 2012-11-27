
Partial Class Page_Client_cart_paiement
    Inherits masterPage

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        'Affichage du panier
        Dim counter As Integer
        Dim annee As Integer = Date.Now.ToString("yyyy")
        For counter = 0 To 10 Step 1
            ddlAnnee.Items.Insert(counter, annee)
            annee += 1
        Next

        'Initialisation regEx du numéro de la carte de crédit
        If ddlType.SelectedIndex = 0 Then
            regExVisa.Enabled = True
        Else
            regExVisa.Enabled = False
        End If
    End Sub

#Region "Gestion des RegEx lors d'un changement de type de carte"
    Sub regExCarteVerification(sender As Object, e As EventArgs)
        If ddlType.SelectedIndex = 1 Then
            regExMasterCard.Enabled = True
            regExAmericanExpress.Enabled = False
        ElseIf ddlType.SelectedIndex = 2 Then
            regExAmericanExpress.Enabled = True
            regExMasterCard.Enabled = False
        Else
            regExAmericanExpress.Enabled = False
            regExMasterCard.Enabled = False
        End If
    End Sub
#End Region

#Region "Événement sur le bouton Paiement Paypal"
    Sub paiementPaypal(sender As Object, e As EventArgs)
        Dim aCookie As HttpCookie = Request.Cookies("inscription")
        Dim montantTotalLabel As Label = FindChildControl(Of Label)(lvMontantPaiement, "lblMontantInscription")
        Dim montantTotal As String = montantTotalLabel.Text
        doTransaction(txtNumero.Text,
              ddlType.SelectedItem.Text,
              ddlMois.SelectedValue.ToString & ddlAnnee.SelectedValue.ToString,
              txtCvv.Text,
              montantTotal,
              aCookie.Values("prenom"),
              aCookie.Values("nom"),
              aCookie.Values("adresse"),
              aCookie.Values("ville"),
              "Quebec",
              aCookie.Values("codePostal"))

    End Sub
#End Region

#Region "Fonction doTransaction"
    
#End Region

End Class
