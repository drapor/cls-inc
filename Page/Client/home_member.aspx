﻿<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="home_member.aspx.vb" Inherits="Page_Client_home_member" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">

<div class="titleClient">
Votre compte!
<br />
<div class="ligneFormulaire">
         <div class="elementFormulaireTexte"></div>
         <div class="elementFormulaire">
             <asp:DropDownList ID="dropDownMembre" runat="server" Width="100px" SkinID="ddlBlue" DataSourceId="dsMember" DataValueField="idMembre" AppendDataBoundItems="False" AutoPostBack="True" DataTextField="prenomMembre" />
         </div>
    </div>
</div>

<div class="contenuClient">

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="infoPersonnel" runat="server" Text="Informations personnels"></asp:Label>
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
<%--                    </br>
                    <asp:Label ID="lblCredit" runat="server" Text="No carte de crédit:"></asp:Label>--%>
                </div>
                
                <div class="partiDroite">
                    <asp:Label ID="lblNomClient" runat="server" Text='<%# Eval("nomMembre") %>'></asp:Label>
                    </br>
                    <asp:Label ID="lblAdresseClient" runat="server" Text='<%# Eval("adresse") %>'></asp:Label>
                    </br>
                    <asp:Label ID="lblTelephoneClient" runat="server" Text='<%# Eval("telephoneMembre") %>'></asp:Label>
                    </br>
                    <asp:Label ID="lblNaissanceClient" runat="server" Text='<%# (CType(Eval("dateNaissance"),DateTime)).ToShortDateString %>'></asp:Label>
                    </br>
                    <%--<div class="carteCredit">
                        <asp:Label ID="lblCreditClient" runat="server" Text="**** **** **** 7463"></asp:Label>
                    </div>--%>
                    <%--<div class="modifierBouton">
                        <asp:LinkButton ID="btnModifierCredit" runat="server" Text="Modifier"></asp:LinkButton>
                    </div>--%>
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
                    <asp:Label ID="lblDateInscriptionClient" runat="server" Text='<%# (CType(Eval("dateInscription"),DateTime)).ToShortDateString %>'></asp:Label>
                </div>
                
            </div>
                <div class="bouton">
                    <asp:Button ID="btnModifier" runat="server" CommandName="Edit" Text="Modifier les informations" CssClass="btn btn-primary"/>
                </div>
        </ItemTemplate>

        <EditItemTemplate>
        <div class="clientEditInfo">
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
                        <asp:TextBox ID="txtPrenomClient" SkinID="txtBoxYellow" runat="server" Text='<%# Bind("prenomMembre") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="txtNomClient" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("nomMembre") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="txtAdresseClient" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("adresse") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                    <asp:TextBox ID="txtVilleClient" SkinID="txtBoxYellow" runat="server" Text='<%# Bind("ville") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="datepicker" SkinID="txtBoxYellow" MaxLength="10" ForeColor="Red" Text='<%# Bind("dateNaissance", "{0:MM-dd-yy}") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="txtTelephoneClient" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("telephoneMembre") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                    <asp:TextBox ID="txtPostalClient" SkinID="txtBoxYellow" runat="server" Text='<%# Bind("codePostal") %>'></asp:TextBox>
                    </div>
                    </br>
            </div>

            <div class="clientValidation">
                        <div class="formatZone">
                            <asp:RequiredFieldValidator ID="requiredPrenom" runat="server" ErrorMessage="*Le prénom est obligatoire" ControlToValidate="txtPrenomClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:RequiredFieldValidator ID="requiredNom" runat="server" ErrorMessage="*Le nom est obligatoire" ControlToValidate="txtNomClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:RequiredFieldValidator ID="requiredAdresse" runat="server" ErrorMessage="*L'adresse est obligatoire" ControlToValidate="txtAdresseClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:RequiredFieldValidator ID="requiredVille" runat="server" ErrorMessage="*La ville est obligatoire" ControlToValidate="txtVilleClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:RequiredFieldValidator ID="requiredDate" runat="server" ErrorMessage="*La date de naissance est obligatoire" ControlToValidate="txtDate" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regExDate" runat="server" ErrorMessage="*Votre date n'est pas dans le format mm/jj/aaaa" 
                            ValidationExpression="^(?:(?:(?:0?[13578]|1[02])(\/|-|\.)31)\1|(?:(?:0?[13-9]|1[0-2])(\/|-|\.)(?:29|30)\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:0?2(\/|-|\.)29\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:(?:0?[1-9])|(?:1[0-2]))(\/|-|\.)(?:0?[1-9]|1\d|2[0-8])\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$" Display="Dynamic" ControlToValidate="txtDate" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:RegularExpressionValidator ID="regExTelephone" runat="server" Display="Dynamic" ErrorMessage="*Entrer un numéro de téléphone dans le format suivant (123)456-7890" ForeColor="Red" ControlToValidate="txtTelephoneClient" ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[0-9]{3}[\-]{1}[0-9]{4})$"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="requiredTelephone" runat="server" ErrorMessage="*Le téléphone est obligatoire" ControlToValidate="txtTelephoneClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:RegularExpressionValidator ID="regExCodePostal" runat="server" ErrorMessage="*Veuillez entrer un code postal dans le format A1A 1A1" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPostalClient" ValidationExpression="[A-Z]\d[A-Z] \d[A-Z]\d"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="requiredCodePostal" runat="server" ErrorMessage="*Le code postal est obligatoire" ControlToValidate="txtPostalClient" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
            </div>

                <div class="bouton">
                    <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter" CssClass="btn btn-primary btn-small" />
                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Canceler" CssClass="btn btn-primary btn-small" />
                </div>
           </div>
        </EditItemTemplate>
    </asp:ListView>
    

