<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="home_member.aspx.vb" Inherits="Page_Client_home_member" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">

<div class="titleClient">
Bonjour, <asp:Label ID="lblNomUtilisateur" runat="server" Text="Roger Coté"></asp:Label>
<br />
<div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblMembreID" runat="server" Text="Sexe"></asp:Label></div>
         <div class="elementFormulaire">
             <asp:DropDownList ID="dropDownMembre" runat="server" Width="55px" SkinID="ddlBlue" DataSourceId="dsMember" DataValueField="idMembre" AppendDataBoundItems="False" AutoPostBack="True" />
         </div>
    </div>
</div>

<div class="contenuClient">

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="infoPersonnel" runat="server" Text="Informations personnels"></asp:Label>
    <div class="sectionTitreRight"><asp:Label ID="lblModifier" runat="server" Text="Modifier" ></asp:Label></div>
</div>
</div>  

    <asp:ListView ID="lvInfoMembre" runat="server" DataSourceID="EntityDataSource1" DataKeyNames="idMembre">
        <LayoutTemplate>
            <div class="infoClient">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="clientInfoGauche">
                <div class="partiGauche">
                    <asp:Label ID="lblNom" runat="server" Text="Nom:"></asp:Label>
                    </br>
                    <asp:Label ID="lblAdresse" runat="server" Text="Adresse:"></asp:Label>
                    </br>
                    <asp:Label ID="lblTelephone" runat="server" Text="Téléphone:"></asp:Label>
                    </br>
                    <asp:Label ID="lblNaissance" runat="server" Text="Date de naissance:"></asp:Label>
                    </br>
                    <asp:Label ID="lblCredit" runat="server" Text="No carte de crédit:"></asp:Label>
                </div>
                
                <div class="partiDroite">
                    <asp:Label ID="lblNomClient" runat="server" Text='<%# Eval("nomMembre") %>'></asp:Label>
                    </br>
                    <asp:Label ID="lblAdresseClient" runat="server" Text='<%# Eval("adresse") %>'></asp:Label>
                    </br>
                    <asp:Label ID="lblTelephoneClient" runat="server" Text='<%# Eval("telephoneMembre") %>'></asp:Label>
                    </br>
                    <asp:Label ID="lblNaissanceClient" runat="server" Text='<%# Eval("dateNaissance") %>'></asp:Label>
                    </br>
                    <asp:Label ID="lblCreditClient" runat="server" Text="**** **** **** 7463"></asp:Label>
                </div>
            </div>

            <div class="clientInfoDroite">
                <div class="partiGauche">
                    <asp:Label ID="lblPrenom" runat="server" Text="Prénom:"></asp:Label>
                    </br>
                    <asp:Label ID="lblPostal" runat="server" Text="Code postal:"></asp:Label>
                    </br>
                    <asp:Label ID="lblVille" runat="server" Text="Ville:"></asp:Label>
                    </br>
                    <asp:Label ID="lblDateInscription" runat="server" Text="Date d'inscription:"></asp:Label>
                </div>
                
                <div class="partiDroite">
                    <asp:Label ID="lblPrenomClient" runat="server" Text='<%# Eval("prenomMembre") %>'></asp:Label>
                    </br>
                    <asp:Label ID="lblVilleClient" runat="server" Text='<%# Eval("ville") %>'></asp:Label>
                    </br>
                    <asp:Label ID="lblPostalClient" runat="server" Text='<%# Eval("codePostal") %>'></asp:Label>
                    </br>
                    <asp:Label ID="lblDateInscriptionClient" runat="server" Text='<%# Eval("dateInscription") %>'></asp:Label>
                </div>
                <br />
                <br />
                
            </div>
                <div class="boutonTexte"></div>
                <div class="bouton">
                    <asp:Button ID="btnModifier" runat="server" CommandName="Edit" Text="Modifier" SkinID="btnYellow" CssClass="btn btn-primary btn-small" />
                </div>
        </ItemTemplate>

        <EditItemTemplate>
        <div class="clientInfoGauche">
                <div class="partiGauche">
                    <div class="formatZone">
                        <asp:Label ID="lblPrenom" runat="server" Text="Prénom:"></asp:Label>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:Label ID="lblNom" runat="server" Text="Nom:" ></asp:Label>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:Label ID="lblAdresse" runat="server" Text="Adresse:"></asp:Label>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:Label ID="lblVille" runat="server" Text="Ville:"></asp:Label>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:Label ID="lblNaissance" runat="server" Text="Date de naissance:"></asp:Label>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:Label ID="lblTelephone" runat="server" Text="Téléphone:"></asp:Label>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:Label ID="lblPostal" runat="server" Text="Code postal:"></asp:Label>
                    </div>
                </div>
                
                <div class="partiDroite" >
                    <div class="formatZone">
                        <asp:TextBox ID="lblPrenomClient" SkinID="txtBoxYellow" runat="server" Text='<%# Bind("prenomMembre") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="lblNomClient" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("nomMembre") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="lblAdresseClient" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("adresse") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                    <asp:TextBox ID="lblVilleClient" SkinID="txtBoxYellow" runat="server" Text='<%# Bind("ville") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="datepicker search-query" SkinID="txtBoxYellow" MaxLength="10" ForeColor="Red" Text='<%# Bind("dateNaissance") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="lblTelephoneClient" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("telephoneMembre") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                    <asp:TextBox ID="lblPostalClient" SkinID="txtBoxYellow" runat="server" Text='<%# Bind("codePostal") %>'></asp:TextBox>
                    </div>
                    </br>
                    
            </div>

            <div class="clientInfoDroite">

                
            </div>
                <div class="boutonTexte"></div>
                <div class="bouton">
                    <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter" SkinID="btnYellow" CssClass="btn btn-primary btn-small" />
                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Canceler" SkinID="btnYellow" CssClass="btn btn-primary btn-small" />
                </div>
        </EditItemTemplate>
    </asp:ListView>
    

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="lblCourrielMDP" runat="server" Text="Courriel et mot de passe"></asp:Label>
</div>
</div>

