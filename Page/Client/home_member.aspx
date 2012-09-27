<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="home_member.aspx.vb" Inherits="Page_Client_home_member" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">

<div class="titleClient">
Bonjour, <asp:Label ID="lblNomUtilisateur" runat="server" Text="Roger Coté"></asp:Label>
</div>

<div class="contenuClient">

<div class="menuSection">
<div class="textMenuSection">
    <asp:Label ID="infoPersonnel" runat="server" Text="Informations personnels"></asp:Label>
    <div class="textMenuRight"><asp:Label ID="lblModifier" runat="server" Text="Modifier" ></asp:Label></div>
</div>
</div>  
<div class="infoClient">
<%--    <asp:ListView ID="lvInfoMembre" runat="server">
        <ItemTemplate>--%>
            <%--<div class="clientInfoPartiGauche">
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
                    <asp:Label ID="lblNomClient" runat="server" Text="Griggs"></asp:Label>
                    </br>
                    <asp:Label ID="lblAdresseClient" runat="server" Text="444 Cowie"></asp:Label>
                    </br>
                    <asp:Label ID="lblTelephoneClient" runat="server" Text="(450)375-3265"></asp:Label>
                    </br>
                    <asp:Label ID="lblNaissanceClient" runat="server" Text="07/07/1981"></asp:Label>
                    </br>
                    <asp:Label ID="lblCreditClient" runat="server" Text="**** **** **** 7463"></asp:Label>
                </div>
            </div>

            <div class="clientInfoPartiDroite">
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
                    <asp:Label ID="lblPrenomClient" runat="server" Text="Francis"></asp:Label>
                    </br>
                    <asp:Label ID="lblVilleClient" runat="server" Text="Granby"></asp:Label>
                    </br>
                    <asp:Label ID="lblPostalClient" runat="server" Text="07/07/1981"></asp:Label>
                    </br>
                    <asp:Label ID="lblDateInscriptionClient" runat="server" Text="08/02/2010"></asp:Label>
                </div>
            </div>--%>
<%--        </ItemTemplate>
    </asp:ListView>--%>
    
</div>
<div class="menuSection">
<div class="textMenuSection">
    <asp:Label ID="lblCourrielMDP" runat="server" Text="Courriel et mot de passe"></asp:Label>
</div>
</div>

<div class="clientMotPasse">
                <%--<div class="partiGaucheMotPasse">
                    <asp:Label ID="lblCourriel" runat="server" Text="Courriel:"></asp:Label>
                    </br>
                    <asp:Label ID="lblMotPasse" runat="server" Text="Mot de passe:"></asp:Label>
                </div>
                
                <div class="partiDroiteMotPasse">
                    <asp:Label ID="lblCourrielClient" runat="server" Text="gsfad@hotmail.com"></asp:Label>
                    </br>
                    <asp:Label ID="lblMotPasseClient" runat="server" Text="************"></asp:Label>
                </div>--%>
            </div>  

<div class="menuSection">
<div class="textMenuSection">
    <asp:Label ID="lblMembreFamille" runat="server" Text="Membre(s) de la famille"></asp:Label>
    <div class="textMenuRight"><asp:Label ID="lblAjouter" runat="server" Text="Ajouter" ></asp:Label></div>
</div>
</div> 

<div class="famille">
    <%--<div class="titreNomFamille">
        <asp:Label ID="lblTitreNomFamille" runat="server" Text="Nom du membre:"></asp:Label>
    </div>
    <div class="titreStatusFamille">
        <asp:Label ID="lblTitreStatusFamille" runat="server" Text="Status du membre:"></asp:Label>
    </div>--%>
    <%--<asp:ListView ID="lvMembreFamille" runat="server">
        <ItemTemplate>--%>
           <%-- <div class="nomFamille">
                <asp:Label ID="lblNomFamille" runat="server" Text="Michel Griggs"></asp:Label>
            </div>
            <div class="statusFamille">
                <asp:Label ID="lblStatusFamille" runat="server" Text="Enfant"></asp:Label>
            </div>--%>
        <%--</ItemTemplate>
    </asp:ListView>--%>
</div> 

<div class="menuSection">
<div class="textMenuSection">
    <asp:Label ID="lblHistoriqueAbonnement" runat="server" Text="Historique des abonnements"></asp:Label>
</div>
</div>  

<div class="Abonnement">
    <%--<div class="titreNomFamille">
        <asp:Label ID="Label1" runat="server" Text="Nom du membre:"></asp:Label>
    </div>
    <div class="titreStatusFamille">
        <asp:Label ID="Label2" runat="server" Text="Status du membre:"></asp:Label>
    </div>--%>
    <%--<asp:ListView ID="lvMembreFamille" runat="server">
        <ItemTemplate>--%>
            <%--<div class="nomFamille">
                <asp:Label ID="Label3" runat="server" Text="Michel Griggs"></asp:Label>
            </div>
            <div class="statusFamille">
                <asp:Label ID="Label4" runat="server" Text="Enfant"></asp:Label>
            </div>--%>
        <%--</ItemTemplate>
    </asp:ListView>--%>
</div> 

</div>
</div>
</asp:Content>

