<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="cart.aspx.vb" Inherits="Page_Autre_cart" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="titlePanier">
<h3>Votre panier d'activités</h3>
</div>

<div class="contenuPanier">

    <asp:ListView ID="lvPanier" runat="server" DataSourceID="EntityDataSource1">
        <LayoutTemplate>
            <div class="panier">
                <div class="panierNom">
                    <asp:Label ID="lblTitreNom" runat="server" Text="Nom du groupe"></asp:Label>
                </div>
                <div class="panierGroupe">
                    <asp:Label ID="lblTitreGroupe" runat="server" Text="Groupe"></asp:Label>
                </div>
                <div class="panierAbonne">
                    <asp:Label ID="lblTitreAbonne" runat="server" Text="Nom de l'abonné"></asp:Label>
                </div>
                <div class="panierPrix">
                    <asp:Label ID="lblTitrePrix" runat="server" Text="Prix"></asp:Label>
                </div>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemSeparatorTemplate>
            <div class="separateur">
                
            </div>
        </ItemSeparatorTemplate>
        <ItemTemplate>
            <div class="panier">
                <div class="panierNom">
                    <asp:Label ID="lblNom" runat="server" Text="Tennis"></asp:Label>
                </div>
                <div class="panierGroupe">
                    <asp:Label ID="lblGroupe" runat="server" Text="tennis01"></asp:Label>
                </div>
                <div class="panierAbonne">
                    <asp:Label ID="lblAbonne" runat="server" Text="Maurice Tibeau"></asp:Label>
                </div>
                <div class="panierPrix">
                    <asp:Label ID="lblPrix" runat="server" Text="120,00"></asp:Label>
                </div>
                <div class="panierSupprime">
                    <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/App_Themes/Original/img/delete.png" />
                </div>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </ItemTemplate>
    </asp:ListView>


</div>

<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="false" EnableUpdate="True" orderBy="it.idMembre"
    EntityTypeFilter="MembresJeu">

    </asp:EntityDataSource>

</asp:Content>