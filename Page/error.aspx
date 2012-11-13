<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="error.aspx.vb" Inherits="Page_error" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="containerContenuClient">
        <div class="titleClient">
            <asp:Label ID="lblError" runat="server" Text="Erreur"></asp:Label><br />
        </div>
        <br />
        <div style="text-align:center;width:940px;height:auto; margin-top:100px;">
        <asp:Label ID="Msg" runat="server" Font-Size="20px" Font-Bold="true" Text="Une erreur est survenue. Veuillez contacter le support pour plus d'information." ForeColor="Red"></asp:Label>
        <br />
        <asp:LinkButton ID="lnkReturn" runat="server" Font-Bold="true" Text="Retour à la page précédente"></asp:LinkButton>
        </div>
    </div>
</asp:Content>
