<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="admin_course_delete.aspx.vb" Inherits="Page_Admin_admin_course_delete"
    Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="contenuPage">
        <div class="titleClient">
            <h3>
                Supprimer des cours</h3>
        </div>
        <div class="contenuClient">
            <div class="section">
                <div class="sectionTitre">
                    <asp:Label ID="listeCours" runat="server" Text="Liste des cours"></asp:Label>
                </div>
            </div>
            <asp:ListView ID="lvCours" runat="server" DataSourceID="dsCours" DataKeyNames="idCours">
                <LayoutTemplate>
                    <div class="infoClient">
                        <div class="coursAnimateur">
                            <div class="blockNomAnimateur1">
                                <b>Nom du cours </b>
                            </div>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </div>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="blockNomAnimateur2">
                        <asp:Label ID="lblprenomEmploye" runat="server" Text='<%# Eval("nomCours ") %>'></asp:Label>
                        <asp:ImageButton ID="imgDelete" CommandArgument='<%#Eval("idCours")%>' CssClass="boutonFloatRight"
                            ImageUrl="~/App_Themes/Original/img/delete.png" OnClientClick="return confirm('Etes-vous certain?');"
                            CommandName="Delete" runat="server" Width="20px" Height="20px" OnClick="DeletingCoursID"/>
                    </div>
                </ItemTemplate>
            </asp:ListView>
            <div class="boutonAdminRetourDelete">
                <asp:Button ID="btnRetour" runat="server" PostBackUrl="~/Page/Admin/home_admin.aspx"
                    Text="Retour" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="false"
        EnableDelete="true" EnableInsert="false" EnableUpdate="true" EntityTypeFilter="CoursJeu"
        OrderBy="it.nomCours">
    </asp:EntityDataSource>
</asp:Content>
