Imports Microsoft.VisualBasic
Imports System.Globalization
Imports System.Threading
Imports System.Configuration
Imports System.Data
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Web.HttpRequest
Imports System.Web.Services
Imports System
Imports System.Collections
Imports System.Linq
Imports System.Web.Services.Protocols
Imports System.Xml.Linq
Imports System.Collections.Generic
Imports modelCLS
Imports System.IO

Public Class masterPage
    Inherits System.Web.UI.Page

    Public Shared Function FindChildControl(Of T As Control)(ByVal startingControl As Control, ByVal id As String) As T
        Dim found As T = Nothing
        For Each activeControl As Control In startingControl.Controls
            found = TryCast(activeControl, T)
            If found Is Nothing OrElse (String.Compare(id, found.ID, True) <> 0) Then
                found = FindChildControl(Of T)(activeControl, id)
            End If
            If found IsNot Nothing Then
                Exit For
            End If
        Next
        Return found
    End Function

    Public Sub ResetFormControlValues(ByVal parent As Control)
        For Each c As Control In parent.Controls
            If c.Controls.Count > 0 Then
                ResetFormControlValues(c)
            Else
                Select Case (c.GetType().ToString())
                    Case "System.Web.UI.WebControls.TextBox"
                        CType(c, TextBox).Text = ""
                End Select
            End If
        Next c
    End Sub

    Protected Function GetCssName(container As Object) As String
        If container IsNot Nothing Then
            If container.[GetType]() Is GetType(ListViewDataItem) Then
                If (DirectCast(container, ListViewDataItem).DisplayIndex Mod 2) = 0 Then
                    Return "even"
                Else
                    Return "odd"
                End If
            End If
        End If
        Return Nothing
    End Function

    <System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()>
    Public Shared Function GetCompletionListSearch(ByVal prefixText As String, ByVal count As Integer) As String()

        Dim entClient As modelCLSContainer = New modelCLSContainer

        Return entClient.CoursJeu.Where(Function(n) n.nomCours.StartsWith(prefixText)).OrderBy(Function(n) n.nomCours).[Select](Function(n) n.nomCours).Take(count).ToArray()

    End Function

    Protected Sub Page_Error(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Error
        Dim erreur As Exception = Server.GetLastError
        masterPage.traiteErreur(Page, "UNE ERREUR EST SURVENUE:", erreur)
        Dim pagePrecedente As String = Request.Url.AbsolutePath
        Dim url As String
        url = "~/Page/error.aspx?pagePrecedente=" & pagePrecedente
        Response.Redirect(url)

        Server.ClearError()
        'Response.Redirect(utile.utilall.pageerreur, True)
    End Sub

    Public Shared Function traiteErreur(ByRef page As Page, ByVal msg As String, ByVal ex As Exception) As String
        Try
            File.AppendAllText(page.Server.MapPath("~/App_Data/logErreur.txt"), "ERREUR " & Now.ToLongDateString & ControlChars.CrLf)
            File.AppendAllText(page.Server.MapPath("~/App_Data/logErreur.txt"), msg & ex.ToString())
        Catch ex2 As Exception
        End Try
        Return "UNE ERREUR S'EST PRODUITE: " & ex.ToString
    End Function

    Public Sub desactiveControles(ByVal controle1 As Image, ByVal controle2 As Label)
        controle1.Visible = False
        controle2.Visible = False
    End Sub

    Public Sub activeControles(ByVal controle1 As Image, ByVal controle2 As Label)
        controle1.Visible = True
        controle2.Visible = True
    End Sub
#Region "Fonction doTransation"
    Protected Function doTransaction(ByVal ccNumber As String,
                               ByVal ccType As String,
                               ByVal expireDate As String,
                               ByVal cvvNum As String,
                               ByVal amount As String,
                               ByVal firstName As String,
                               ByVal lastName As String,
                               ByVal street As String,
                               ByVal city As String,
                               ByVal state As String,
                               ByVal zip As String) As Boolean

        'API INFORMATIONS (3)
        Dim success As Boolean = False
        Dim strUsername As String = "samuel_1353565849_biz_api1.me.com"
        Dim strPassword As String = "1353565911"
        Dim strSignature As String = "A41QhzrbqBn6pOl2H3rweWy3qz21AYRSXbIdf0e1BgINwDCdGzr9WM1a"
        Dim strCredentials As String = "USER=" & strUsername & "&PWD=" & strPassword & "&SIGNATURE=" & strSignature
        Dim strNVPSandboxServer As String = "https://api-3t.sandbox.paypal.com/nvp"
        Dim strAPIVersion As String = "2.3"

        'credit card types: Visa, MasterCard, Discover, Amex
        Dim strNVP = strCredentials & "&METHOD=DoDirectPayment" & _
           "&CREDITCARDTYPE=" & ccType & _
           "&ACCT=" & ccNumber & _
           "&EXPDATE=" & expireDate & _
           "&CVV2=" & cvvNum & _
           "&AMT=" & amount & _
           "&CUSTOM=1234" & _
           "&CURRENCYCODE=CAD" & _
           "&FIRSTNAME=" & firstName & _
           "&LASTNAME=" & lastName & _
           "&STREET=" & street & _
           "&CITY=" & city & _
           "&STATE=" & state & _
           "&ZIP=" & zip & _
           "&COUNTRYCODE=CA" & _
           "&PAYMENTACTION=Sale" & _
           "&VERSION=" & strAPIVersion
        Try
            'Cree la requête
            Dim wrWebRequest As System.Net.HttpWebRequest = DirectCast(System.Net.WebRequest.Create(strNVPSandboxServer), System.Net.HttpWebRequest)
            wrWebRequest.Method = "POST"
            Dim requestWriter As New System.IO.StreamWriter(wrWebRequest.GetRequestStream())
            requestWriter.Write(strNVP)
            requestWriter.Close()
            'Obtient la réponse
            Dim hwrWebResponse As System.Net.HttpWebResponse = DirectCast(wrWebRequest.GetResponse(), System.Net.HttpWebResponse)
            Dim responseReader As New System.IO.StreamReader(wrWebRequest.GetResponse().GetResponseStream())
            ' Lit la réponse
            Dim dataReturned As String = responseReader.ReadToEnd()
            responseReader.Close()
            Dim result As String = Server.UrlDecode(dataReturned)
            Dim arrResult As String() = result.Split("&"c)
            Dim htResponse As New Hashtable()
            Dim arrayReturned As String()
            For Each item As String In arrResult
                arrayReturned = item.Split("="c)
                htResponse.Add(arrayReturned(0), arrayReturned(1))
            Next

            Dim strAck As String = htResponse("ACK").ToString()
            'AFFICHE LA RÉPONSE

            If strAck = "Success" OrElse
                strAck = "SuccessWithWarning" Then
                Dim strAmt As String = htResponse("AMT").ToString()
                Dim strCcy As String = htResponse("CURRENCYCODE").ToString()
                Dim strTransactionID As String = htResponse("TRANSACTIONID").ToString()
                For Each i In htResponse
                    Response.Write(i.Key & ": " & i.Value & "<br />")
                Next

                success = True
                'Dim strSuccess As String = "Merci pour votre commande de : $" & strAmt & " " & strCcy & ", celle-ci a bien été traitée."
                'successLabel.Text = strSuccess
            Else

                'Dim strErr As String = "Error: " & htResponse("L_LONGMESSAGE0").ToString()
                'Dim strErrcode As String = "Error code: " & htResponse("L_ERRORCODE0").ToString()

                'Response.Write(strErr & "&lt;br /&gt;" & strErrcode)</span>
                For Each i In htResponse
                    Response.Write(i.Key & ": " & i.Value & "<br />")
                Next
            End If
        Catch

            ' FAITES QQCHOSE
        End Try
        Return success
        'Response.Redirect("../Client/home_member.aspx")
    End Function
#End Region

End Class
