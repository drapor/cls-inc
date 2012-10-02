<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="Page_login" Theme="Original"  %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="containerContenuClient">


<div class="titleClient">
<asp:Label ID="lblConnecter" runat="server" Text="Se connecter"></asp:Label>
</div>
<br />

<asp:Login id="Login1" runat="server">
                <LayoutTemplate>
                    <table>
                        <tr>
                            <td>
                                <table>
                                    <tr class="margin" >
                                        <td>
                                            Adresse courriel:
                                        </td>
                                        <td>
                                            <asp:TextBox id="UserName" runat="server" CssClass="search-query" BackColor="#ffbf00" BorderWidth="2px" BorderColor="#1b1bb3" Font-Bold="true" ForeColor="#1b1bb3"></asp:TextBox>
                                            <asp:requiredfieldvalidator id="UserNameRequired" runat="server" ControlToValidate="UserName" Text="*" ></asp:requiredfieldvalidator>
                                        </td>
                                    </tr>
                                    <tr class="margin">
                                        <td>Mot de passe:</td>
                                        <td>
                                            <asp:TextBox id="Password" runat="server" textMode="Password" CssClass="search-query" BackColor="#ffbf00" BorderWidth="2px" BorderColor="#1b1bb3" Font-Bold="true" ForeColor="#1b1bb3"></asp:TextBox>
                                            <asp:requiredfieldvalidator id="PasswordRequired" runat="server" ControlToValidate="Password" Text="*"></asp:requiredfieldvalidator>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                     
                        </tr>
                        <tr class="margin">
                            <td colspan="2" align="center">
                                <asp:button id="Login" CommandName="Login" runat="server" Text="Se connecter" CssClass="btn btn-primary btn-large btn"></asp:button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <asp:Literal id="FailureText" runat="server"></asp:Literal></td>
                        </tr>
                    </table>
                </LayoutTemplate>
            </asp:Login>
<%--<asp:Login ID="loginMembre" runat="server" LoginButtonText="Se connecter" TitleText="" UserNameLabelText="Adresse courriel :" RememberMeSet="true" DisplayRememberMe="false" SkinID="loginCustom" TextBoxStyle-CssClass="search-query"  >
    </asp:Login>--%>




</div>

</asp:Content>

