<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="home_admin.aspx.vb" Inherits="Page_Admin_home_admin" Theme="Original" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server" >
    <div class="menuAdmin">
        <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
        </asp:ToolkitScriptManager>
        <asp:Accordion ID="menuCategorie" runat="server" Width="200px" CssClass="accordion" HeaderCssClass="accordionHeader" 
        HeaderSelectedCssClass="accordionHeaderSelected" ContentCssClass="accordionContent" >
            <Panes>
                <asp:AccordionPane runat="server">
                    <Header>Cours</Header>
                    <Content>
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Page/Admin/admin_course_add.aspx" Text="Opérations sur les cours"></asp:LinkButton>
                    </Content>
                </asp:AccordionPane>
                <asp:AccordionPane ID="menuGroupe" runat="server">
                    <Header>Groupe</Header>
                    <Content>
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Page/Admin/admin_group.aspx" Text="Opérations sur un groupe"></asp:LinkButton>
                    </Content>
                </asp:AccordionPane>
                <asp:AccordionPane ID="menuHoraire" runat="server">
                    <Header>Horaire</Header>
                    <Content>
                        <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/Page/Admin/admin_schedule.aspx" Text="Opérations sur un Horaire"></asp:LinkButton>
                    </Content>
                </asp:AccordionPane>
            </Panes>
        </asp:Accordion>
    </div>
    <div class="contenuPrincipal">
    </div>
    <div class="containerContenuAdmin">
        <%--<div class="titleAdmin">
    <asp:LinkButton ID="lnkAccueilAdmin" runat="server" CssClass="titleAdmin" PostBackUrl="~/Page/Admin/home_admin.aspx">Accueil Admin</asp:LinkButton>
</div>--%>
        <div class="menuSectionAdmin">
            <asp:Label ID="lblCours" runat="server" Text="Cours"></asp:Label>
        </div>
        <div class="menuSectionAdmin">
            <asp:Label ID="lblEmploye" runat="server" Text="Employé"></asp:Label>
        </div>
        <div class="menuSectionAdmin">
            <asp:Label ID="lblTarifs" runat="server" Text="Tarifs"></asp:Label>
        </div>
        <div class="contenuAdmin">
            <asp:LinkButton ID="lnkAjouterCours" runat="server" PostBackUrl="~/Page/Admin/admin_course_add.aspx"
                Text="Opérations sur les cours"></asp:LinkButton><br />
        </div>
        <div class="contenuAdmin">
            <asp:LinkButton ID="lnkAjouterEmploye" runat="server" PostBackUrl="~/Page/Admin/admin_employe.aspx">Opérations sur un employé</asp:LinkButton><br />
            <%--<asp:LinkButton ID="lnkModifierEmploye" runat="server" PostBackUrl="~/Page/Admin/admin_employe_modify.aspx" >Modifier employé</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkSupprimerEmploye" runat="server" PostBackUrl="~/Page/Admin/admin_employe_delete.aspx">Supprimer employé</asp:LinkButton><br/>--%>
        </div>
        <div class="contenuAdmin">
            <asp:LinkButton ID="lblTarif" runat="server" PostBackUrl="~/Page/Admin/admin_tarif.aspx">Modifier les tarifs</asp:LinkButton><br />
        </div>
        <div class="menuSectionAdmin">
            <asp:Label ID="lblGroupe" runat="server" Text="Groupe"></asp:Label>
        </div>
        <div class="menuSectionAdmin">
            <asp:Label ID="lblAnimateur" runat="server" Text="Animateur"></asp:Label>
        </div>
        <div class="menuSectionAdmin">
            <asp:Label ID="lblPermission" runat="server" Text="Permission"></asp:Label>
        </div>
        <div class="contenuAdmin">
            <asp:LinkButton ID="lnkAjouterGroupe" runat="server" PostBackUrl="~/Page/Admin/admin_group.aspx">Opérations sur un groupe</asp:LinkButton><br />
            <%--<asp:LinkButton ID="lnkModifierGroupe" runat="server" PostBackUrl="~/Page/Admin/admin_group_modify.aspx" >Modifier un groupe</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkSupprimerGroupe" runat="server" PostBackUrl="~/Page/Admin/admin_group_delete.aspx" >Supprimer un groupe</asp:LinkButton><br/>--%>
        </div>
        <div class="contenuAdmin">
            <asp:LinkButton ID="lnkAjouterAnimateur" runat="server" PostBackUrl="~/Page/Admin/admin_teacher.aspx">Opérations sur un animateur</asp:LinkButton><br />
            <%--    <asp:LinkButton ID="lnkModifierAnimateur" runat="server" PostBackUrl="~/Page/Admin/admin_teacher_modify.aspx" >Modifier un animateur</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkSupprimerAnimateur" runat="server" PostBackUrl="~/Page/Admin/admin_teacher_delete.aspx">Supprimer un animateur</asp:LinkButton><br/>--%>
        </div>
        <div class="contenuAdmin">
            <asp:LinkButton ID="lnkModifierPermission" runat="server" PostBackUrl="~/Page/Admin/admin_permission.aspx">Modifier les permissions</asp:LinkButton><br />
        </div>
        <%--<div class="menuSectionAdmin">
    <asp:Label ID="lblSession" runat="server" Text="Session"></asp:Label>
</div>--%>
        <div class="menuSectionAdmin">
            <asp:Label ID="lblHoraire" runat="server" Text="Horaire"></asp:Label>
        </div>
        <div class="menuSectionAdminInvisible">
        </div>
        <div class="menuSectionAdminInvisible">
        </div>
        <%--<div class="contenuAdmin">
    <asp:LinkButton ID="lnkAjouterSession" runat="server" PostBackUrl="~/Page/Admin/admin_session_add.aspx">Ajouter une session</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkModifierSession" runat="server" PostBackUrl="~/Page/Admin/admin_session_modify.aspx">Modifier une session</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkSupprimerSession" runat="server" PostBackUrl="~/Page/Admin/admin_session_delete.aspx">Supprimer une session</asp:LinkButton><br/>
</div>--%>
        <div class="contenuAdmin">
            <asp:LinkButton ID="lnkAjouterHoraire" runat="server" PostBackUrl="~/Page/Admin/admin_schedule.aspx">Opérations sur un horaire</asp:LinkButton><br />
            <%--<asp:LinkButton ID="lnkModifierHoraire" runat="server" PostBackUrl="~/Page/Admin/admin_schedule_modify.aspx">Modifier horaire</asp:LinkButton><br/>
    <asp:LinkButton ID="lnkSupprimerHoraire" runat="server" PostBackUrl="~/Page/Admin/admin_schedule_delete.aspx">Supprimer horaire</asp:LinkButton><br/>--%>
        </div>
    </div>
</asp:Content>
