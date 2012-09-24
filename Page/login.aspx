<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="Page_login" Theme="Original"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="containerContenuClient">


<div class="titleClient">
<asp:Label ID="lblConnecter" runat="server" Text="Se connecter"></asp:Label>
</div>

    <asp:Login ID="Login1" runat="server" LoginButtonText="Se connecter" TitleText="" UserNameLabelText="Adresse courriel :" RememberMeSet="true" DisplayRememberMe="false"   >
    </asp:Login>




</div>

</asp:Content>

