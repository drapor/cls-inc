<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="cart_paiement.aspx.vb" Inherits="Page_Autre_cart_paiement" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">

<div class="titlePanier">
<h3>Information du paiement</h3>
</div>

<div class="contenuStandard">
    <br />
    <div class="partiGauche">
        <div class="formatZone">
            <asp:Label ID="lblNom" runat="server" Text="Nom du titulaire:"></asp:Label>
        </div>
        <br />
        <div class="formatZone">
            <asp:Label ID="lblNumero" runat="server" Text="Numéro de la carte:"></asp:Label>
        </div>
        <br />
        <div class="formatZone">
            <asp:Label ID="lblCvv" runat="server" Text="Code de sécurité:"></asp:Label>
        </div>
        <br />
        <div class="formatZone">
            <asp:Label ID="lblType" runat="server" Text="Type de la carte:"></asp:Label>
        </div>
        <br />
        <div class="formatZone">
            <asp:Label ID="lblExpiration" runat="server" Text="Date d'expiration:"></asp:Label>
        </div>
    </div>
    <div class="partiDroite">
        <div class="formatZone">
            <asp:TextBox ID="txtNom" SkinID="txtBoxYellowPerso" runat="server" 
                CssClass="search-query" Text=""></asp:TextBox>
        </div>
        <br />
        <div class="formatZone">
            <asp:TextBox ID="txtNumero" SkinID="txtBoxYellowPerso"  runat="server" 
                CssClass="search-query" Text=""  MaxLength="16" Width="150px"></asp:TextBox>
        </div>
        <br />
        <div class="formatZone">
            <asp:TextBox ID="txtCvv" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text=""  MaxLength="3" Width="25px"></asp:TextBox>
        </div>
        <br />
        <div class="formatZone">
            <asp:DropDownList ID="ddlType" runat="server" width="190px" SkinID="ddlBlue">
                <asp:ListItem>Visa</asp:ListItem>
                <asp:ListItem>MasterCard</asp:ListItem>
                <asp:ListItem>AmericanExpress</asp:ListItem>
            </asp:DropDownList>
        </div>
        <br />
            <div class="formatZoneDate">
                <asp:Label ID="lblMois" runat="server" Text="Mois" Width="40px"></asp:Label>
            </div>
            <div class="formatZoneDDL">   
                <asp:DropDownList ID="ddlMois" runat="server" width="70px" SkinID="ddlBlue">
                    <asp:ListItem>01</asp:ListItem>
                    <asp:ListItem>02</asp:ListItem>
                    <asp:ListItem>03</asp:ListItem>
                    <asp:ListItem>04</asp:ListItem>
                    <asp:ListItem>05</asp:ListItem>
                    <asp:ListItem>06</asp:ListItem>
                    <asp:ListItem>07</asp:ListItem>
                    <asp:ListItem>08</asp:ListItem>
                    <asp:ListItem>09</asp:ListItem>
                    <asp:ListItem>10</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="formatZoneDate">
                <asp:Label ID="lblAnnee" runat="server" Text="Année" Width="50px"></asp:Label>
            </div>
            <div class="formatZoneDDL">
                <asp:DropDownList ID="ddlAnnee" runat="server" width="100px" SkinID="ddlBlue" ></asp:DropDownList>
            </div>
    </div>
    <div class="sectionConfirme">
        <div class="montantTotal">
            <asp:Label ID="lblTotal" runat="server" Text="Montant Total:"></asp:Label>
        </div>
        <div class="montantTotal">
            <asp:Label ID="lblValeurTotal" runat="server" Text="19,35"></asp:Label> $
        </div>
        <div class="confirmeAchat">
            <asp:Button ID="btnConfirme" runat="server" Text="Confirmer la commande" CssClass="btn btn-primary" Width="180px" />
        </div>
    </div>

    <script>
        
    </script>

</div>
</div>
</asp:Content>
