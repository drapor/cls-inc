<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="cart.aspx.vb"
    Inherits="Page_Autre_cart" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="contenuPage">
        <div class="titlePanier">
            <h3>
                Votre panier d'activités</h3>
        </div>
        <div class="contenuStandard">
            <asp:ListView ID="lvPanier" runat="server" DataSourceID="dsPanier" DataKeyNames="idItemPanier"
                ItemPlaceholderID="itemPlaceHolder">
                <LayoutTemplate>
                    <div class="panier">
                        <div class="panierNomTitre">
                            <asp:Label ID="lblTitreNom" runat="server" Text="Activité"></asp:Label>
                        </div>
                        <div class="panierGroupeTitre">
                            <asp:Label ID="lblTitreGroupe" runat="server" Text="Groupe"></asp:Label>
                        </div>
                        <div class="panierAbonneTitre">
                            <asp:Label ID="lblTitreAbonne" runat="server" Text="Nom de l'abonné"></asp:Label>
                        </div>
                        <div class="statusTitre">
                            <asp:Label ID="lblStatusTitre" runat="server" Text="Status"></asp:Label>
                        </div>
                        <div class="panierPrixTitre">
                            <asp:Label ID="lblTitrePrix" runat="server" Text="Prix"></asp:Label>
                        </div>
                        <div class="separateur">
                            <asp:Image ID="imgSeparateur" runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
                        </div>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        <div class="separateur">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
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
                            <asp:Label ID="lblSousTotalPanier" runat="server" Text="100,00"></asp:Label>
                            $
                            <br />
                            <br />
                            <asp:Label ID="lblRabaisPanier" runat="server" Text="0,00"></asp:Label>
                            $
                            <br />
                            <br />
                            <asp:Label ID="lblGrandTotalPanier" runat="server" Text="100,00"></asp:Label>
                            $
                        </div>
                        <div class="boutonPanierRetour">
                        </div>
                        <div class="boutonPanierConfirme">
                            <asp:Button ID="btnConfirme" runat="server" Text="Confirmer" CssClass="btn btn-primary"
                                Width="120px" PostBackUrl="~/Page/Client/cart_paiement.aspx" />
                        </div>
                    </div>
                </LayoutTemplate>
                <ItemSeparatorTemplate>
                    <div class="separateur">
                        <asp:Image ID="imgSeparateur" runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
                    </div>
                </ItemSeparatorTemplate>
                <ItemTemplate>
                    <div class="panierItem">
                        <div class="panierNom">
                            <asp:Label ID="lblNom" runat="server" Text='<%#Eval("GroupeJeu.CoursJeu.nomCours")%>'></asp:Label>
                        </div>
                        <div class="panierGroupe">
                            <asp:Label ID="lblGroupe" runat="server" Text='<%#Eval("GroupeJeu.nomGroupe")%>'></asp:Label>
                        </div>
                        <div class="panierAbonne">
                            <asp:Label ID="lblAbonnePrenom" runat="server" Text='<%#Eval("MembresJeu.prenomMembre")%>'></asp:Label>
                            <asp:Label ID="lblAbonneNom" runat="server" Text='<%#Eval("MembresJeu.nomMembre")%>'></asp:Label>
                        </div>
                        <div class="panierStatus">
                            <asp:Label ID="lblStatus" runat="server" Text='<%#Eval("MembresJeu.RoleJeu.nomRole")%>'></asp:Label> 
                        </div>
                        <div class="panierPrix">
                            <asp:Label ID="lblPrix" runat="server" Text='<%#Eval("GroupeJeu.CoursJeu.tarif")%>'></asp:Label>
                            $
                        </div>
                        <div class="panierSupprime">
                            <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/App_Themes/Original/img/delete.png"
                                Width="19px" ImageAlign="Middle" ToolTip="Supprimer" CommandName="Delete" OnClientClick="return confirm('Êtes-vous sûr de vouloir supprimer cette commande?');" />
                        </div>
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>Votre panier ne contient pas de commande pour le moment. Veuillez inscrire des membres à des cours !</EmptyDataTemplate>
            </asp:ListView>
        </div>
    </div>
    <asp:EntityDataSource ID="dsPanier" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="ItemPanierJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="false" EnableUpdate="True" Where="(@idPanier = it.Panier_idCommande)"
        Include="GroupeJeu,GroupeJeu.CoursJeu, MembresJeu, MembresJeu.RoleJeu">
        <WhereParameters>
            <asp:Parameter Name="idPanier" DefaultValue="0" Type="Int16" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
