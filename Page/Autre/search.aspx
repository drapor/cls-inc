<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="search.aspx.vb"
    Inherits="Page_Autre_search" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="containerContenuAdmin">
        <div class="containerFormulaire">
            <asp:ListView ID="lvSearch" runat="server" DataSourceID="dsCours" DataKeyNames="idCours">
                <LayoutTemplate>
                    <div class="titleAdminNormal">
                        <asp:Label ID="lblSearchResult" runat="server" Text="Résultat de la recherche"></asp:Label>
                    </div>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                </LayoutTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblNomCoursText" runat="server" Text="Nom du cours: " Font-Bold="true"></asp:Label>
                    <asp:Label ID="lblNomCours" runat="server" Text='<%#Eval ("nomCours") %>'></asp:Label><br />
                    <asp:Label ID="lblDescriptionTexte" runat="server" Text="Description: " Font-Bold="true"></asp:Label>
                    <asp:Label ID="lblDescription" runat="server" Text='<%#Eval ("description") %>'></asp:Label><br />
                    <asp:Label ID="lblCategorieTexte" runat="server" Text="Catégorie: " Font-Bold="true"></asp:Label>
                    <asp:Label ID="lblCategorie" runat="server" Text='<%#Eval ("categorie") %>'></asp:Label><br />
                    <asp:Label ID="lblTarifTexte" runat="server" Text="Tarif: " Font-Bold="true"></asp:Label>
                    <asp:Label ID="lblTarif" runat="server" Text='<%#Eval ("tarif") %>'></asp:Label>$<br />
                    <asp:Button ID="btnMoreInfo" runat="server" CommandName="selection" Text="En savoir plus sur ce cours" CssClass="btn btn-primary btn-large btn"/><br />
                </ItemTemplate>
                <EmptyDataTemplate>
                    <asp:Label ID="lblNoSearchResult" runat="server" Text="Votre recherche ne contenait aucun résultat."></asp:Label>
                </EmptyDataTemplate>
            </asp:ListView>
        </div>
    </div>
    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" OrderBy="it.nomCours"
        Where="(@leTexte= '' or it.nomCours+it.description+it.categorie like '%'+@leTexte+'%')">
        <WhereParameters>
            <asp:Parameter Name="leTexte" DefaultValue="" Type="String" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
