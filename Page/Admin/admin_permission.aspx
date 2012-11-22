<%@ Page Title="" Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master"
    AutoEventWireup="false" CodeFile="admin_permission.aspx.vb" Inherits="Page_Admin_admin_permission"
    Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="Server">
    <asp:Label ID="lblTitrePermission" runat="server" Text="Modifier les permissions"
        Font-Size="24px" Font-Bold="true" />
    <asp:Image ID="checkImage" runat="server" ImageUrl="~/App_Themes/Original/img/icon_check.png"
        Visible="false" Height="20px" Width="20px" />
    <asp:Label ID="lblFelicitation" runat="server" ForeColor="Green" Text="Les modifications ont bien été enregistrées!"
        Visible="false"></asp:Label>
    <br />
    <br />
    <br />
    <asp:ListView ID="lvPermission" runat="server" DataSourceID="dsEmploye" DataKeyNames="idMembre">
        <LayoutTemplate>
            <div class="titleAdminNormal">
                <div class="ligneFormulaire permissionTitle" style="width: auto;">
                    <div class="elementFormulaireTexte">
                        <asp:Label ID="lblNomDeEmploye" runat="server" Text="Nom de l'employé"></asp:Label></div>
                    <div class="elementFormulaire" style="width: auto;">
                        <asp:Label ID="lblPermissionDeEmploye" runat="server" Text="Permission de l'employé"></asp:Label></div>
                </div>
                <div class="containerFormulaire" style="width: auto;">
                    <asp:PlaceHolder runat="server" ID="itemPlaceholder" />
                </div>
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="ligneFormulaire" style="width: auto;">
                <div class="elementFormulaire permissionHeight">
                    <asp:Label ID="lblPrenomEmploye" runat="server" Font-Size="18px" Font-Bold="true"
                        ForeColor="#1b1bb3" Text='<% # Eval("prenomMembre")%>'></asp:Label>
                    <asp:Label ID="lblNomEmploye" runat="server" Font-Size="18px" Font-Bold="true" ForeColor="#1b1bb3"
                        Text='<% # Eval("nomMembre")%>'>
                    </asp:Label></div>
                <div class="elementFormulaireTexte permissionHeight">
                    <asp:DropDownList ID="ddlPermission" Width="180" AppendDataBoundItems="true" SkinID="ddlBlue"
                        runat="server" DataSourceID="dsRole" DataValueField="idRole" DataTextField="nomRole"
                        SelectedValue='<%#Bind ("RoleJeu_idRole") %>'>
                    </asp:DropDownList>
                </div>
                <div class="elementFormulaireRequired permissionHeight">
                    <asp:Button ID="btnModifier" runat="server" Text="Modifier" OnClick="confirmation"
                        CssClass="btn btn-primary btn-primary btn" CommandName="Update" />
                </div>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <asp:EntityDataSource ID="dsEmploye" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="false"
        EnableDelete="false" EnableInsert="false" EnableUpdate="true" EntityTypeFilter="MembresJeu"
        Where="(it.RoleJeu_idRole = 1 OR it.RoleJeu_idRole = 2)" OrderBy="it.prenomMembre">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsRole" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="RoleJeu" EnableFlattening="false"
        EnableDelete="false" EnableInsert="false" EnableUpdate="true" Where="(it.idRole = 1 OR it.idRole = 2)">
    </asp:EntityDataSource>
</asp:Content>