<div class="section">
    <div class="sectionTitre">
        <asp:Label ID="lblTitreCourriel" runat="server" Text="Courriel"></asp:Label>
    </div>
</div>
<asp:ListView ID="lvCourriel" runat="server" DataSourceID="EntityDataSource1" DataKeyNames="idMembre">
        <LayoutTemplate>
            <div class="clientMotPasse">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
                <div class="partiGaucheMotPasse">
                    <asp:Label ID="lblCourriel" runat="server" Text="Votre courriel:" Font-Bold="True"></asp:Label>
                    </br>
                    
                </div>
                
                <div class="partiDroiteMotPasse">
                    <asp:Label ID="lblCourrielClient" runat="server" Text='<%# Eval("courriel") %>' ></asp:Label>
                    </br>
                    
                </div>
                <div class="modifierBouton">
                    <asp:LinkButton ID="btnModifierCourriel" runat="server" Text="Modifier le courriel" commandName="Edit"></asp:LinkButton>
                    </br>    
                </div>
          </ItemTemplate>
          <EditItemTemplate>
          <div class="partiGaucheCourriel">
                    <div class="formatZone">
                        <asp:Label ID="lblCourriel" runat="server" Text="Votre présent courriel:"></asp:Label>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:Label ID="lblNouveauCourriel" runat="server" Text="Entrez votre nouveau courriel:" ></asp:Label>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:Label ID="lblNouveauCourrielEncore" runat="server" Text="Retapez votre nouveau courriel:"></asp:Label>
                    </div>
                </div>
                <div class="partiDroiteCourriel">
                    <div class="formatZone">
                        <asp:Label ID="lblCourrielPresent" runat="server" Text='<%# Eval("courriel") %>'></asp:Label>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="txtNouveauCourriel" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("courriel") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="txtNouveauCourrielEncore" runat="server" SkinID="txtBoxYellow" Text=""></asp:TextBox>
                    </div>
                </div>

                <div class="validation">
                    <div class="formatZone">
                        </br>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:CompareValidator Display="Dynamic" ID="compareCourriel" runat="server" ErrorMessage="*Votre courriel ne correspond pas" ForeColor="Red" ControlToCompare="txtNouveauCourrielEncore" ControlToValidate="txtNouveauCourriel"></asp:CompareValidator>
                    </div>
                </div>

                <div class="boutonCourriel">
                    <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter" CssClass="btn btn-primary btn-small" PostBackUrl="~/Page/Client/home_member.aspx"/>
                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Canceler" CssClass="btn btn-primary btn-small" PostBackUrl="~/Page/Client/home_member.aspx"/>
                </div>
          </EditItemTemplate>
</asp:ListView>

<div class="section">
    <div class="sectionTitre">
        <asp:Label ID="lblTitreMotPasse" runat="server" Text="Mot de passe"></asp:Label>
    </div>
</div>

