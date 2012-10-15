<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_course_add.aspx.vb" Inherits="Page_Admin_admin_course_add" Theme="Original" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="containerContenuAdmin">


<div class="titleAdminNormal">
    <asp:Label ID="lblAjouterCours" runat="server" Text="Ajouter un cours"></asp:Label>
</div>

<div class="containerFormulaire">


    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblNomCours" runat="server" Text="Nom du cours"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtCours" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="50"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredCours" runat="server" ErrorMessage="*Le nom du cours est obligatoire" ControlToValidate="txtCours" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:Label ID="lblErreurCorus" runat="server" Text="Le cours existe déjà" ForeColor="Red" Visible="false" ></asp:Label>
        </div>
    </div> <%--Nom du cours--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblCategorie" runat="server" Text="Catégorie"></asp:Label></div>
         <div class="elementFormulaire"><asp:DropDownList ID="ddlCategorie" runat="server" Width="100px" SkinID="ddlBlue" AppendDataBoundItems="False" CssClass="search-query">
             <asp:ListItem Selected="True" Value="1">Culture</asp:ListItem>
             <asp:ListItem Value="2">Loisir</asp:ListItem>
             <asp:ListItem Value="3">Sport</asp:ListItem>
             </asp:DropDownList>
         </div>
    </div> <%--Catégorie--%>

    <div class="ligneFormulaireDescription">
         <div class="elementFormulaireTexte"><asp:Label ID="lblDescription" runat="server" Text="Description du cours"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtDescription" runat="server" CssClass="search-query" Font-Bold="false"  SkinID="txtBoxDescription"  MaxLength="20" Height="120px" TextMode="MultiLine" Width="320px" style="resize:none;" ></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredDescription" runat="server" ErrorMessage="*La description est obligatoire" ControlToValidate="txtDescription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div> <%--Description--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblPrerequis" runat="server" Text="Prérequis"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtPrerequis" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredPrerequis" runat="server" ErrorMessage="*Le prérequis est obligatoire" ControlToValidate="txtPrerequis" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>  <%--Prérequis--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblTarifAdulte" runat="server" Text="Tarif Adulte"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtTarifAdulte" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="6" Width="50px"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredTarifAdulte" runat="server" ErrorMessage="*Le tarif adulte est obligatoire" ControlToValidate="txtTarifAdulte" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div> <%--Tarif Adulte--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblTarifEnfant" runat="server" Text="Tarif Enfant"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtTarifEnfant" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="6" Width="50px"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredTarifEnfant" runat="server" ErrorMessage="*Le tarif enfant est obligatoire" ControlToValidate="txtTarifEnfant" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div> <%--Tarif Enfant--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblGroupeAge" runat="server" Text="Groupe d'âge"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtGroupeAge" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="10"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredGroupeAge" runat="server" ErrorMessage="*Le groupe d'âge est obligatoire" ControlToValidate="txtGroupeAge" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div> <%--Groupe d'âge--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblDateDebutInscription" runat="server" Text="Date début des inscriptions"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtDateDebutInscription" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px"></asp:TextBox></div>
        <asp:RequiredFieldValidator ID="requiredDateDebutInscription" runat="server" ErrorMessage="*La date de début des inscriptions est obligatoire" ControlToValidate="txtDateDebutInscription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExDateDebutInscription" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa" ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  " Display="Dynamic" ControlToValidate="txtDateDebutInscription" ForeColor="Red"></asp:RegularExpressionValidator>
    </div> <%--Date début des inscriptions--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblDateFinInscription" runat="server" Text="Date fin des inscriptions"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtDateFinInscription" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px"></asp:TextBox></div>
        <asp:RequiredFieldValidator ID="requiredDateFinInscription" runat="server" ErrorMessage="*La date de fin des inscriptions est obligatoire" ControlToValidate="txtDateFinInscription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExDateFinInscription" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa" ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  " Display="Dynamic" ControlToValidate="txtDateFinInscription" ForeColor="Red"></asp:RegularExpressionValidator>
    </div> <%--Date fin des inscriptions--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblDateDebutCours" runat="server" Text="Date début des cours"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtDateDebutCours" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px"></asp:TextBox></div>
        <asp:RequiredFieldValidator ID="requiredDateDebutCours" runat="server" ErrorMessage="*La date de début des cours est obligatoire" ControlToValidate="txtDateDebutCours" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExDateDebutCours" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa" ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  " Display="Dynamic" ControlToValidate="txtDateDebutCours" ForeColor="Red"></asp:RegularExpressionValidator>
    </div> <%--Date début des inscriptions--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblDateFinCours" runat="server" Text="Date fin des cours"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtDateFinCours" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px"></asp:TextBox></div>
        <asp:RequiredFieldValidator ID="requiredDateFinCours" runat="server" ErrorMessage="*La date de fin des cours est obligatoire" ControlToValidate="txtDateFinCours" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExDateFinCours" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa" ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  " Display="Dynamic" ControlToValidate="txtDateFinCours" ForeColor="Red"></asp:RegularExpressionValidator>
    </div> <%--Date fin des inscriptions--%>
    
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblType" runat="server" Text="Type de compte"></asp:Label></div>
         <div class="elementFormulaire"><asp:DropDownList ID="dropDownType" runat="server" SkinID="ddlBlue" AppendDataBoundItems="False" CssClass="search-query">
             <asp:ListItem Selected="True" Value="2">Employé</asp:ListItem>
             <asp:ListItem Value="1">Administrateur</asp:ListItem>
             </asp:DropDownList>
         </div>
    </div>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"></div>
         <div class="elementFormulaire">
             <asp:Button ID="btnAjouter" runat="server" Text="Ajouter" CssClass="btn btn-primary btn-large btn" OnClick="ajouterEmployeClick"/>
             <asp:Button ID="btnCancel" runat="server" Text="Canceller" CssClass="btn btn-primary btn-large btn" PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false"/>
         </div>
    </div>

    <div class="ligneFormulaire">
        <div class="elementFormulaireTexte"></div>
        <div class="elementFormulaire">
            <asp:Image ID="checkImage" runat="server" ImageUrl="~/App_Themes/Original/img/icon_check.png" Visible="false" Height="20px" Width="20px" />
            <asp:Label ID="lblFelicitation" runat="server" ForeColor="Green" Text="L'employé a été ajouter avec succès !" Visible="false"></asp:Label>
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
            changeYear: true,
            dateFormat: "dd/mm/yy"
        });
    });
 
	</script> <%--Date Picker--%>

</div>
</asp:Content>

