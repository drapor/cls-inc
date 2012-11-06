<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="admin_teacher_delete.aspx.vb" Inherits="Page_Admin_admin_employe_delete"
    Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="contenuPage">
        <div class="titleClient">
            <h3>
                Supprimer des animateurs</h3>
        </div>
        <div class="contenuClient">
            <div class="section">
                <div class="sectionTitre">
                    <asp:Label ID="listeAnimateur" runat="server" Text="Liste des animateurs"></asp:Label>
                </div>
            </div>
            <div class="infoClient">
                <asp:ListView ID="lvAnimateur" runat="server" DataSourceID="dsAnimateur" DataKeyNames="idMembre, idAnimateur">
                    <LayoutTemplate>
                        <div class="coursAnimateur">
                            <div class="blockNomAnimateur1">
                                <b>Nom de l'employé </b>
                            </div>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div class="blockNomAnimateur2">
                            <asp:Label ID="lblprenomEmploye" runat="server" Text='<%# Eval("MembresJeu.prenomMembre ") %>'></asp:Label>
                            <asp:Label ID="lblNomEmploye" runat="server" Text='<%# Eval("MembresJeu.nomMembre ") %>'></asp:Label>
                            <asp:ImageButton ID="imgDelete" CommandArgument='<%#Eval("idMembre")%>' CssClass="boutonFloatRight" ImageUrl="~/App_Themes/Original/img/delete.png"
                                OnClientClick="return confirm('Etes-vous certain?');" CommandName="Delete" runat="server"
                                Width="20px" Height="20px" OnClick="DeletingMemberID" />
                        </div> 
                    </ItemTemplate>
                </asp:ListView>
                <div class="boutonAdminRetourDelete">
                    <asp:Button ID="btnRetour" runat="server" PostBackUrl="~/Page/Admin/home_admin.aspx"
                        Text="Retour" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>
    </div>
    <asp:EntityDataSource ID="dsAnimateur" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu_Animateur"
        EnableFlattening="false" EnableDelete="true" EnableInsert="false" Include="MembresJeu,CoursJeu"
        EnableUpdate="true">
    </asp:EntityDataSource>
</asp:Content>
