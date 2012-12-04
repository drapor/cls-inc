<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="register.aspx.vb" Inherits="Page_Autre_register" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="containerContenuAdmin">

<div class="titleAdminNormal">
    <asp:Label ID="lblAjouterEmploye" runat="server" Text="Créé un compte"></asp:Label>
</div>
        <div class="containerFormulaire">
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblCourriel" runat="server" Text="E-mail(*)"></asp:Label></div>
            <div class="elementFormulaire" style="width:250px;"><asp:TextBox ID="txtCourriel" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="50" Text="" OnTextChanged="emailVerification" AutoPostBack="true" ></asp:TextBox></div>
            <div class="validation">
                <asp:ImageButton ID="imgFailEmail" runat="server" Visible="false" ImageUrl="~/App_Themes/Original/img/delete.png" Width="19px" />
                <asp:Label ID="lblEmailErro" runat="server" Text="Désolé, ce courriel existe déjà." ForeColor="red" Visible="true"></asp:Label>
                <asp:RequiredFieldValidator ID="requiredCourriel" runat="server" ErrorMessage="*L'adresse courriel est obligatoire" ControlToValidate="txtCourriel" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regExCourriel" runat="server" ErrorMessage="*Veuillez entrer une adresse dans le format adresse@courriel.com" ControlToValidate="txtCourriel" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                <asp:CustomValidator ID="courrielCompare" runat="server" ControlToValidate="txtCourriel" OnServerValidate="inscription" ErrorMessage="Ce courriel est déjà utilisé!" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblPrenom" runat="server" Text="Prénom(*)"></asp:Label></div>
            <div class="elementFormulaire" style="width:250px;"><asp:TextBox ID="txtPrenom" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25" Text=""></asp:TextBox></div>
            <div class="validation">
                <asp:RequiredFieldValidator ID="requiredPrenom" runat="server" ErrorMessage="*Le prénom est obligatoire" ControlToValidate="txtPrenom" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblNom" runat="server" Text="Nom(*)"></asp:Label></div>
            <div class="elementFormulaire" style="width:250px;"><asp:TextBox ID="txtNom" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25" Text=""></asp:TextBox></div>
            <div class="validation">
                <asp:RequiredFieldValidator ID="requiredNom" runat="server" ErrorMessage="*Le nom est obligatoire" ControlToValidate="txtNom" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblSexe" runat="server" Text="Sexe"></asp:Label></div>
         <div class="elementFormulaire" style="width:250px;">
             <asp:RadioButtonList ID="rdbtnSexe" runat="server" RepeatDirection="Horizontal" Width="200px">
                <asp:ListItem Text="Homme" Value="H" Selected="true"></asp:ListItem>
                <asp:ListItem Text="Femme" Value="F"></asp:ListItem>
            </asp:RadioButtonList>
         </div>
    </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblAdresse" runat="server" Text="Adresse(*)"></asp:Label></div>
            <div class="elementFormulaire" style="width:250px;"><asp:TextBox ID="txtAdresse" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="40" Text=""></asp:TextBox></div>
            <div class="validation">
                <asp:RequiredFieldValidator ID="requiredAdresse" runat="server" ErrorMessage="*L'adresse est obligatoire" ControlToValidate="txtAdresse" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblVille" runat="server" Text="Ville(*)"></asp:Label></div>
            <div class="elementFormulaire" style="width:250px;"><asp:TextBox ID="txtVille" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25" Text=""></asp:TextBox></div>
            <div class="validation">
                <asp:RequiredFieldValidator ID="requiredVille" runat="server" ErrorMessage="*La ville est obligatoire" ControlToValidate="txtVille" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblDateNaissance" runat="server" Text="Date de naissance(*)"></asp:Label></div>
            <div class="elementFormulaire" style="width:250px;"><asp:TextBox ID="txtDate" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" text="" Width="75px"></asp:TextBox></div>
            <div class="validation">    
                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ErrorMessage="*La date de naissance est obligatoire" ControlToValidate="txtDate" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regExDate" runat="server" ErrorMessage="*Votre date n'est pas dans le format aaaa/mm/jj" 
                ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$" Display="Dynamic" ControlToValidate="txtDate" ForeColor="Red"></asp:RegularExpressionValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblTelephone" runat="server" Text="Téléphone(*)"></asp:Label></div>
            <div class="elementFormulaire" style="width:180px;"><asp:TextBox ID="txtTelephone" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="13" Text="" Width="95px"></asp:TextBox></div>
            <div class="validation">
                <asp:RegularExpressionValidator ID="regExTelephone" runat="server" Display="Dynamic" ErrorMessage="*Entrer un numéro de téléphone dans le format suivant (123)456-7890" ForeColor="Red" ControlToValidate="txtTelephone" ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[0-9]{3}[\-]{1}[0-9]{4})$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="requiredTelephone" runat="server" ErrorMessage="*Le téléphone est obligatoire" ControlToValidate="txtTelephone" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblCodePostal" runat="server" Text="Code Postal(*)"></asp:Label></div>
            <div class="elementFormulaire" style="width:250px;"><asp:TextBox ID="txtCodePostal" runat="server" CssClass="search-query" SkinID="txtBoxBlue" Width="60px" Text="" MaxLength="7"></asp:TextBox></div>
            <div class="validation">
                <asp:RegularExpressionValidator ID="regExCodePostal" runat="server" ErrorMessage="*Veuillez entrer un code postal dans le format A1A 1A1" ForeColor="Red" Display="Dynamic" ControlToValidate="txtCodePostal" ValidationExpression="[A-Z]\d[A-Z] \d[A-Z]\d"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="requiredCodePostal" runat="server" ErrorMessage="*Le code postal est obligatoire" ControlToValidate="txtCodePostal" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblMDP" runat="server" Text="Mot de passe(*)"></asp:Label></div>
            <div class="elementFormulaire" style="width:250px;"><asp:TextBox ID="txtMDP" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="20" TextMode="Password" Text=""></asp:TextBox></div>
            <div class="validation">
                <asp:RegularExpressionValidator ID="regExMDP" runat="server" ErrorMessage="*Votre mot de passe doit contenir entre 8 et 20 caractère" ControlToValidate="txtMDP" ForeColor="Red" Display="Dynamic" ValidationExpression="^[A-Za-z0-9]{8,}$"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="requiredMDP" Display="Dynamic" runat="server" ErrorMessage="*Le mot de passe est obligatoire" ControlToValidate="txtMDP" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblMDPConfirm" runat="server" Text="Confirmation du mot de passe(*)"></asp:Label></div>
            <div class="elementFormulaire" style="width:250px;"><asp:TextBox ID="txtMDPConfirm" runat="server" CssClass="search-query" SkinID="txtBoxBlue" TextMode="Password"></asp:TextBox></div>
            <div class="validation">
                <asp:CompareValidator ID="compareMDPConfirm" runat="server" ErrorMessage="*Votre mot de passe ne correspond pas" ForeColor="Red" ControlToCompare="txtMDP" ControlToValidate="txtMDPConfirm" Display="Dynamic"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="requiredMDPConfirm" runat="server" ErrorMessage="*Veuillez confirmez votre mot de passe" ControlToValidate="txtMDPConfirm" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"></div>
            <div class="bouton" style="margin-top:-10px; margin-left:300px;">
                <asp:Button ID="btnInscription" runat="server" OnClick="inscription" Text="Poursuivre mon inscription" CssClass="btn btn-primary btn-large btn"/>
                <asp:Button ID="btnCancel" runat="server" Text="Annuler" CssClass="btn btn-primary btn-large btn" CausesValidation="false" PostBackUrl="~/Page/Default.aspx"/>
            </div>
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
            dateFormat: "yy/mm/dd",
            maxDate: "-18y"
        });
    });
	</script>

<asp:EntityDataSource ID="dsMembre" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu"
    EnableFlattening="False" EnableDelete="False" EnableInsert="True" EnableUpdate="False" 
    orderBy="it.idMembre">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsListeRole" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="RoleJeu"
    EnableFlattening="False" EnableDelete="False" EnableInsert="True" EnableUpdate="False" 
    orderBy="it.idRole" Where="it.idRole = 4 or it.idRole = 5">
    </asp:EntityDataSource>

</asp:Content>