<div class="clientMotPasse">
                <div class="partiGaucheMotPasse">
                    <asp:Label ID="lblCourriel" runat="server" Text="Courriel:"></asp:Label>
                    </br>
                    <asp:Label ID="lblMotPasse" runat="server" Text="Mot de passe:"></asp:Label>
                </div>
                
                <div class="partiDroiteMotPasse">
                    <asp:Label ID="lblCourrielClient" runat="server" Text="gsfad@hotmail.com"></asp:Label>
                    </br>
                    <asp:Label ID="lblMotPasseClient" runat="server" Text="************"></asp:Label>
                </div>
            </div>  

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="lblMembreFamille" runat="server" Text="Membre(s) de la famille"></asp:Label>
    <div class="sectionTitreRight"><asp:Label ID="lblAjouter" runat="server" Text="Ajouter" ></asp:Label></div>
</div>
</div> 

<asp:ListView ID="lvFamille" runat="server" DataSourceID="EntityDataSource1" DataKeyNames="idMembre">
        <LayoutTemplate>
            <div class="famille">
                <div class="titreGauche">
                    <asp:Label ID="lblTitreNomFamille" runat="server" Text="Nom du membre:"></asp:Label>
                </div>
                <div class="titreDroit">
                    <asp:Label ID="lblTitreStatusFamille" runat="server" Text="Status du membre:"></asp:Label>
                </div>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="contenuGauche">
                <asp:Label ID="lblNomFamille" runat="server" Text="Michel Griggs"></asp:Label>
            </div>
            <div class="contenuDroit">
                <asp:Label ID="lblStatusFamille" runat="server" Text="Enfant"></asp:Label>
            </div>
        </ItemTemplate>
</asp:ListView>

<%--<div class="famille">--%>
<%--    <div class="titreGauche">
        <asp:Label ID="lblTitreNomFamille" runat="server" Text="Nom du membre:"></asp:Label>
    </div>
    <div class="titreDroit">
        <asp:Label ID="lblTitreStatusFamille" runat="server" Text="Status du membre:"></asp:Label>
    </div>--%>
    <%--<asp:ListView ID="lvMembreFamille" runat="server">
        <ItemTemplate>--%>
<%--            <div class="contenuGauche">
                <asp:Label ID="lblNomFamille" runat="server" Text="Michel Griggs"></asp:Label>
            </div>
            <div class="contenuDroit">
                <asp:Label ID="lblStatusFamille" runat="server" Text="Enfant"></asp:Label>
            </div>--%>
        <%--</ItemTemplate>
    </asp:ListView>--%>
</div> 

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="lblHistoriqueAbonnement" runat="server" Text="Historique des abonnements"></asp:Label>
</div>
</div>  

<div class="abonnement">
    <div class="titreGauche">
        <asp:Label ID="Label1" runat="server" Text="Nom de l'activité:"></asp:Label>
    </div>
    <div class="titreDroit">
        <asp:Label ID="Label2" runat="server" Text="Date d'abonnement:"></asp:Label>
    </div>
    <%--<asp:ListView ID="lvMembreFamille" runat="server">
        <ItemTemplate>--%>
            <div class="contenuGauche">
                <asp:Label ID="Label3" runat="server" Text="Tennis"></asp:Label>
                <br />
                <asp:Label ID="Label5" runat="server" Text="Tennis"></asp:Label>
                <br />
                <asp:Label ID="Label9" runat="server" Text="Tennis"></asp:Label>
                <br />
                <asp:Label ID="Label10" runat="server" Text="Tennis"></asp:Label>
            </div>
            <div class="contenuDroit">
                <asp:Label ID="Label4" runat="server" Text="08/07/2011"></asp:Label>
                <br />
                <asp:Label ID="Label6" runat="server" Text="08/07/2011"></asp:Label>
                <br />
                <asp:Label ID="Label7" runat="server" Text="08/07/2011"></asp:Label>
                <br />
                <asp:Label ID="Label8" runat="server" Text="08/07/2011"></asp:Label>
            </div>
        <%--</ItemTemplate>
    </asp:ListView>--%>
</div> 

<script>
    $(function () {
        $(".datepicker").datepicker({
            dayNamesMin: ["Di", "Lu", "Ma", "Me", "Je", "ve", "Sa"],
            monthNamesShort: ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"],
            yearRange: "c-100:c",
            changeMonth: true,
            changeYear: true,
            dateFormat: "mm/dd/yy"
        });
    });
</script>

</div>
</div>

    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
    EnableDelete="true" EnableInsert="false" EnableUpdate="true" orderBy="it.idMembre" 
    where="(@MembreID = it.idMembre)">
    <WhereParameters>
        <asp:ControlParameter Name="MembreID" ControlID="dropDownMembre" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsMember" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
    EnableDelete="true" EnableInsert="false" EnableUpdate="true" orderBy="it.idMembre">
    </asp:EntityDataSource>

</asp:Content>

