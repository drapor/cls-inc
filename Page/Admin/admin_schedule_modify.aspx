<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Site.master" CodeFile="admin_schedule_modify.aspx.vb" Inherits="Page_Admin_admin_schedule_modify" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="contenuPage">
        <div class="titlePanier">
            <h3>Modifier les horaires d'un groupe</h3>
            <br />
        </div>

        <div class="contenuStandard" style="width:860px;">
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

            <div class="separateur" style="padding-top:10px;">
                <asp:Image ID="Image1"  runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
            </div>
            <div class="horaireGauche" style="margin-top:15px;">
                        <div class="interieurGaucheHoraire">
                            <div class="formatZone">
                                <asp:Label ID="lblJourSemaine" runat="server" Text="Jour de semaine:"></asp:Label>
                            </div>
                            <br />
                        </div>
                        <div class="interieurDroitHoraire">
                            <div class="formatZone" style="font-size:20px;">
                                <asp:DropDownList ID="ddlHoraire" SkinID="ddlBlue" runat="server" width="120px" DataSourceID="dsHoraireDDL" DataTextField="jourSemaine" DataValueField="idHoraire" appendDataBoundItems="False" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <br />
                        </div>
            </div>
            <asp:ListView ID="lvHoraire" runat="server" DataSourceID="dsHoraire" DataKeyNames="idHoraire" >
                <LayoutTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                </LayoutTemplate>
                <ItemTemplate>
                <div class="horaireGauche">
                        <div class="interieurGaucheHoraire">
                            <div class="formatZone">
                                <asp:Label ID="lblLocal" runat="server" Text="Local:"></asp:Label>
                            </div>
                            <br />     
                        </div>
                        
                        <div class="interieurDroitHoraire">
                            <div class="formatZone">
                                <asp:TextBox ID="txtLocal" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text='<%# Bind("noLocal") %>'  MaxLength="10" Width="50px" CausesValidation="false"></asp:TextBox>
                            </div>
                            <br />          
                        </div>
                        <div class="validationLocal">
                            <asp:RequiredFieldValidator ID="requiredLocal" runat="server" ErrorMessage="No local requis" ControlToValidate="txtLocal" ForeColor="Red" Display="Dynamic" Font-Size="14px"></asp:RequiredFieldValidator>
                            <br />
                        </div>
                </div>
                <div class="horaireDroit" style="margin-top: -30px;">
                        <div class="interieurGaucheHoraire">
                            <div class="formatZone">
                                <asp:Label ID="lblDebut" runat="server" Text="Heure de début:"></asp:Label>
                            </div>
                            <br />
                            <div class="formatZone">
                                <asp:Label ID="lblFin" runat="server" Text="Heure de fin:"></asp:Label>
                            </div>  
                        </div>
                        <div class="interieurDroitHoraire">
                            <div class="formatZone">
                                <asp:TextBox ID="txtDebut" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query" Text='<%# Bind("heureDebut") %>' MaxLength="5" Width="50px"></asp:TextBox>
                            </div>
                            <br />
                            <div class="formatZone">
                                <asp:TextBox ID="txtFin" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text='<%# Bind("heureFin") %>'  MaxLength="5" Width="50px"></asp:TextBox>
                            </div>
                        </div>
                        <div class="validationHoraire">
                            <div class="formatZone" style="font-size:14px;">
                                <asp:RegularExpressionValidator ID="regExDebut" runat="server" ErrorMessage="De 00:00 à 23:59" 
                                ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtDebut" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:CompareValidator ID="compareJourSemaine" runat="server" ErrorMessage="L'heure de début doit être supérieur à l'heure de fin."  ForeColor="Red" Operator="GreaterThan" ControlToValidate="txtFin" ControlToCompare="txtDebut" Display="Dynamic"></asp:CompareValidator>
                                <asp:RequiredFieldValidator ID="RequiredHeureDebut" runat="server" ErrorMessage="Heure de début requise." ControlToValidate="txtDebut" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <br />
                            <div class="formatZone" style="font-size:14px;">
                                <asp:RegularExpressionValidator ID="regExFin" runat="server" ErrorMessage="De 00:00 à 23:59" 
                                ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtFin" ForeColor="Red"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredHeureFin" runat="server" ErrorMessage="Heure de fin requise." ControlToValidate="txtFin" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                </div>

                    <div class="groupeBouton">
                        <div class="boutonGroupeAjout" style="margin-left:650px;">
                            <asp:Button ID="btnModifier" runat="server" commandName="Update" Text="Modifier l'horaire" CssClass="btn btn-primary" Width="130px" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>

        <div class="groupeBouton">
            <div class="boutonGroupeRetour" style="margin-bottom:20px; margin-left:20px;">
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

    <asp:EntityDataSource ID="dsHoraireDDL" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="HoraireJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.idHoraire"
    where="(@groupeID = it.GroupeJeu_idGroupe)">
    <WhereParameters>
        <asp:ControlParameter Name="groupeID" ControlID="ddlNomGroupe" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsHoraire" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="HoraireJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.idHoraire"
    where="(@horaireID = it.idHoraire)">
    <WhereParameters>
        <asp:ControlParameter Name="horaireID" ControlID="ddlHoraire" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

</asp:Content>
