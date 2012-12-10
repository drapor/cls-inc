<%--Créé par Francis Griggs
Le 26 septembre 2012
Dernière mise à jour le 12 décembre 2012--%>

<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="member_paiement_success.aspx.vb"
    Inherits="Page_Client_member_paiement_success" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="contenuPage">
        <div class="titlePanier" style="text-align:center;">
            <h3>
                <asp:Image ID="succesImage" runat="server" ToolTip="Succès" Width="75px" height="75px" ImageUrl="~/App_Themes/Original/img/success.png" /><asp:Label
                    ID="lblNomClient" runat="server" Text=""></asp:Label><asp:Label ID="Label1" runat="server"
                        Text="Félicitation ! Vous êtes maintenant inscrit au(x) groupe(s) !"></asp:Label></h3>
                    <br />
                <asp:Button ID="btnLogin" runat="server" Text="Retour à mon compte" CssClass="btn btn-primary btn-large btn" PostBackUrl="~/Page/Client/home_member.aspx" />
        </div>
    </div>
</asp:Content>
