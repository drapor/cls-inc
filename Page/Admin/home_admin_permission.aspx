<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="home_admin_permission.aspx.vb" Inherits="Page_Admin_home_admin_permission" Theme="Original" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="containerContenuAdmin">




<asp:ListView ID="lvPermission" runat="server" DataSourceID="dsEmploye" DataKeyNames="idEmploye,idMembre,Role_idRole">
<LayoutTemplate>
<div class="titleAdminNormal">
    <asp:Label ID="lblPermission" runat="server" Text="Modifier les permissions"></asp:Label>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblNomDeEmploye" runat="server" Text="Nom de l'employé"></asp:Label></div>
         <div class="elementFormulaire"><asp:Label ID="lblPermissionDeEmploye" runat="server" Text="Permission de l'employé"></asp:Label></div>
    </div>
    <div class="containerFormulaire">
        <asp:PlaceHolder runat="server" ID="itemPlaceholder"/>
    </div> 
</div>
</LayoutTemplate>

<ItemTemplate>
    <div class="ligneFormulaire">
       <div class="elementFormulaire"><asp:Label ID="lblNomEmploye" runat="server" Text='<% # Eval("FullName")%>'></asp:Label></div>
       <div class="elementFormulaireTexte">
           <asp:DropDownList ID="ddlPermission" SkinID="ddlBlue"  runat="server" DataSourceID="dsPermission" DataTextField="nomRole">
           <asp:ListItem Value="0" Text="--Sélectionnez un employé--"></asp:ListItem>
           </asp:DropDownList>
       </div>
    </div>
</ItemTemplate>
</asp:ListView>



 <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblNomEmploye" runat="server" Text="Choisissez le nom de l'employé"></asp:Label></div>
         <div class="elementFormulaire">    
             <asp:DropDownList ID="lstEmploye" AutoPostBack="true" AppendDataBoundItems="true" runat="server" Width="240px" SkinID="ddlBlue" DataSourceID="dsEmploye" DataTextField="FullName" DataValueField="Role_idRole" >
             <asp:ListItem Value="0" Text="--Sélectionnez un employé--"></asp:ListItem>
             </asp:DropDownList>
         </div>
    </div>
    <div class="ligneFormulaire">
        <asp:Label ID="lblEmployePresentement" runat="server" Text="Cet employé a présentement la permission"></asp:Label>
        <asp:Label ID="lblEmployePermission" runat="server" Text=""></asp:Label>
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblTypePermission" runat="server" Text="Type de permission disponible"></asp:Label></div>
         <div class="elementFormulaire"><asp:DropDownList ID="dropDownType" runat="server" SkinID="ddlBlue" AppendDataBoundItems="true" DataSourceID="dsPermission" DataValueField="idRole" DataTextField="nomRole">
             </asp:DropDownList>
         </div>
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"></div>
         <div class="elementFormulaire">
             <asp:Button ID="btnModifier" runat="server" Text="Modifier" CssClass="btn btn-primary btn-large btn" />
             <asp:Button ID="btnCancel" runat="server" Text="Canceller" CssClass="btn btn-primary btn-large btn" PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false" />
         </div>
    </div>



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

<asp:EntityDataSource ID="dsPermission" runat="server"
ConnectionString="name=modelCLSContainer"
DefaultContainerName="modelCLSContainer"
EnableFlattening="false"
EnableUpdate="false"
EnableDelete="false"
EnableInsert="false"
EntitySetName="RoleJeu"
Where="it.idRole < 3 AND it."
Select="it.idRole, it.nomRole"
OrderBy="it.idRole">
</asp:EntityDataSource>



<%--<asp:EntityDataSource ID="EntityDataSource1" runat="server"
ConnectionString="name=modelCLSContainer"
DefaultContainerName="modelCLSContainer"
EnableFlattening="false"
EnableUpdate="false"
EnableDelete="false"
EnableInsert="false"
EntitySetName="RoleJeu"
Select="it.idRole, it.nomRole"
Where="it.idRole = @noRole"
OrderBy="it.idRole">
<WhereParameters>
    <asp:Parameter DefaultValue="0" Type="Int16" Name="noRole" />
</WhereParameters>
</asp:EntityDataSource>--%>

</div>
</asp:Content>