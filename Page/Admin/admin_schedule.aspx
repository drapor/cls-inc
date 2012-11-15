<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_schedule.aspx.vb"
    Inherits="Page_Admin_admin_group_add" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="contenuPage">
        <div class="entetePage">
            <div class="menuPageGauche" style="margin-top: 10px;">
                <asp:Label ID="lblEntete" runat="server" Text="Opérations horaires" Font-Size="32px"
                    Font-Bold="true" />
            </div>
            <div class="menuPageDroit">
                <div class="boutonEntete" style="margin-right: 10px;">
                    <asp:Button ID="btnAjouter" runat="server" OnClick="actionAjout" Text="Ajouter" CssClass="btn btn-primary"
                        Width="150px" Height="40px" CausesValidation="false" />
                </div>
                <div class="boutonEntete" style="margin-right: 10px;">
                    <asp:Button ID="btnModifier" runat="server" OnClick="actionModifie" Text="Modifier"
                        CssClass="btn btn-primary" Width="150px" Height="40px" CausesValidation="false" />
                </div>
                <div class="boutonEntete" style="margin-right: 10px;">
                    <asp:Button ID="btnSupprimer" runat="server" OnClick="actionSupprime" Text="Supprimer"
                        CssClass="btn btn-primary" Width="150px" Height="40px" CausesValidation="false" />
                </div>
            </div>
        </div>
        <asp:MultiView ID="MVPrincipal" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewAjout" runat="server">
                <div class="contenuStandard">
                    <asp:Label ID="lblTitreAjout" runat="server" Text="Ajouter un horaire" Font-Size="24px"
                        Font-Bold="true" />
                    <br />
                    <br />
                    <br />
                    <div class="ligneHoraire">
                        <div class="interieurGaucheHoraire">
                            <div class="formatZone">
                                <asp:Label ID="lblNomCoursAjout" runat="server" Text="Nom du cours:"></asp:Label>
                            </div>
                            <br />
                            <div class="formatZone">
                                <asp:Label ID="lblNomGroupeAjout" runat="server" Text="Nom du groupe:"></asp:Label>
                            </div>
                            <br />
                        </div>
                        <div class="interieurDroitHoraire">
                            <div class="formatZone">
                                <asp:DropDownList ID="ddlNomCoursAjout" SkinID="ddlBlue" runat="server" CssClass="search-query"
                                    DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" AppendDataBoundItems="False"
                                    MaxLength="16" Width="150px" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <br />
                            <div class="formatZone">
                                <asp:DropDownList ID="ddlNomGroupeAjout" SkinID="ddlBlue" runat="server" CssClass="search-query"
                                    DataSourceID="dsGroupeAjout" DataTextField="NomGroupe" DataValueField="idGroupe"
                                    AppendDataBoundItems="False" MaxLength="16" Width="150px" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <br />
                        </div>
                        <div class="separateur" style="padding-top: 10px;">
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
                        </div>
                    </div>
                    <asp:ListView ID="lvAjout" runat="server" DataSourceID="dsHoraire" DataKeyNames="idHoraire"
                        InsertItemPosition="LastItem">
                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </LayoutTemplate>
                        <InsertItemTemplate>
                            <div class="horaireGauche" style="margin-top: 15px;">
                                <div class="interieurGaucheHoraire">
                                    <div class="formatZone">
                                        <asp:Label ID="lblJourSemaine" runat="server" Text="Jour de semaine:"></asp:Label>
                                    </div>
                                    <br />
                                </div>
                                <div class="interieurDroitHoraire">
                                    <div class="formatZone" style="font-size: 20px;">
                                        <asp:DropDownList ID="DropDownList1" SkinID="ddlBlue" runat="server" Width="120px"
                                            SelectedValue='<%# Bind("jourSemaine") %>'>
                                            <asp:ListItem Text="Lundi" Value="Lundi" Selected="true"></asp:ListItem>
                                            <asp:ListItem Text="Mardi" Value="Mardi"></asp:ListItem>
                                            <asp:ListItem Text="Mercredi" Value="Mercredi"></asp:ListItem>
                                            <asp:ListItem Text="Jeudi" Value="Jeudi"></asp:ListItem>
                                            <asp:ListItem Text="Vendredi" Value="Vendredi"></asp:ListItem>
                                            <asp:ListItem Text="Samedi" Value="Samedi"></asp:ListItem>
                                            <asp:ListItem Text="Dimanche" Value="Dimanche"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <br />
                                </div>
                                <div class="horaireGauche">
                                    <div class="interieurGaucheHoraire">
                                        <div class="formatZone">
                                            <asp:Label ID="lblLocal" runat="server" Text="Local:"></asp:Label>
                                        </div>
                                        <br />
                                    </div>
                                    <div class="interieurDroitHoraire">
                                        <div class="formatZone">
                                            <asp:TextBox ID="txtLocal" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query"
                                                Text='<%# Bind("noLocal") %>' MaxLength="10" Width="50px" CausesValidation="false"></asp:TextBox>
                                        </div>
                                        <br />
                                    </div>
                                    <div class="validationLocal">
                                        <asp:RequiredFieldValidator ID="requiredLocal" runat="server" ErrorMessage="No local requis"
                                            ControlToValidate="txtLocal" ForeColor="Red" Display="Dynamic" Font-Size="14px"></asp:RequiredFieldValidator>
                                        <br />
                                    </div>
                                </div>
                            </div>
                            <div class="horaireDroit" style="margin-top: 15px;">
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
                                        <asp:TextBox ID="txtDebut" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query"
                                            Text='<%# Bind("heureDebut") %>' MaxLength="5" Width="50px"></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="formatZone">
                                        <asp:TextBox ID="txtFin" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query"
                                            Text='<%# Bind("heureFin") %>' MaxLength="5" Width="50px"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="validationHoraire">
                                    <div class="formatZone" style="font-size: 14px;">
                                        <asp:RegularExpressionValidator ID="regExDebut" runat="server" ErrorMessage="De 00:00 à 23:59"
                                            ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtDebut"
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                        <asp:CompareValidator ID="compareJourSemaine" runat="server" ErrorMessage="L'heure de début doit être supérieur à l'heure de fin."
                                            ForeColor="Red" Operator="GreaterThan" ControlToValidate="txtFin" ControlToCompare="txtDebut"
                                            Display="Dynamic"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredHeureDebut" runat="server" ErrorMessage="Heure de début requise."
                                            ControlToValidate="txtDebut" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <br />
                                    <div class="formatZone" style="font-size: 14px;">
                                        <asp:RegularExpressionValidator ID="regExFin" runat="server" ErrorMessage="De 00:00 à 23:59"
                                            ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtFin"
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredHeureFin" runat="server" ErrorMessage="Heure de fin requise."
                                            ControlToValidate="txtFin" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="groupeBouton">
                                <div class="boutonGroupeAjout" style="margin-left: 520px;">
                                    <asp:Button ID="btnConfirme" runat="server" CommandName="Insert" Text="Ajouter l'horaire"
                                        CssClass="btn btn-primary" Width="130px" />
                                </div>
                            </div>
                        </InsertItemTemplate>
                        <ItemTemplate>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </asp:View>
            <asp:View ID="viewModifie" runat="server">
                <div class="contenuStandard">
                    <asp:Label ID="lblTitreModifie" runat="server" Text="Modifier un horaire" Font-Size="24px"
                        Font-Bold="true" />
                    <br />
                    <br />
                    <br />
                    <div class="ligneHoraire">
                        <div class="interieurGauche">
                            <div class="formatZone">
                                <asp:Label ID="lblNomCoursModifie" runat="server" Text="Nom du cours:"></asp:Label>
                            </div>
                            <br />
                            <div class="formatZone">
                                <asp:Label ID="lblNomGroupeModifie" runat="server" Text="Nom du groupe:"></asp:Label>
                            </div>
                            <br />
                        </div>
                        <div class="interieurDroit">
                            <div class="formatZone">
                                <asp:DropDownList ID="ddlNomCoursModifie" SkinID="ddlBlue" runat="server" CssClass="search-query"
                                    DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" AppendDataBoundItems="False"
                                    MaxLength="16" Width="150px" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <br />
                            <div class="formatZone">
                                <asp:DropDownList ID="ddlNomGroupeModifie" SkinID="ddlBlue" runat="server" CssClass="search-query"
                                    DataSourceID="dsGroupeModifie" DataTextField="NomGroupe" DataValueField="idGroupe"
                                    AppendDataBoundItems="False" MaxLength="16" Width="150px" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <br />
                        </div>
                    </div>
                    <div class="separateur" style="padding-top: 10px;">
                        <asp:Image ID="imgSeparateur" runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
                    </div>
                    <div class="horaireGauche" style="margin-top: 15px;">
                        <div class="interieurGaucheHoraire">
                            <div class="formatZone">
                                <asp:Label ID="lblJourSemaine" runat="server" Text="Jour de semaine:"></asp:Label>
                            </div>
                            <br />
                        </div>
                        <div class="interieurDroitHoraire">
                            <div class="formatZone" style="font-size: 20px;">
                                <asp:DropDownList ID="ddlHoraire" SkinID="ddlBlue" runat="server" Width="120px" DataSourceID="dsHoraireDDL"
                                    DataTextField="jourSemaine" DataValueField="idHoraire" AppendDataBoundItems="False"
                                    AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <br />
                        </div>
                    </div>
                    <asp:ListView ID="lvModifie" runat="server" DataSourceID="dsHoraireModifie" DataKeyNames="idHoraire">
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
                                        <asp:TextBox ID="txtLocal" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query"
                                            Text='<%# Bind("noLocal") %>' MaxLength="10" Width="50px" CausesValidation="false"></asp:TextBox>
                                    </div>
                                    <br />
                                </div>
                                <div class="validationLocal">
                                    <asp:RequiredFieldValidator ID="requiredLocal" runat="server" ErrorMessage="No local requis"
                                        ControlToValidate="txtLocal" ForeColor="Red" Display="Dynamic" Font-Size="14px"></asp:RequiredFieldValidator>
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
                                        <asp:TextBox ID="txtDebut" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query"
                                            Text='<%# Bind("heureDebut") %>' MaxLength="5" Width="50px"></asp:TextBox>
                                    </div>
                                    <br />
                                    <div class="formatZone">
                                        <asp:TextBox ID="txtFin" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query"
                                            Text='<%# Bind("heureFin") %>' MaxLength="5" Width="50px"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="validationHoraire">
                                    <div class="formatZone" style="font-size: 14px;">
                                        <asp:RegularExpressionValidator ID="regExDebut" runat="server" ErrorMessage="De 00:00 à 23:59"
                                            ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtDebut"
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                        <asp:CompareValidator ID="compareJourSemaine" runat="server" ErrorMessage="L'heure de début doit être supérieur à l'heure de fin."
                                            ForeColor="Red" Operator="GreaterThan" ControlToValidate="txtFin" ControlToCompare="txtDebut"
                                            Display="Dynamic"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator ID="RequiredHeureDebut" runat="server" ErrorMessage="Heure de début requise."
                                            ControlToValidate="txtDebut" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                    <br />
                                    <div class="formatZone" style="font-size: 14px;">
                                        <asp:RegularExpressionValidator ID="regExFin" runat="server" ErrorMessage="De 00:00 à 23:59"
                                            ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtFin"
                                            ForeColor="Red"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="RequiredHeureFin" runat="server" ErrorMessage="Heure de fin requise."
                                            ControlToValidate="txtFin" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                            <div class="groupeBouton">
                                <div class="boutonGroupeAjout" style="margin-left: 650px;">
                                    <asp:Button ID="btnModifier" runat="server" CommandName="Update" Text="Modifier l'horaire"
                                        CssClass="btn btn-primary" Width="130px" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </asp:View>
            <asp:View ID="viewSupprime" runat="server">
                <div class="contenuStandard">
                    <asp:Label ID="lblTitreSupprime" runat="server" Text="Supprimer un horaire" Font-Size="24px"
                        Font-Bold="true" />
                    <br />
                    <br />
                    <br />
                    <div class="ligneHoraire">
                        <div class="interieurGauche">
                            <div class="formatZone">
                                <asp:Label ID="lblNomCoursSupprime" runat="server" Text="Nom du cours:"></asp:Label>
                            </div>
                            <br />
                            <div class="formatZone">
                                <asp:Label ID="lblNomGroupeSupprime" runat="server" Text="Nom du groupe:"></asp:Label>
                            </div>
                            <br />
                        </div>
                        <div class="interieurDroit">
                            <div class="formatZone">
                                <asp:DropDownList ID="ddlNomCoursSupprime" SkinID="ddlBlue" runat="server" CssClass="search-query"
                                    DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" AppendDataBoundItems="False"
                                    MaxLength="16" Width="150px" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <br />
                            <div class="formatZone">
                                <asp:DropDownList ID="ddlNomGroupeSupprime" SkinID="ddlBlue" runat="server" CssClass="search-query"
                                    DataSourceID="dsGroupeSupprime" DataTextField="NomGroupe" DataValueField="idGroupe"
                                    AppendDataBoundItems="False" MaxLength="16" Width="150px" AutoPostBack="True">
                                </asp:DropDownList>
                            </div>
                            <br />
                        </div>
                    </div>
                    <asp:ListView ID="lvSupprime" runat="server" DataSourceID="dsHoraireSupprime" DataKeyNames="idHoraire">
                        <LayoutTemplate>
                            <div class="ligneHoraire" style="font-size: 20px; font-weight: bolder; margin-top: 20px;">
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
                                <asp:Image ID="imgSeparateur1" runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
                            </div>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                            <div class="separateur" style="padding-top: 10px;">
                                <asp:Image ID="imgSeparateur2" runat="server" ImageUrl="~/App_Themes/Original/img/Separateur.png" />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="ligneHoraire" style="margin-top: 20px;">
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
                                    <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/App_Themes/Original/img/delete.png"
                                        Width="19px" ImageAlign="Middle" ToolTip="Supprimer" CommandName="delete" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </asp:View>
        </asp:MultiView>
        <div class="groupeBouton">
            <div class="boutonGroupeRetour" style="margin-bottom: 20px;">
                <asp:Button ID="btnRetour" runat="server" Text="Retour page admin" CssClass="btn btn-primary"
                    Width="150px" PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false" />
            </div>
        </div>
    </div>
    <asp:EntityDataSource ID="dsGroupeAjout" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.idGroupe"
        Where="(@coursID = it.Cours_idCours)">
        <WhereParameters>
            <asp:ControlParameter Name="coursID" ControlID="ddlNomCoursAjout" PropertyName="SelectedValue"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsGroupeModifie" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.idGroupe"
        Where="(@coursID = it.Cours_idCours)">
        <WhereParameters>
            <asp:ControlParameter Name="coursID" ControlID="ddlNomCoursModifie" PropertyName="SelectedValue"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsGroupeSupprime" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.idGroupe"
        Where="(@coursID = it.Cours_idCours)">
        <WhereParameters>
            <asp:ControlParameter Name="coursID" ControlID="ddlNomCoursSupprime" PropertyName="SelectedValue"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.nomCours">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsHoraire" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="HoraireJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.idHoraire">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsHoraireDDL" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="HoraireJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.idHoraire"
        Where="(@groupeID = it.GroupeJeu_idGroupe)">
        <WhereParameters>
            <asp:ControlParameter Name="groupeID" ControlID="ddlNomGroupeModifie" PropertyName="SelectedValue"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsHoraireModifie" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="HoraireJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.idHoraire"
        Where="(@horaireID = it.idHoraire)">
        <WhereParameters>
            <asp:ControlParameter Name="horaireID" ControlID="ddlHoraire" PropertyName="SelectedValue"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsHoraireSupprime" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="HoraireJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.idHoraire"
        Where="(@groupeID = it.GroupeJeu_idGroupe)">
        <WhereParameters>
            <asp:ControlParameter Name="groupeID" ControlID="ddlNomGroupeSupprime" PropertyName="SelectedValue"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
</asp:Content>
