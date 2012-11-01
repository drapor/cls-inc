﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="login.aspx.vb" Inherits="Page_login" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="containerContenuClient">
        <div class="titleClient">
            <asp:Label ID="lblConnecter" runat="server" Text="Se connecter"></asp:Label><br />
        </div>
        <br />
        <asp:Login ID="loginCLS" runat="server" DisplayRememberMe="false" UserNameLabelText="Adresse courriel: "
            TitleText="" RememberMeSet="true" RememberMeText="">
            <LoginButtonStyle CssClass="btn btn-primary btn-large btn" />
            <TextBoxStyle CssClass="search-query" BorderColor="#1b1bb3" ForeColor="#1b1bb3" BackColor="#ffbf00" BorderWidth="2px" />
        </asp:Login>
        <asp:Label ID="Msg" runat="server" Text="" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
