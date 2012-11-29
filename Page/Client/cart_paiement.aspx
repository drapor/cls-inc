<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="cart_paiement.aspx.vb"
    Inherits="Page_Client_cart_paiement" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="contenuPage">
        <div class="titlePanier">
            <h3>
                Informations de paiment de la commande</h3>
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
                    <asp:TextBox ID="txtNom" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query"
                        Text=""></asp:TextBox>
                </div>
                <br />
                <div class="formatZone">
                    <asp:TextBox ID="txtNumero" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query"
                        Text="" MaxLength="16" Width="150px"></asp:TextBox>
                </div>
                <br />
                <div class="formatZone">
                    <asp:TextBox ID="txtCvv" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query"
                        Text="" MaxLength="3" Width="25px"></asp:TextBox>
                </div>
                <br />
                <div class="formatZone">
                    <asp:DropDownList ID="ddlType" runat="server" Width="190px" SkinID="ddlBlue" AutoPostBack="true" OnSelectedIndexChanged="regExCarteVerification">
                        <asp:ListItem Value="0">Visa</asp:ListItem>
                        <asp:ListItem Value="1">MasterCard</asp:ListItem>
                        <asp:ListItem Value="2">AmericanExpress</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                <div class="formatZoneDate">
                    <asp:Label ID="lblMois" runat="server" Text="Mois" Width="40px"></asp:Label>
                </div>
                <div class="formatZoneDDL">
                    <asp:DropDownList ID="ddlMois" runat="server" Width="70px" SkinID="ddlBlue">
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
                    <asp:DropDownList ID="ddlAnnee" runat="server" Width="100px" SkinID="ddlBlue">
                    </asp:DropDownList>
                </div>
            </div>
            <div class="partiDroite">
                <div class="formatZone" style="height: 20px; margin-bottom: 16px;">
                    <asp:RequiredFieldValidator ID="requiredNomTitulaire" runat="server" ErrorMessage="Le nom du titulaire de la carte est obligatoire"
                        ForeColor="Red" Display="Dynamic" ControlToValidate="txtNom"></asp:RequiredFieldValidator>
                </div>
                <div class="formatZone" style="height: 20px; margin-bottom: 16px;">
                    <asp:RequiredFieldValidator ID="requiredNumeroCarteCredit" runat="server" ErrorMessage="Le numéro de carte de crédit est obligatoire"
                        ForeColor="Red" Display="Dynamic" ControlToValidate="txtNumero"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator Enabled="false" ID="regExVisa" runat="server" ErrorMessage="Numéro de carte invalide (Visa)"
                        ValidationExpression="^4[0-9]{12}(?:[0-9]{3})?$" Display="Dynamic" ControlToValidate="txtNumero"
                        ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator Enabled="false" ID="regExMasterCard" runat="server" ErrorMessage="Numéro de carte invalide (MasterCard)"
                        ValidationExpression="^5[1-5][0-9]{14}$" Display="Dynamic" ControlToValidate="txtNumero"
                        ForeColor="Red"></asp:RegularExpressionValidator>
                    <asp:RegularExpressionValidator Enabled="false" ID="regExAmericanExpress" runat="server" ErrorMessage="Numéro de carte invalide (AmericanExpress)"
                        ValidationExpression="^3[47][0-9]{13}$" Display="Dynamic" ControlToValidate="txtNumero"
                        ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <div class="formatZone">
                    <asp:RequiredFieldValidator ID="requiredCVV" runat="server" ErrorMessage="Le code de sécurité est obligatoire"
                        ForeColor="Red" Display="Dynamic" ControlToValidate="txtCvv"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExCvv" runat="server" ErrorMessage="Veuillez entrer 3 chiffres"
                        ValidationExpression="[0-9][0-9][0-9]" Display="Dynamic" ControlToValidate="txtCvv"
                        ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="sectionConfirme">
                <div class="montantTotal">
                    <asp:Label ID="lblTotal" runat="server" Text="Montant Total:"></asp:Label>
                </div>
                <div class="montantTotal">
                            <asp:Label ID="lblMontantFacture" runat="server" Text=""></asp:Label>
                    $
                </div>
                <div class="confirmeAchat">
                    <asp:LinkButton ID="btnConfirme" runat="server" Text="" CssClass="boutonPaypal" Width="78"
                        Height="26" OnClick="paiementPaypal" CausesValidation="true" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
