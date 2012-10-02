<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="home_admin_permission.aspx.vb" Inherits="Page_Admin_home_admin_permission" Theme="Original" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="containerContenuAdmin">
<asp:ListView ID="lvPermission" runat="server" DataSourceID="dsEmploye" DataKeyNames="idEmploye,idMembre,Role_idRole">
<LayoutTemplate>
<div class="titleAdminNormal">
    <asp:Label ID="lblPermission" runat="server" Text="Modifier les permissions"></asp:Label>
    <div class="ligneFormulaire permissionTitle">
         <div class="elementFormulaireTexte"><asp:Label ID="lblNomDeEmploye" runat="server" Text="Nom de l'employé"></asp:Label></div>
         <div class="elementFormulaire"><asp:Label ID="lblPermissionDeEmploye" runat="server" Text="Permission de l'employé"></asp:Label></div>
    </div>
    <div class="containerFormulaire">
        <asp:PlaceHolder runat="server" ID="itemPlaceholder"/>
        <div class="ligneFormulaire">
        <div class="elementFormulaire permissionHeight"></div>
       <div class="elementFormulaireTexte permissionHeight">
             <asp:Button ID="btnCancel" runat="server" Text="Canceller" CssClass="btn btn-primary btn-large btn" PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false" />
       </div>
       </div>
    </div> 
</div>
</LayoutTemplate>

<ItemTemplate>
    <div class="ligneFormulaire">
       <div class="elementFormulaire permissionHeight"><asp:Label ID="lblNomEmploye" runat="server" Font-Size="18px" Font-Bold="true" ForeColor="#1b1bb3" Text='<% # Eval("FullName")%>'></asp:Label></div>
       <div class="elementFormulaireTexte permissionHeight">
           <asp:DropDownList ID="ddlPermission" Width="180" AppendDataBoundItems="true" SkinID="ddlBlue"  runat="server" DataSourceID="dsEmploye" DataTextField="Role_idRole" SelectedValue='<%#Eval ("Role_idRole") %>'>
           </asp:DropDownList>
       </div>
       <div class="elementFormulaireRequired permissionHeight">
           <asp:Button ID="btnModifier" runat="server" Text="Modifier" CssClass="btn btn-primary btn-primary btn" CommandName="Update" />
           </div> 
    </div>
</ItemTemplate>
</asp:ListView>
<asp:EntityDataSource ID="dsEmploye" runat="server"
ConnectionString="name=modelCLSContainer"
DefaultContainerName="modelCLSContainer"
EnableFlattening="false"
EnableUpdate="false"
EnableDelete="false"
EnableInsert="false"
EntitySetName="MembresJeu_Employe"
Select="it.idEmploye, it.idMembre,(it.MembresJeu.[prenomMembre]+' '+it.MembresJeu.[nomMembre]) as FullName, it.MembresJeu.nomMembre, it.MembresJeu.prenomMembre, it.MembresJeu.Role_idRole"
OrderBy="it.nomMembre">
</asp:EntityDataSource>

<asp:SqlDataSource id="dsEmployeSQL" runat="server"
UpdateCommand="UPDATE [MembresJeu_Employe]
                SET [Role_idRole] = @Role_idRole
                WHERE [idEmploye]"



 ></asp:SqlDataSource>



</div>
