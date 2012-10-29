<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="login.aspx.vb" Inherits="Page_login" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="containerContenuClient">
        <div class="titleClient">
            <asp:Label ID="lblConnecter" runat="server" Text="Se connecter"></asp:Label><br />
        </div>
        <br />
        <table>
            <tr>
                <td>
                    <table>
                        <tr class="margin">
                            <td>
                                Adresse courriel:
                            </td>
                            <td>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="search-query" BackColor="#ffbf00"
                                    BorderWidth="2px" BorderColor="#1b1bb3" Font-Bold="true" ForeColor="#1b1bb3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="txtUsername"
                                    Text="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr class="margin">
                            <td>
                                Mot de passe:
                            </td>
                            <td>
                                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="search-query"
                                    BackColor="#ffbf00" BorderWidth="2px" BorderColor="#1b1bb3" Font-Bold="true"
                                    ForeColor="#1b1bb3"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="txtPassword"
                                    Text="*" Display="Dynamic"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr class="margin">
                <td colspan="2" align="center">
                    <asp:Button ID="Login" CommandName="Login" runat="server" Text="Se connecter" CssClass="btn btn-primary btn-large btn"
                        OnClick="Login_OnClick"></asp:Button><br />
                    <asp:CheckBox ID="NotPublicCheckBox" runat="server" Visible="false" Checked="true" />
                    <br />
                    
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                </td>
            </tr>
        </table>
        <asp:Label ID="Msg" runat="server" Text="" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
