﻿<%--Créé par Francis Griggs
Le 12 septembre 2012
Dernière mise à jour le 12 décembre 2012--%>

<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="member_family.aspx.vb" Inherits="Page_Client_client_membre_famille"
    Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="contenuPage">
        <div class="titleClient">
            <h3>
                <asp:Label ID="lblNomUtilisateur" runat="server" Text="Compte membre famille"></asp:Label></h3>
        </div>
        <div class="contenuClient" style="min-height: 300px;">
            <div class="section" style="width: 900px;">
                <div class="sectionTitre" style="width: 900px;">
                    <asp:Label ID="infoPersonnel" runat="server" Text="Informations personnels"></asp:Label>
                </div>
            </div>
            <asp:ListView ID="lvInfoMembre" runat="server" DataSourceID="dsFamille" DataKeyNames="idMembre">
                <LayoutTemplate>
                    <div class="infoMembre" style="width: 860px;">
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="membreInfo" style="width: 430px;">
                        <div class="partiGauche" style="width: 150px;">
                            <asp:Label ID="lblNom" runat="server" Text="Nom:"></asp:Label>
                            </br>
                            <asp:Label ID="lblAdresse" runat="server" Text="Adresse:"></asp:Label>
                            </br>
                            <asp:Label ID="lblTelephone" runat="server" Text="Téléphone:"></asp:Label>
                            </br>
                            <asp:Label ID="lblNaissance" runat="server" Text="Date de naissance:"></asp:Label>
                        </div>
                        <div class="partiDroite" style="width: 250px;">
                            <asp:Label ID="lblNomClient" runat="server" Text='<%# Eval("nomMembre") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblAdresseClient" runat="server" Text='<%# Eval("adresse") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblTelephoneClient" runat="server" Text='<%# Eval("telephoneMembre") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblNaissanceClient" runat="server" Text='<%# (CType(Eval("dateNaissance"),DateTime)).ToShortDateString %>'></asp:Label>
                        </div>
                    </div>
                    <div class="membreInfo" style="width: 430px;">
                        <div class="partiGauche" style="width: 150px;">
                            <asp:Label ID="lblPrenom" runat="server" Text="Prénom:"></asp:Label>
                            </br>
                            <asp:Label ID="lblPostal" runat="server" Text="Code postal:"></asp:Label>
                            </br>
                            <asp:Label ID="lblVille" runat="server" Text="Ville:"></asp:Label>
                            </br>
                            <asp:Label ID="lblDateInscription" runat="server" Text="Date d'inscription:"></asp:Label>
                        </div>
                        <div class="partiDroite" style="width: 250px;">
                            <asp:Label ID="lblPrenomClient" runat="server" Text='<%# Eval("prenomMembre") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblPostalClient" runat="server" Text='<%# Eval("codePostal") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblVilleClient" runat="server" Text='<%# Eval("ville") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblDateInscriptionClient" runat="server" Text='<%# (CType(Eval("dateInscription"),DateTime)).ToShortDateString %>'></asp:Label>
                        </div>
                    </div>
                    <div class="bouton">
                        <asp:Button ID="btnModifier" runat="server" CommandName="Edit" Text="Modifier les informations"
                            CssClass="btn btn-primary btn-small" />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="membreInfo" style="width: 860px;">
                        <div class="partiGauche" style="width: 150px;">
                            <div class="formatZone">
                                <asp:Label ID="lblPrenom" runat="server" Text="Prénom:"></asp:Label>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:Label ID="lblNom" runat="server" Text="Nom:"></asp:Label>
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
                        <div class="partiDroite" style="width: 250px;">
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
                                <asp:TextBox ID="txtDate" runat="server" CssClass="datepicker" SkinID="txtBoxYellow"
                                    MaxLength="10" Width="80px" ForeColor="Red" Text='<%# Bind("dateNaissance", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:TextBox ID="txtTelephoneClient" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("telephoneMembre") %>'
                                    MaxLength="13" Width="100px"></asp:TextBox>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:TextBox ID="txtPostalClient" SkinID="txtBoxYellow" runat="server" Text='<%# Bind("codePostal") %>'
                                    MaxLength="7" Width="65px"></asp:TextBox>
                            </div>
                            </br>
                        </div>
                        <div class="clientValidation">
                            <div class="formatZone">
                                <asp:RequiredFieldValidator ID="requiredPrenom" runat="server" ErrorMessage="*Le prénom est obligatoire"
                                    ControlToValidate="txtPrenomClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:RequiredFieldValidator ID="requiredNom" runat="server" ErrorMessage="*Le nom est obligatoire"
                                    ControlToValidate="txtNomClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:RequiredFieldValidator ID="requiredAdresse" runat="server" ErrorMessage="*L'adresse est obligatoire"
                                    ControlToValidate="txtAdresseClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:RequiredFieldValidator ID="requiredVille" runat="server" ErrorMessage="*La ville est obligatoire"
                                    ControlToValidate="txtVilleClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ErrorMessage="*La date de naissance est obligatoire"
                                    ControlToValidate="txtDate" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExDate" runat="server" ErrorMessage="*Votre date n'est pas dans le format mm/jj/aaaa"
                                    ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$"
                                    Display="Dynamic" ControlToValidate="txtDate" ForeColor="Red"></asp:RegularExpressionValidator>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:RegularExpressionValidator ID="regExTelephone" runat="server" Display="Dynamic"
                                    ErrorMessage="*Entrer un numéro de téléphone dans le format suivant (123)456-7890"
                                    ForeColor="Red" ControlToValidate="txtTelephoneClient" ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[0-9]{3}[\-]{1}[0-9]{4})$"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="requiredTelephone" runat="server" ErrorMessage="*Le téléphone est obligatoire"
                                    ControlToValidate="txtTelephoneClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:RegularExpressionValidator ID="regExCodePostal" runat="server" ErrorMessage="*Veuillez entrer un code postal dans le format A1A 1A1"
                                    ForeColor="Red" Display="Dynamic" ControlToValidate="txtPostalClient" ValidationExpression="[A-Z]\d[A-Z] \d[A-Z]\d"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="requiredCodePostal" runat="server" ErrorMessage="*Le code postal est obligatoire"
                                    ControlToValidate="txtPostalClient" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="bouton">
                            <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter"
                                CssClass="btn btn-primary btn-small" />
                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Annuler" CssClass="btn btn-primary btn-small"
                                CausesValidation="false" />
                        </div>
                    </div>
                </EditItemTemplate>
            </asp:ListView>
            <div class="section">
                <div class="sectionTitre">
                    <asp:Label ID="lblHistoriqueAbonnement" runat="server" Text="Historique des abonnements"></asp:Label>
                    <%--<div class="sectionTitreRight">
        <asp:LinkButton ID="btnHistorique" runat="server" Text="Afficher l'historique" PostBackUrl="~/Page/Client/member_historique.aspx"></asp:LinkButton>
    </div>--%>
                </div>
            </div>
            <asp:ListView ID="lvAbonnement" runat="server" DataSourceID="dsAbonnement" DataKeyNames="idAbonnement">
                <LayoutTemplate>
                    <div class="infoMembre" style="width: 860px;">
                        <div class="titre" style="width: 300px;">
                            <asp:Label ID="lblTitreActivite" runat="server" Text="Nom de l'activité:"></asp:Label>
                        </div>
                        <div class="titre" style="width: 300px;">
                            <asp:Label ID="lblTitreAbonnement" runat="server" Text="Date d'abonnement:"></asp:Label>
                        </div>
                        <div class="titre" style="width: 250px;">
                            <asp:Label ID="lblTitreHoraire" runat="server" Text="Horaire de l'activité:"></asp:Label>
                        </div>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="contenu" style="width: 300px; margin-left: 10px;">
                        <asp:Label ID="lblActivite" runat="server" Text='<%# Eval("GroupeJeu.CoursJeu.nomCours") %>'></asp:Label>
                    </div>
                    <div class="contenu" style="width: 300px;">
                        <asp:Label ID="lblAbonnement" runat="server" Text='<%# Bind("dateAbonnement", "{0:yyyy/MM/dd}") %>'></asp:Label>
                    </div>
                    <div class="contenu" style="width: 250px;">
                        <asp:HiddenField ID="hiddenNoGroupe" runat="server" Value='<%#Eval("Groupe_idGroupe") %>' />
                        <asp:ListView ID="lvHoraire" runat="server" DataKeyNames="idHoraire" DataSourceID="dsHoraire">
                            <LayoutTemplate>
                                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                            </LayoutTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblJourSemaine" runat="server" Text='<%#Eval ("JourSemaineJeu.jourSemaine")+" de " %>'></asp:Label>
                                <asp:Label ID="lblHeureDebut" runat="server" Text='<%#Eval ("heureDebut")+" à " %>'></asp:Label>
                                <asp:Label ID="lblHeureFin" runat="server" Text='<%#Eval ("heureFin") %>'></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:ListView>
                        <br />
                        <asp:EntityDataSource ID="dsHoraire" runat="server" ConnectionString="name=modelCLSContainer"
                            DefaultContainerName="modelCLSContainer" EntitySetName="HoraireJeu" EnableFlattening="False"
                            EnableDelete="false" EnableInsert="false" EnableUpdate="false" Where="it.GroupeJeu_idGroupe = @groupeID"
                            Include="JourSemaineJeu">
                            <WhereParameters>
                                <asp:Parameter Name="groupeID" DbType="Int16" DefaultValue="8" />
                            </WhereParameters>
                        </asp:EntityDataSource>
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <div class="titre" style="margin-left: 20px;">
                        <asp:Label ID="lblNoAbonnement" runat="server" Text="Vous n'avez pas d'abonnement."></asp:Label>
                    </div>
                </EmptyDataTemplate>
            </asp:ListView>
            <div style="width:860px;">
                <asp:DataPager ID="DataPagerProducts" runat="server" PagedControlID="lvAbonnement"
                    PageSize="5">
                    <Fields>
                        <asp:NextPreviousPagerField ShowPreviousPageButton="true" ShowNextPageButton="True" />
                        <asp:NumericPagerField />
                    </Fields>
                </asp:DataPager>
            </div>
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
        <div class="bouton" style="margin-top: 0px;">
            <asp:Button ID="btnRetour" runat="server" Text="Retour membre principal" CssClass="btn btn-primary btn-small"
                PostBackUrl="~/Page/Client/home_member.aspx" />
        </div>
    </div>
    <asp:EntityDataSource ID="dsFamille" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
        EnableDelete="true" EnableInsert="false" EnableUpdate="true" OrderBy="it.idMembre"
        EntityTypeFilter="MembresJeu" Where="(@MembreID = it.idMembre)">
        <WhereParameters>
            <asp:Parameter Name="MembreID" Type="Int32" DefaultValue="0" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsAbonnement" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="AbonnementJeu" EnableFlattening="False"
        EnableDelete="false" EnableInsert="false" EnableUpdate="false" OrderBy="it.idAbonnement DESC"
        Include="GroupeJeu, GroupeJeu.CoursJeu" Where="(@membreID = it.Membres_idMembre)">
        <WhereParameters>
            <asp:Parameter Name="membreID" Type="Int32" DefaultValue="0" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
