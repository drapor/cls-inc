<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="member_paiement_failure.aspx.vb"
    Inherits="Page_Client_member_paiement_failure" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="contenuPage">
        <div class="titlePanier" style="text-align:center;">
            <h3>
                <asp:Image ID="succesImage" runat="server" ToolTip="Échec" Width="75px" height="75px" ImageUrl="~/App_Themes/Original/img/failure.png" />Désolé <asp:Label
                    ID="lblNomClient" runat="server" Text=""></asp:Label>, votre paiment n'a pas été accepté par Paypal.</h3>
                    <br />
                <asp:Button ID="btnLogin" runat="server" Text="Retour au paiment" CssClass="btn btn-primary btn-large btn" PostBackUrl="~/Page/Client/cart_paiement.aspx"  />
        </div>
    </div>
</asp:Content>
