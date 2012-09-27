<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="home_admin_permission.aspx.vb" Inherits="Page_Admin_home_admin_permission" Theme="Original" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="containerContenuAdmin">


<div class="titleAdminNormal">
    <asp:Label ID="lblPermission" runat="server" Text="Modifier les permissions"></asp:Label>
</div>

<div class="containerFormulaire">
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblNomEmploye" runat="server" Text="Choisissez le nom de l'employé"></asp:Label></div>
         <div class="elementFormulaire">
             <asp:DropDownList ID="lstEmploye" AppendDataBoundItems="true" runat="server" Width="240px" SkinID="ddlBlue" DataSourceID="dsEmploye" DataTextField="FullName" DataValueField="Role_idRole">
             <asp:ListItem Value="0" Text="--Sélectionnez un employé--"></asp:ListItem>
             </asp:DropDownList>
         </div>
    </div>
    <div class="ligneFormulaire">
        <asp:Label ID="lblEmployePresentement" runat="server" Text="Cet employé est présentement "></asp:Label>
        <asp:Label ID="lblEmployePermission" runat="server" Text="Label"></asp:Label>
    </div> 
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblTypePermission" runat="server" Text="Type de permission"></asp:Label></div>
         <div class="elementFormulaire"><asp:DropDownList ID="dropDownType" runat="server" SkinID="ddlBlue" AppendDataBoundItems="true" DataSourceID="dsPermission" DataValueField="idRole" DataTextField="nomRole">
             </asp:DropDownList>
         </div>
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"></div>
         <div class="elementFormulaire">
             <asp:Button ID="btnAjouter" runat="server" Text="Modifier" CssClass="btn btn-primary btn-large btn"/>
             <asp:Button ID="btnCancel" runat="server" Text="Canceller" CssClass="btn btn-primary btn-large btn" PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false"/>
         </div>
    </div>
</div>

<asp:EntityDataSource ID="dsEmploye" runat="server"
ConnectionString="name=modelCLSContainer"
DefaultContainerName="modelCLSContainer"
EnableFlattening="false"
EnableUpdate="false"
EnableDelete="false"
EnableInsert="false"
EntitySetName="MembresJeu"
Select="it.idMembre, it.Role_idRole,(it.[prenomMembre]+' '+it.[nomMembre]) as FullName, it.nomMembre, it.prenomMembre"
OrderBy="it.nomMembre">
</asp:EntityDataSource>

<asp:EntityDataSource ID="dsPermission" runat="server"
ConnectionString="name=modelCLSContainer"
DefaultContainerName="modelCLSContainer"
EnableFlattening="false"
EnableUpdate="false"
EnableDelete="false"
EnableInsert="false"
EntitySetName="RoleJeu"
Select="it.idRole, it.nomRole"
OrderBy="it.idRole">
</asp:EntityDataSource>


</div>
</asp:Content>