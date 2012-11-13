<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeFile="admin_schedule_delete.aspx.vb" Inherits="Page_Admin_admin_schedule_delete" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="contenuPage">
        <div class="titlePanier">
            <h3>Supprimer les horaires d'un groupe</h3>
            <br />
        </div>

        <div class="contenuStandard">
            <div class="ligneHoraire">
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
            </div> 
                   
            <asp:ListView ID="lvHoraire" runat="server" DataSourceID="dsHoraire" DataKeyNames="idHoraire">
                <LayoutTemplate>
                    <div class="ligneHoraire" style="font-size:20px; font-weight:bolder; margin-top:20px;">
                        <div class="sectionJourSemaine">
                            <asp:Label ID="lblTitreJourSemaine" runat="server" Text="Jour de la semaine"></asp:Label>
                        </div>
                        <div class="sectionHeureDebut">
                            <asp:Label ID="lblTitreDebut" runat="server" Text="Heure de début"></asp:Label>
                        </div>
                        <div class="sectionHeureFin">
                            <asp:Label ID="lblTitreFin" runat="server" Text="Heure de fin"></asp:Label>
                        </div>
                        <div class="sectionLocal">
                            <asp:Label ID="lblTitreLocal" runat="server" Text="Local"></asp:Label>
                        </div>
                    </div>

                    <div class="separateur">
                        <asp:Image ID="imgSeparateur"  runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
                    </div>

                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />

                    <div class="separateur" style="padding-top:10px;">
                        <asp:Image ID="Image1"  runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
                    </div>
                </LayoutTemplate>

                <ItemTemplate>
                    <div class="ligneHoraire" style="margin-top:20px;">  
                        <div class="sectionJourSemaine">
                            <asp:Label ID="lblJourSemaine" runat="server" Text='<%# Bind("jourSemaine") %>'></asp:Label>
                        </div>
                        <div class="sectionHeureDebut">
                            <asp:Label ID="lblHeureDebut" runat="server" Text='<%# Bind("heureDebut") %>'></asp:Label>
                        </div>
                        <div class="sectionHeureFin">
                            <asp:Label ID="lblHeureFin" runat="server" Text='<%# Bind("heureFin") %>'></asp:Label>
                        </div>
                        <div class="sectionLocal">
                            <asp:Label ID="lblLocal" runat="server" Text='<%# Bind("noLocal") %>'></asp:Label>
                        </div> 
                        <div class="sectionDelete">
                            <asp:ImageButton ID="btnDelete" runat="server"  ImageUrl="~/App_Themes/Original/img/delete.png" Width="19px"  ImageAlign="Middle" ToolTip="Supprimer" CommandName="delete"/>
                        </div>
                    </div>                
                </ItemTemplate>
            </asp:ListView>
        </div>

        <div class="groupeBouton">
            <div class="boutonGroupeRetour" style="margin-bottom:20px;">
                <asp:Button ID="btnRetour" runat="server" Text="Retour page admin" CssClass="btn btn-primary" Width="150px" PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false"/>
            </div>
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