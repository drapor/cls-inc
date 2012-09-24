<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="home_admin_permission.aspx.vb" Inherits="Page_Admin_home_admin_permission" Theme="Original" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="containerContenuAdmin">


<div class="titleAdminNormal">
    <asp:Label ID="lblPermission" runat="server" Text="Modifier les permissions"></asp:Label>
</div>

<div class="containerFormulaire">
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblNomEmploye" runat="server" Text="Nom de l'employé"></asp:Label></div>
         <div class="elementFormulaire">
             <asp:DropDownList ID="dropDownSexe" runat="server" Width="200px" SkinID="ddlBlue">
                 <asp:ListItem Selected="True">Bob Gratton</asp:ListItem>
                 <asp:ListItem>Roger Allard</asp:ListItem>
             </asp:DropDownList>
         </div>
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblTypePermission" runat="server" Text="Type de permission"></asp:Label></div>
         <div class="elementFormulaire"><asp:DropDownList ID="dropDownType" runat="server" SkinID="ddlBlue" AppendDataBoundItems="False">
             <asp:ListItem Selected="True">Employé</asp:ListItem>
             <asp:ListItem>Administrateur</asp:ListItem>
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



<script>
    $(function () {
        $(".datepicker").datepicker({
            dayNamesMin: ["Di", "Lu", "Ma", "Me", "Je", "ve", "Sa"],
            monthNamesShort: ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"],
            yearRange: "c-100:c",
            changeMonth: true,
            changeYear: true
        });
    });
	</script>



</div>
</asp:Content>