<asp:ListView ID="lvMotPasse" runat="server" DataSourceID="EntityDataSource1" DataKeyNames="idMembre">
        <LayoutTemplate>
            <div class="clientMotPasse">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
                <div class="modifierBouton">
                    <asp:LinkButton ID="btnModifierMP" runat="server" commandName="Edit" Text="Changer votre mot de passe"></asp:LinkButton>
                </div>
        </ItemTemplate>
        <EditItemTemplate>
        <div class="partiGaucheCourriel">
                    <div class="formatZone">
                        <asp:Label ID="lblMP" runat="server" Text="Présent mot de passe:"></asp:Label>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:Label ID="lblNouveauMP" runat="server" Text="Nouveau mot de passe:" ></asp:Label>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:Label ID="lblNouveauMPEncore" runat="server" Text="Retapez nouveau mot de passe:"></asp:Label>
                    </div>
                </div>
                <div class="partiDroiteCourriel">
                    <div class="formatZone">
                        <asp:TextBox ID="txtPresentMP" runat="server" SkinID="txtBoxYellow" Text="" TextMode="Password"></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="txtNouveauMP" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("motPasse") %>' TextMode="Password"></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="txtNouveauMPEncore" runat="server" SkinID="txtBoxYellow" Text="" TextMode="Password"></asp:TextBox>
                    </div>
                </div>

                <div class="validation">
                    <div class="formatZone">
                        <%--<asp:RequiredFieldValidator ID="requiredMP" runat="server" ErrorMessage="*Le mot de passe est obligatoire" ControlToValidate="txtNouveauMP" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                        </br>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:CompareValidator Display="Dynamic" ID="compareMP" runat="server" ErrorMessage="*Votre Mot de passe ne correspond pas" ForeColor="Red" ControlToCompare="txtNouveauMPEncore" ControlToValidate="txtNouveauMP"></asp:CompareValidator>
                        <%--<asp:RequiredFieldValidator Display="Dynamic" ID="requiredMPConfirm" runat="server" ErrorMessage="*Veuillez confirmez votre nouveau mot de passe" ControlToValidate="txtNouveauMPEncore" ForeColor="Red" SetFocusOnError="False"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>

                <div class="boutonCourriel">
                    <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter" CssClass="btn btn-primary btn-small" />
                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Canceler" CssClass="btn btn-primary btn-small" />
                </div>
        </EditItemTemplate>
</asp:ListView> 

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="lblMembreFamille" runat="server" Text="Membre(s) de la famille"></asp:Label>
    <div class="sectionTitreRight">
        <asp:LinkButton ID="btnAjouterFamille" runat="server" Text="Ajouter membre"></asp:LinkButton>
    </div>
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
            <div class="afficherFamille">
                    <asp:LinkButton ID="btnAfficherFamille" runat="server" Text="Afficher"></asp:LinkButton>
            </div>
            <div class="supprimerFamille">
                    <asp:LinkButton ID="btnSupprimerFamille" runat="server" Text="Supprimer"></asp:LinkButton>
            </div>
        </ItemTemplate>
</asp:ListView>

<div class="section">
<div class="sectionTitre">
    <asp:Label ID="lblHistoriqueAbonnement" runat="server" Text="Historique des abonnements (5 derniers)"></asp:Label>
    <div class="sectionTitreRight">
        <asp:LinkButton ID="btnHistorique" runat="server" Text="Afficher l'historique"></asp:LinkButton>
    </div>
</div>
</div>  

<asp:ListView ID="lvAbonnement" runat="server" DataSourceID="EntityDataSource1" DataKeyNames="idMembre">
        <LayoutTemplate>
            <div class="abonnement">
                <div class="titreGauche">
                    <asp:Label ID="lblTitreActivite" runat="server" Text="Nom de l'activité:"></asp:Label>
                </div>
                <div class="titreDroit">
                    <asp:Label ID="lblTitreAbonnement" runat="server" Text="Date d'abonnement:"></asp:Label>
                </div>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="contenuGauche">
                <asp:Label ID="lblActivite" runat="server" Text="Tennis"></asp:Label>
            </div>
            <div class="contenuDroit">
                <asp:Label ID="lblAbonnement" runat="server" Text="08/07/2011"></asp:Label>
            </div>
        </ItemTemplate>
</asp:ListView>

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
    EnableDelete="True" EnableInsert="false" EnableUpdate="True" orderBy="it.idMembre" 
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

