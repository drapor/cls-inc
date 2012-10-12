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
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblDescription" runat="server" Text="Description du cours"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtDescription" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="400" Height="60px" TextMode="MultiLine" Width="350px"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredDescription" runat="server" ErrorMessage="*La description est obligatoire" ControlToValidate="txtDescription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblPrerequis" runat="server" Text="Prérequis"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtPrerequis" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredPrerequis" runat="server" ErrorMessage="*Le prérequis est obligatoire" ControlToValidate="txtPrerequis" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblSexe" runat="server" Text="Sexe"></asp:Label></div>
         <div class="elementFormulaire">
             <asp:RadioButtonList ID="rdbtnSexe" runat="server" RepeatDirection="Horizontal" Width="200px">
             <asp:ListItem Text="Homme" Value="H" Selected="true"></asp:ListItem>
             <asp:ListItem Text="Femme" Value="F"></asp:ListItem>
            </asp:RadioButtonList>
         </div>
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblAdresse" runat="server" Text="Adresse"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtAdresse" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="40"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredAdresse" runat="server" ErrorMessage="*L'adresse est obligatoire" ControlToValidate="txtAdresse" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblVille" runat="server" Text="Ville"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtVille" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredVille" runat="server" ErrorMessage="*La ville est obligatoire" ControlToValidate="txtVille" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblDateNaissance" runat="server" Text="Date de naissance"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtDate" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red"></asp:TextBox></div>
        <asp:RequiredFieldValidator ID="requiredDate" runat="server" ErrorMessage="*La date de naissance est obligatoire" ControlToValidate="txtDate" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExDate" runat="server" ErrorMessage="*Votre date n'est pas dans le format jj/mm/aaaa" ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  " Display="Dynamic" ControlToValidate="txtDate" ForeColor="Red"></asp:RegularExpressionValidator>
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblTelephone" runat="server" Text="Téléphone"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtTelephone" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="13"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
             <asp:RegularExpressionValidator ID="regExTelephone" runat="server" Display="Dynamic" ErrorMessage="*Entrer un numéro de téléphone dans le format suivant (123)456-7890" ForeColor="Red" ControlToValidate="txtTelephone" ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[0-9]{3}[\-]{1}[0-9]{4})$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="requiredTelephone" runat="server" ErrorMessage="*Le téléphone est obligatoire" ControlToValidate="txtTelephone" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblCodePostal" runat="server" Text="Code Postal"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtCodePostal" runat="server" CssClass="search-query" SkinID="txtBoxBlue" Width="80px"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
             <asp:RegularExpressionValidator ID="regExCodePostal" runat="server" ErrorMessage="*Veuillez entrer un code postal dans le format A1A 1A1" ForeColor="Red" Display="Dynamic" ControlToValidate="txtCodePostal" ValidationExpression="[A-Z]\d[A-Z] \d[A-Z]\d"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="requiredCodePostal" runat="server" ErrorMessage="*Le code postal est obligatoire" ControlToValidate="txtCodePostal" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblMDP" runat="server" Text="Mot de passe"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtMDP" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="20" TextMode="Password"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
             <asp:RegularExpressionValidator ID="regExMDP" runat="server" ErrorMessage="*Votre mot de passe doit contenir entre 8 et 20 caractère" ControlToValidate="txtMDP" ForeColor="Red" Display="Dynamic" ValidationExpression="^[A-Za-z0-9]{8,}$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="requiredMDP" Display="Dynamic" runat="server" ErrorMessage="*Le mot de passe est obligatoire" ControlToValidate="txtMDP" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="ligneFormulaire">   
         <div class="elementFormulaireTexte"><asp:Label ID="lblMDPConfirm" runat="server" Text="Confirmation du mot de passe"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtMDPConfirm" runat="server" CssClass="search-query" SkinID="txtBoxBlue" TextMode="Password"></asp:TextBox></div>
         <div class="elementFormulaireRequired">
             <asp:CompareValidator ID="compareMDPConfirm" runat="server" ErrorMessage="*Votre mot de passe ne correspond pas" ForeColor="Red" ControlToCompare="txtMDP" ControlToValidate="txtMDPConfirm"></asp:CompareValidator>
        <asp:RequiredFieldValidator Display="Dynamic" ID="requiredMDPConfirm" runat="server" ErrorMessage="*Veuillez confirmez votre mot de passe" ControlToValidate="txtMDPConfirm" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
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
	</script>

</div>
</asp:Content>

