<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="description.aspx.vb" Inherits="Page_Autre_description" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="containerContenuAdmin">

<div class="enteteCategory">
<div class="enteteTexteBlock">
    <h3><asp:Label ID="lblNomCours" runat="server" Text=""></asp:Label></h3>
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
    <asp:ListView ID="lvCours" runat="server" DataSourceID="dsCours" DataKeyNames="idCours">
        <LayoutTemplate>  
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
        </LayoutTemplate>
        <ItemTemplate>
                                <div class="blockNormal">
                                    <asp:Button ID="btnSport" runat="server" CommandName="selection" Text='<%# Eval("nomCours") %>' CssClass="btn btn-primary btnPadding" />
                                </div>
                                <asp:Label ID="lblNomCoursHide" Value='<%# Eval("nomCours") %>' runat="server" Visible="false"></asp:Label>
        </ItemTemplate>
    </asp:ListView>


    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="false" EnableUpdate="True"
    where="(it.idCours = @cours)">
    <WhereParameters>
        <asp:Parameter Name="cours" DbType="Int16" DefaultValue="Nothing"  />
    </WhereParameters>
    </asp:EntityDataSource>
</div>

</asp:Content>

