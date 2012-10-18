<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="category.aspx.vb" Inherits="Page_Autre_category" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">

<div class="titleClient">
<h3><asp:Label ID="lblCategorie" runat="server" Text=""></asp:Label></h3>
</div>

<div class="contenuClient">
    

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="lblCoursDisponible" runat="server" Text="Cours disponible"></asp:Label>
</div>
</div>  

    <asp:ListView ID="lvCours" runat="server" DataSourceID="dsCategorie" DataKeyNames="idCours">
        <LayoutTemplate>
            <div class="infoClient">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="clientInfoGauche supprimerBoutonEmploye">
                <div class="partiGauche supprimerBoutonEmploye">
                <asp:Label ID="lblNomCours" runat="server" Text='<%# Eval("nomCours") %>'></asp:Label>
                </div>
            </div>

        </ItemTemplate>
    </asp:ListView>
    <div class="boutonAdminRetourDelete">
                    <asp:Button ID="btnRetour" runat="server" PostBackUrl="~/Page/Admin/home_admin.aspx" Text="Retour" CssClass="btn btn-primary"/>
    </div>
</div>
</div>

    <asp:EntityDataSource ID="dsCategorie" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="false" EnableUpdate="True" orderBy="it.nomCours"
    where="(it.categorie = @categorie)">
    <WhereParameters>
        <asp:Parameter Name="categorie" DbType="String" DefaultValue="Nothing"  />
    </WhereParameters>
    </asp:EntityDataSource>


</asp:Content>

