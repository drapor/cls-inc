<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="member_description.aspx.vb" Inherits="Page_Client_member_description"
    Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="contenuPage">
        <div class="enteteCategory">
            <div class="enteteTexteBlock">
                <h3>
                    <asp:Label ID="lblNomCours" runat="server" Text=""></asp:Label></h3>
            </div>
            <div class="enteteBanner">
                <asp:Image ID="imgCategory" runat="server" />
            </div>
        </div>
        <div class="section">
            <div class="sectionTitre">
                <asp:Label ID="lblInfoSurLeCours" runat="server" Text="Informations sur le cours"></asp:Label>
            </div>
        </div>
        <br />
        <br />
        <asp:ListView ID="lvCours" runat="server" DataSourceID="dsCours" DataKeyNames="idCours">
            <LayoutTemplate>
                <div class="infoCours">
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="blockInfos">
                    <asp:Label ID="lblTarifTexte" SkinID="lblInfos" runat="server" Text="Tarif: "></asp:Label>
                    <asp:Label ID="lblTarif" runat="server" Text='<%#Eval ("tarif")&"$" %>'></asp:Label><br />
                    <asp:Label ID="lblPeriodeDeCoursText" SkinID="lblInfos" runat="server" Text="Période de cours: "></asp:Label>
                    <asp:Label ID="lblPeriodeDeCours" runat="server" Text='<%# "Du " +((CType(Eval("dateDebutCours"),DateTime)).ToString("D"))+ " au "+((CType(Eval("dateFinCours"),DateTime)).ToString("D"))%>'></asp:Label><br />
                    <asp:Label ID="lblPeriodeInscriptionText" SkinID="lblInfos" runat="server" Text="Période d'inscription: "></asp:Label>
                    <asp:Label ID="lblPeriodeInscription" runat="server" Text='<%# "Du " +((CType(Eval("dateDebutInscription"),DateTime)).ToString("D"))+ " au "+((CType(Eval("dateFinInscription"),DateTime)).ToString("D"))%>'></asp:Label><br />
                    <asp:Label ID="lblCoursPrerequis" SkinID="lblInfos" runat="server" Text="Cours prérequis: "></asp:Label>
                    <asp:Label ID="lblPrerequis" Text='<%# Eval("prerequis") %>' runat="server"></asp:Label><br />
                    <asp:Label ID="lblGroupeAgeTexte" SkinID="lblInfos" runat="server" Text="Groupe d'âge: "></asp:Label>
                    <asp:Label ID="lblGroupeAge" Text='<%# Eval("groupeAgeMin") %>' runat="server"></asp:Label>
                    <asp:Label ID="lblGroupeAgeMod" runat="server" Text='<%# Eval("groupeAgeMod") %>'></asp:Label>
                    <asp:Label ID="lblGroupeAgeMax" runat="server" Text='<%# Eval("groupeAgeMax") %>'></asp:Label>
                    <br />
                    <asp:Label ID="lblAnimateurTexte" SkinID="lblInfos" runat="server" Text="Animateur: "></asp:Label>
                    <asp:Label ID="lblPrenomAnimateur" runat="server" Text='<%# Eval("MembresJeu_Animateur.MembresJeu.prenomMembre ") %>'></asp:Label>
                    <asp:Label ID="lblNomAnimateur" runat="server" Text='<%# Eval("MembresJeu_Animateur.MembresJeu.nomMembre") %>'></asp:Label><br />
                    <asp:Label ID="lblDescription" Text='<%# Eval("description") %>' runat="server"></asp:Label>
                </div>
                <asp:HiddenField ID="hiddenNomCours" Value='<%# Eval("nomCours") %>' runat="server" />
            </ItemTemplate>
        </asp:ListView>
        <asp:ListView ID="lvGroupes" runat="server" DataSourceID="dsGroupes" DataKeyNames="idGroupe"
            OnItemDataBound="lvGroupes_ItemDataBound">
            <LayoutTemplate>
                <div class="infoCours">
                    <div class="section">
                        <div class="se  ctionTitre">
                            <asp:Label ID="lblHoraire" runat="server" Text="Horaires et places disponibles"></asp:Label>
                            <div style="margin-left: 676px; margin-top: 15px;">
                                <asp:Button ID="btnInscriptionListeAttente" runat="server" Text="Inscrivez-moi à la liste d'attente"
                                    CssClass="btn btn-success btnPadding" Visible="True" OnClick="inscriptionListeAttente" /></div>
                        </div>
                    </div>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                </div>
            </LayoutTemplate>
            <ItemTemplate>
                <div class="blockGroupeLigne" style="width: 900px;">
                    <div class="blockGroupe">
                        <asp:Label ID="lblNomGroupe" SkinID="lblInfos" runat="server" Text='<%#Eval ("nomGroupe")+": " %>'></asp:Label>
                    </div>
                    <div class="blockGroupe" style="width: 200px;">
                        <asp:HiddenField ID="hiddenNoGroupe" runat="server" Value='<%#Eval("idGroupe") %>' />
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
                            <EmptyDataTemplate>
                                <asp:Label ID="lblNoSchedule" runat="server" Text="Aucune horaire pour le moment."></asp:Label></EmptyDataTemplate>
                        </asp:ListView>
                        <asp:EntityDataSource ID="dsHoraire" runat="server" ConnectionString="name=modelCLSContainer"
                            DefaultContainerName="modelCLSContainer" EntitySetName="HoraireJeu" EnableFlattening="False"
                            EnableDelete="false" EnableInsert="false" EnableUpdate="false" Where="it.GroupeJeu_idGroupe = @groupeID"
                            Include="JourSemaineJeu">
                            <WhereParameters>
                                <asp:Parameter Name="groupeID" DbType="Int16" DefaultValue="8" />
                            </WhereParameters>
                        </asp:EntityDataSource>
                    </div>
                    <div class="blockGroupe" style="width: 170px;">
                        <asp:Label ID="lblNbPlaceRestant" runat="server" Text="Nombre place restante: "></asp:Label>
                        <asp:Label ID="lblNbPlace" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="blockGroupe">
                        <asp:Button ID="btnJeMinscris" runat="server" Text="Inscription" CssClass="btn btn-small btn-primary"
                            OnClick="inscriptionCours" CommandArgument='<%# Eval("idGroupe") %>' CommandName="inscription" />
                        <asp:Image ID="completeImage" runat="server" ImageUrl="~/App_Themes/Original/img/success.png"
                            Visible="true" Height="22px" Width="22px" />
                        <asp:Label ID="lblGroupeComplet" runat="server" ForeColor="Green" Text="Ce groupe est complet !"
                            Visible="false"></asp:Label>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:Button ID="btnRetour" runat="server" Text="Retour" CssClass="btn btn-primary btnPadding"
            OnClick="retourCategorie" />
    </div>
    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="false" EnableUpdate="True" Include="MembresJeu_Animateur, MembresJeu_Animateur.MembresJeu"
        Where="(it.idCours = @cours)">
        <WhereParameters>
            <asp:Parameter Name="cours" DbType="Int16" DefaultValue="Nothing" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsGroupes" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
        EnableDelete="false" EnableInsert="false" EnableUpdate="false" Where="it.Cours_idCours = @coursID"
        Include="HoraireJeu">
        <WhereParameters>
            <asp:Parameter Name="coursID" DbType="Int16" DefaultValue="Nothing" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
