<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="member_family_add.aspx.vb" Inherits="Page_Autre_register" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuFamille">

    <div class="titleFamille">
        <h3><asp:Label ID="lblAjouterFamille" runat="server" Text="Ajouter un membre de famille"></asp:Label></h3>
    </div>
<asp:ListView ID="lvMembreFamille" runat="server" DataSourceID="dsMembreFamille" DataKeyNames="idMembre" InsertItemPosition="LastItem" ItemPlaceholderID="itemPlaceHolder">
    <LayoutTemplate>
        <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
    </LayoutTemplate>
    <ItemTemplate>
    </ItemTemplate>
    <InsertItemTemplate>
    <div class="containerFormulaire">
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblPrenom" runat="server" Text="Prénom"></asp:Label></div>
            <div class="elementFormulaire"><asp:TextBox ID="txtPrenom" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25" Text='<%# Bind("prenomMembre") %>'></asp:TextBox></div>
            <div class="elementFormulaireRequired">
                <asp:RequiredFieldValidator ID="requiredPrenom" runat="server" ErrorMessage="*Le prénom est obligatoire" ControlToValidate="txtPrenom" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblNom" runat="server" Text="Nom"></asp:Label></div>
            <div class="elementFormulaire"><asp:TextBox ID="txtNom" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25" Text='<%# Bind("nomMembre") %>'></asp:TextBox></div>
            <div class="elementFormulaireRequired">
                <asp:RequiredFieldValidator ID="requiredNom" runat="server" ErrorMessage="*Le nom est obligatoire" ControlToValidate="txtNom" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblSexe" runat="server" Text="Sexe"></asp:Label></div>
            <div class="elementFormulaire">
                <asp:DropDownList ID="dropDownSexe" runat="server" Width="60px" SkinID="ddlBlue" SelectedValue='<%# Bind("sexe") %>'>
                    <asp:ListItem Selected="True">H</asp:ListItem>
                    <asp:ListItem>F</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblAdresse" runat="server" Text="Adresse"></asp:Label></div>
            <div class="elementFormulaire"><asp:TextBox ID="txtAdresse" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="40" Text='<%# Bind("adresse") %>'></asp:TextBox></div>
            <div class="elementFormulaireRequired">
                <asp:RequiredFieldValidator ID="requiredAdresse" runat="server" ErrorMessage="*L'adresse est obligatoire" ControlToValidate="txtAdresse" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblVille" runat="server" Text="Ville"></asp:Label></div>
            <div class="elementFormulaire"><asp:TextBox ID="txtVille" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25" Text='<%# Bind("ville") %>'></asp:TextBox></div>
            <div class="elementFormulaireRequired">
                <asp:RequiredFieldValidator ID="requiredVille" runat="server" ErrorMessage="*La ville est obligatoire" ControlToValidate="txtVille" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblDateNaissance" runat="server" Text="Date de naissance"></asp:Label></div>
            <div class="elementFormulaire">
                <asp:TextBox ID="txtDate" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" text='<%# Bind("dateNaissance", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
            </div>
            <asp:RequiredFieldValidator ID="requiredDate" runat="server" ErrorMessage="*La date de naissance est obligatoire" ControlToValidate="txtDate" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="regExDate" runat="server" ErrorMessage="*Votre date n'est pas dans le format aaaa/mm/jj" 
            ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$" Display="Dynamic" ControlToValidate="txtDate" ForeColor="Red"></asp:RegularExpressionValidator>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblTelephone" runat="server" Text="Téléphone"></asp:Label></div>
            <div class="elementFormulaire"><asp:TextBox ID="txtTelephone" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="13" Text='<%# Bind("telephoneMembre") %>'></asp:TextBox></div>
            <div class="elementFormulaireRequired">
                <asp:RegularExpressionValidator ID="regExTelephone" runat="server" Display="Dynamic" ErrorMessage="*Entrer un numéro de téléphone dans le format suivant (123)456-7890" ForeColor="Red" ControlToValidate="txtTelephone" ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[0-9]{3}[\-]{1}[0-9]{4})$"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="requiredTelephone" runat="server" ErrorMessage="*Le téléphone est obligatoire" ControlToValidate="txtTelephone" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblCodePostal" runat="server" Text="Code Postal"></asp:Label></div>
            <div class="elementFormulaire"><asp:TextBox ID="txtCodePostal" runat="server" CssClass="search-query" SkinID="txtBoxBlue" Width="80px" Text='<%# Bind("codePostal") %>'></asp:TextBox></div>
            <div class="elementFormulaireRequired">
                <asp:RegularExpressionValidator ID="regExCodePostal" runat="server" ErrorMessage="*Veuillez entrer un code postal dans le format A1A 1A1" ForeColor="Red" Display="Dynamic" ControlToValidate="txtCodePostal" ValidationExpression="[A-Z]\d[A-Z] \d[A-Z]\d"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="requiredCodePostal" runat="server" ErrorMessage="*Le code postal est obligatoire" ControlToValidate="txtCodePostal" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblType" runat="server" Text="Type de compte:"></asp:Label></div>
            <div class="elementFormulaire">
                <asp:DropDownList ID="ddlRole" runat="server" Width="130px" SkinID="ddlBlue" SelectedValue='<%# Bind("RoleJeu_idRole") %>' DataSourceID="dsListeRole" 
                                    appendDataboundItems="False" DataTextField="nomRole" DataValueField="idRole">
                </asp:DropDownList>
            </div>
        </div>

        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"></div>
                <div class="elementFormulaire">
                    <asp:Button ID="btnAjouter" runat="server" CommandName="Insert" Text="Ajouter" CssClass="btn btn-primary btn-large btn" />
                    <asp:Button ID="btnCancel" runat="server" Text="Canceller" CssClass="btn btn-primary btn-large btn" CausesValidation="false"/>
                </div>
        </div>
    </div>
    </InsertItemTemplate>
</asp:ListView>

<script>
    $(function () {
        $(".datepicker").datepicker({
            dayNamesMin: ["Di", "Lu", "Ma", "Me", "Je", "ve", "Sa"],
            monthNamesShort: ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"],
            yearRange: "c-100:c",
            changeMonth: true,
            changeYear: true,
            dateFormat: "yy/mm/dd"
        });
    });
	</script>
</div>

<asp:EntityDataSource ID="dsMembreFamille" runat="server" ConnectionString="name=modelCLSContainer"
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
