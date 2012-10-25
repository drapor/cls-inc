<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="cart.aspx.vb" Inherits="Page_Autre_cart" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">
<div class="titlePanier">
<h3>Votre panier d'activités</h3>
</div>

<div class="contenuStandard">
    <asp:ListView ID="lvPanier" runat="server" DataSourceID="EntityDataSource1" DataKeyNames="idMembre" ItemPlaceholderID="itemPlaceHolder">
        <LayoutTemplate>
            <div class="panier">
                <div class="panierNomTitre">
                    <asp:Label ID="lblTitreNom" runat="server" Text="Nom de l'activité"></asp:Label>
                </div>
                <div class="panierGroupeTitre">
                    <asp:Label ID="lblTitreGroupe" runat="server" Text="Groupe"></asp:Label>
                </div>
                <div class="panierAbonneTitre">
                    <asp:Label ID="lblTitreAbonne" runat="server" Text="Nom de l'abonné"></asp:Label>
                </div>
                <div class="panierPrixTitre">
                    <asp:Label ID="lblTitrePrix" runat="server" Text="Prix"></asp:Label>
                </div>

                <div class="separateur">
                    <asp:Image ID="imgSeparateur"  runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
                </div>

                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />

                <div class="separateur">
                    <asp:Image ID="Image1"  runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
                </div>

                <div class="labelTotal">
                    <asp:Label ID="lblSousTotal" runat="server" Text="Sous-total:"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblRabais" runat="server" Text="Rabais applicable:"></asp:Label>
                    <br />
                    <br />
                    <asp:Label ID="lblGrandTotal" runat="server" Text="Grand total:"></asp:Label>
                </div>   
                <div class="total">
                    <asp:Label ID="lblSousTotalPanier" runat="server" Text="100,00"></asp:Label> $
                    <br />
                    <br />
                    <asp:Label ID="lblRabaisPanier" runat="server" Text="0,00"></asp:Label> $
                    <br />
                    <br />
                    <asp:Label ID="lblGrandTotalPanier" runat="server" Text="100,00"></asp:Label> $
                </div>
                <div class="boutonPanierRetour">
                    <asp:Button ID="btnRetour" runat="server" Text="Retour" CssClass="btn btn-primary" Width="120px" />
                </div>
                <div class="boutonPanierConfirme">
                    <asp:Button ID="btnConfirme" runat="server" Text="Confirmer" CssClass="btn btn-primary" Width="120px" PostBackUrl="cart_paiement.aspx" />
                </div>
            </div>
        </LayoutTemplate>

        <ItemSeparatorTemplate>
            <div class="separateur">
                <asp:Image ID="imgSeparateur"  runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
            </div>
        </ItemSeparatorTemplate>

        <ItemTemplate>
            <div class="panierItem">
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
                    <asp:Label ID="lblPrix" runat="server" Text="120,00"></asp:Label> $
                </div>
                <div class="panierSupprime">
                    <asp:ImageButton ID="btnDelete" runat="server"  ImageUrl="~/App_Themes/Original/img/delete.png" Width="19px"  ImageAlign="Middle" ToolTip="Supprimer" />
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
</div>
</div>
<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="false" EnableUpdate="True" orderBy="it.idMembre"
    EntityTypeFilter="MembresJeu">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsMember" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
    EnableDelete="false" EnableInsert="false" EnableUpdate="false" orderBy="it.idMembre"
    EntityTypeFilter="MembresJeu" 
    Select="it.idMembre,it.nomMembre,it.prenomMembre,(it.[prenomMembre]+' '+it.[nomMembre]) as FullName, it.adresse, it.ville, it.dateNaissance, it.telephoneMembre, it.codePostal, it.courriel, it.motPasse, it.dateInscription">
    </asp:EntityDataSource>

</asp:Content>