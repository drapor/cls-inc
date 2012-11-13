<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="member_inscription_memberchoice.aspx.vb" Inherits="Page_Client_member_inscription_memberchoice"
    Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="contenuPage">
        <asp:ListView ID="lvMembreInscrire" runat="server" DataSourceID="dsCours" DataKeyNames="idCours">
            <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </LayoutTemplate>
            <ItemTemplate>
                <div class="infoCours">
                    <div class="enteteCategory">
                        <div class="enteteTexteBlockInscription">
                            <h3>
                                <asp:Label ID="lblInscriptionMembreCours" runat="server" Text="Inscription d'un membre pour le cours de "></asp:Label>
                                <asp:Label ID="course" runat="server" Text='<%#Eval("nomCours") %>'></asp:Label></h3>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>



        <asp:ListView ID="lvGroupe" runat="server" DataSourceID="dsGroupes" DataKeyNames="idGroupe">
            <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </LayoutTemplate>
            <ItemTemplate>
                <div class="infoCours">
                    <asp:Label ID="lblGroupe" runat="server" Text="Groupe: "></asp:Label>
                    <asp:Label ID="lblNomGroupe" runat="server" Text='<%#Eval("nomGroupe") %>'></asp:Label>
                </div>
            </ItemTemplate>
        </asp:ListView>

                <div class="infoCours">
                    <asp:Label ID="lblMembre" runat="server" Text="Membre: "></asp:Label>
                    <asp:DropDownList ID="ddlMembreFamille" runat="server" DataSourceID="dsMembreFamille" AppendDataBoundItems="true"
                    DataValueField="idMembre" DataTextField="prenomMembre">
                    </asp:DropDownList>
                    <asp:Button ID="btnRegisterMember" runat="server" Text="Inscrire le membre" CssClass="btn btn-primary" OnClick="inscriptionMembre" />
                </div>


        <asp:Button ID="btnRetour" runat="server" Text="Retour" CssClass="btn btn-primary btnPadding"
            OnClick="retourCategorie" />
    </div>
    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="false" EnableUpdate="True" Where="(it.idCours = @cours)">
        <WhereParameters>
            <asp:Parameter Name="cours" DbType="Int16" DefaultValue="Nothing" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsGroupes" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
        EnableDelete="false" EnableInsert="false" EnableUpdate="false" Where="it.idGroupe = @groupeID">
        <WhereParameters>
            <asp:Parameter Name="groupeID" DbType="Int16" DefaultValue="Nothing" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsMembreFamille" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
        EnableDelete="false" EnableInsert="false" EnableUpdate="false" Where="it.familleID = @familleID">
        <WhereParameters>
            <asp:Parameter Name="familleID" DbType="Int16" DefaultValue="Nothing" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
