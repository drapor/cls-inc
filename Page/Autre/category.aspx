<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="category.aspx.vb" Inherits="Page_Autre_category" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="containerContenuAdmin">

<div class="enteteCategory">
<div class="enteteTexteBlock">
    <h3><asp:Label ID="lblCategorie" runat="server" Text=""></asp:Label></h3>
</div>
<div class="enteteBanner">
    <asp:Image ID="imgCategory" runat="server" />
</div>
</div>

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="lblCoursDisponible" runat="server" Text="Cours disponible"></asp:Label>
</div>
</div>
<br />
<br />
    <asp:ListView ID="lvCours" runat="server" DataSourceID="dsCategorie" DataKeyNames="idCours">
        <LayoutTemplate>  
        <div class="row">  
<div class="span8">  
<ul class="nav nav-tabs nav-stacked lnkButtonCategorie">   
<li>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                </li> 
</ul>  
</div>  
</div>  
</div> 
        </LayoutTemplate>
        <ItemTemplate>

    <asp:LinkButton ID="lnkActivite" runat="server" CommandName="selection" Text='<%# Eval("nomCours") %>'></asp:LinkButton>
        </ItemTemplate>
    </asp:ListView>


    <asp:EntityDataSource ID="dsCategorie" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="false" EnableUpdate="True" orderBy="it.nomCours"
    where="(it.categorie = @categorie)">
    <WhereParameters>
        <asp:Parameter Name="categorie" DbType="String" DefaultValue="Nothing"  />
    </WhereParameters>
    </asp:EntityDataSource>
</div>

</asp:Content>

