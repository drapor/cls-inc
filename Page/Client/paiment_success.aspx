<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="paiment_success.aspx.vb"
    Inherits="Page_Autre_inscription_paiement" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="contenuPage">
        <div class="titlePanier" style="text-align:center;">
            <h3>
                <asp:Image ID="succesImage" runat="server" ToolTip="Succès" Width="75px" height="75px" ImageUrl="~/App_Themes/Original/img/success.png" /><asp:Label
                    ID="lblNomClient" runat="server" Text=""></asp:Label> Félicitation ! Vous êtes maintenant membre chez CLS inc. !</h3>
                    <br />
                <asp:Button ID="btnLogin" runat="server" Text="Connexion à mon compte" CssClass="btn btn-primary btn-large btn" PostBackUrl="~/Page/login.aspx" />
        </div>
    </div>
</asp:Content>
