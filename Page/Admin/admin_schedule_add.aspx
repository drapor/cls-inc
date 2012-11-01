<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_schedule_add.aspx.vb" Inherits="Page_Admin_admin_group_add" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">
<div class="titlePanier">
<h3>Ajouter un horaire</h3>
<br />
</div>

<div class="contenuStandard">

        <div class="interieurGauche">
            <div class="formatZone">
                <asp:Label ID="lblNomCours" runat="server" Text="Nom du cours:"></asp:Label>
            </div>
            <br />
            <div class="formatZone">
                <asp:Label ID="lblNomGroupe" runat="server" Text="Nom du groupe:"></asp:Label>
            </div>
            <br />
        </div>

        <div class="interieurDroit">
            <div class="formatZone">
                <asp:DropDownList ID="ddlNomCours" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" appendDataBoundItems="False" MaxLength="16" Width="150px" AutoPostBack="True"></asp:DropDownList>
            </div>
            <br />
            <div class="formatZone">
                <asp:DropDownList ID="ddlNomGroupe" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsGroupe" DataTextField="NomGroupe" DataValueField="idGroupe" appendDataBoundItems="False"  MaxLength="16" Width="150px" AutoPostBack="True"></asp:DropDownList>
            </div>
            <br />
        </div>
        
    <asp:ListView ID="lvGroupe" runat="server" DataSourceID="dsHoraire" DataKeyNames="idHoraire" InsertItemPosition="LastItem">
        <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
        </LayoutTemplate>

        <InsertItemTemplate>
            <div class="local">
            <div class="interieurGauche">
                <div class="formatZone">
                    <asp:Label ID="lblLocal" runat="server" Text="Local:"></asp:Label>
                </div>
                <br />
                <br />
                <br />       
            </div>

            <div class="interieurDroit">
                <div class="formatZone">
                    <asp:TextBox ID="txtLocal" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text='<%# Bind("noLocal") %>'  MaxLength="10" Width="50px"></asp:TextBox>
                </div>
                <br />
                <br />
                <br />              
            </div>
            <div class="validationLocal">
                <asp:RequiredFieldValidator ID="requiredLocal" runat="server" ErrorMessage="No local requis" ControlToValidate="txtLocal" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <br />
                <br />
                <br /> 
            </div>
            </div>
            <div class="jourSemaine">
                <div class="formatZone" style="font-size:20px;">
                    <asp:Label ID="lblLundi" runat="server" Text="Lundi"></asp:Label>
                </div>
                <br />
                <div class="interieurGaucheHoraire">
                    <div class="formatZone">
                        <asp:Label ID="lblDebutLundi" runat="server" Text="Heure de début:"></asp:Label>
                    </div>
                    <br />
                    <div class="formatZone">
                        <asp:Label ID="lblFinLundi" runat="server" Text="Heure de fin:"></asp:Label>
                    </div>  
                </div>
                <div class="interieurDroitHoraire">
                    <div class="formatZone">
                    <asp:TextBox ID="txtDebutLundi" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query" Text='<%# Bind("heureDebut") %>' MaxLength="5" Width="50px"></asp:TextBox>
                    </div>
                    <br />
                    <div class="formatZone">
                        <asp:TextBox ID="txtFinLundi" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text='<%# Bind("heureFin") %>'  MaxLength="5" Width="50px"></asp:TextBox>
                    </div>
                </div>
            </div>

            <div class="validationHoraire">
            </div>

            <div class="jourSemaine">
                <div class="formatZone" style="font-size:20px;">
                    <asp:Label ID="lblMardi" runat="server" Text="Mardi"></asp:Label>
                </div>
                <br />
                <div class="interieurGaucheHoraire">
                    <div class="formatZone">
                        <asp:Label ID="lblDebutMardi" runat="server" Text="Heure de début:"></asp:Label>
                    </div>
                    <br />
                    <div class="formatZone">
                        <asp:Label ID="lblFinMardi" runat="server" Text="Heure de fin:"></asp:Label>
                    </div>  
                </div>
                <div class="interieurDroitHoraire">
                    <div class="formatZone">
                    <asp:TextBox ID="txtDebutMardi" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query" Text='<%# Bind("heureDebut") %>' MaxLength="5" Width="50px"></asp:TextBox>
                    </div>
                    <br />
                    <div class="formatZone">
                        <asp:TextBox ID="txtFinMardi" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text='<%# Bind("heureFin") %>'  MaxLength="5" Width="50px"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="groupeBouton">
                <div class="boutonGroupeRetour">
                        <asp:Button ID="btnRetour" runat="server" Text="Retour" CssClass="btn btn-primary" Width="120px" />
                    </div>
                <div class="boutonGroupeAjout">
                    <asp:Button ID="btnConfirme" runat="server" commandName="Insert" Text="Confirmer" CssClass="btn btn-primary" Width="120px" />
                </div>
            </div>
        </InsertItemTemplate>

        <ItemTemplate>            
        </ItemTemplate>
    </asp:ListView>
</div>
</div>

    <asp:EntityDataSource ID="dsGroupe" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.idGroupe"
    where="(@coursID = it.Cours_idCours)">
    <WhereParameters>
        <asp:ControlParameter Name="coursID" ControlID="ddlNomCours" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.nomCours">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsHoraire" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="HoraireJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.idHoraire">
    </asp:EntityDataSource>

</asp:Content>
