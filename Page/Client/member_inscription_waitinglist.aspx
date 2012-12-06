<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="member_inscription_waitinglist.aspx.vb" Inherits="Page_Client_member_inscription_waitinglist"
    Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="contenuPage">
        <div style="float: right; height: auto; width: auto;">
            <asp:Image ID="checkImage" runat="server" ImageUrl="~/App_Themes/Original/img/icon_check.png"
                Visible="false" Height="20px" Width="20px" />
            <asp:Image ID="failImage" runat="server" ImageUrl="~/App_Themes/Original/img/delete.png"
                Visible="false" Height="20px" Width="20px" />
            <asp:Label ID="lblFelicitation" runat="server" ForeColor="Green" Text="Le cours a été mis à jour avec succès !"
                Visible="false"></asp:Label>
            <asp:Label ID="lblFailure" runat="server" ForeColor="Red" Text="" Visible="True"></asp:Label>
        </div>
        
        <asp:ListView ID="lvMembreInscrire" runat="server" DataSourceID="dsCours" DataKeyNames="idCours">
            <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </LayoutTemplate>
            <ItemTemplate>
                <div class="infoCours">
                    <div class="enteteCategory">
                        <div class="enteteTexteBlockInscription" style="width: 900px;">
                            <h3>
                                <asp:Label ID="lblInscriptionMembreCours" runat="server" Text="Inscription d'un membre pour la liste d'attente du cours de "></asp:Label>
                                <asp:Label ID="course" runat="server" Text='<%#Eval("nomCours") %>'></asp:Label></h3>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        <asp:ListView ID="lvListeAttente" runat="server" DataSourceID="dsListeAttente" DataKeyNames="idListeAttente"
            InsertItemPosition="LastItem">
            <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </LayoutTemplate>
            <InsertItemTemplate>
                <div class="infoCours">
                    <asp:Label ID="lblMembre" runat="server" Text="Membre: "></asp:Label>
                    <asp:DropDownList ID="ddlMembreFamille" runat="server" DataSourceID="dsMembreFamille"
                        AppendDataBoundItems="true" DataValueField="idMembre" DataTextField="prenomMembre" SelectedValue='<%#Bind ("Membres_idMembre") %>'>
                    </asp:DropDownList>
                    <asp:Button ID="btnRegisterMember" runat="server" Text="Inscrire le membre" CssClass="btn btn-primary"
                        CommandName="Insert" />
                        <asp:HiddenField ID="hiddenCoursID" runat="server" Value='<%#Bind ("Cours_idCours") %>' />
                </div>
            </InsertItemTemplate>
            <ItemTemplate>
            </ItemTemplate>
        </asp:ListView>
        <div class="infoCours">
            <asp:Button ID="btnRetour" runat="server" Text="Retour" CssClass="btn btn-primary btnPadding"
                OnClick="retourCategorie" />
        </div>
    </div>
    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="false" EnableUpdate="True" Where="(it.idCours = @cours)">
        <WhereParameters>
            <asp:Parameter Name="cours" DbType="Int16" DefaultValue="Nothing" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsMembreFamille" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
        EnableDelete="false" EnableInsert="false" EnableUpdate="false" Where="it.familleID = @familleID">
        <WhereParameters>
            <asp:Parameter Name="familleID" DbType="Int16" DefaultValue="Nothing" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsListeAttente" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="ListeAttenteJeu" EnableFlattening="False"
        EnableDelete="true" EnableInsert="true" EnableUpdate="true">
    </asp:EntityDataSource>
</asp:Content>
