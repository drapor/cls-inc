<%@ Page Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master" AutoEventWireup="false"
    CodeFile="admin_schedule.aspx.vb" Inherits="Page_Admin_admin_schedule" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="Server">
    <asp:Label ID="lblTitreAjout" runat="server" Text="Opérations sur les horaires" Font-Size="24px"
        Font-Bold="true" />
    <br />
    <br />
    <br />
    <div class="horaireGauche">
        <div class="interieurGaucheHoraire">
            <div class="formatZone">
                <asp:Label ID="lblNomCours" runat="server" Text="Nom du cours:"></asp:Label>
            </div>
            <br />
            <div class="formatZone">
                <asp:Label ID="lblNomGroupe" runat="server" Text="Nom du groupe:"></asp:Label>
            </div>
            <br />
        </div>
        <div class="interieurDroitHoraire">
            <div class="formatZone">
                <asp:DropDownList ID="ddlNomCours" SkinID="ddlBlue" runat="server" CssClass="search-query"
                    DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" AppendDataBoundItems="False"
                    MaxLength="16" Width="150px" AutoPostBack="True">
                </asp:DropDownList>
            </div>
            <br />
            <div class="formatZone">
                <asp:DropDownList ID="ddlNomGroupe" SkinID="ddlBlue" runat="server" CssClass="search-query"
                    DataSourceID="dsGroupe" DataTextField="NomGroupe" DataValueField="idGroupe"
                    AppendDataBoundItems="False" MaxLength="16" Width="150px" AutoPostBack="True">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <asp:GridView ID="listeHoraire" runat="server" DataSourceID="dsHoraire" DataKeyNames="idHoraire"
        AutoGenerateColumns="False" AlternatingRowStyle-BackColor="#8c8cde" AlternatingRowStyle-ForeColor="#FFFFFF"
        CssClass="gridView" ShowFooter="true">
        <Columns>
            <asp:TemplateField ShowHeader="True">
                <ItemTemplate>
                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="edit" Text="Modifier" ForeColor="Black"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lbUpdate" runat="server" CommandName="update" Text="Mise à jour"
                        CausesValidation="true" ValidationGroup="horaire"></asp:LinkButton>
                    <asp:LinkButton ID="lbcancel" runat="server" CommandName="Cancel" Text="Annuler"></asp:LinkButton>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="lbInsert" runat="server" OnClick="actionAjout" ForeColor="#1800B8"
                        Font-Bold="true" Font-Size="18px" Text="Nouveau" CausesValidation="true" ValidationGroup="horaireAjout"></asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Jour de la semaine">
                <ItemTemplate>
                    <asp:Label ID="lblJoursemaine" runat="server" Text='<%# eval("JourSemaineJeu.jourSemaine") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList ID="DDLSemaine" DataSourceID="dsJourSemaine" runat="server" Width="120px" SelectedValue='<%# Bind("JourSemaine_idSemaine") %>'
                        DataTextField="jourSemaine" DataValueField="idSemaine" AppendDataBoundItems="False">
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:DropDownList ID="ddlSemaineAjout" DataSourceID="dsJourSemaine" runat="server" Width="120px" DataTextField="jourSemaine" DataValueField="idSemaine" AppendDataBoundItems="False">
                    </asp:DropDownList>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Heure de début">
                <ItemTemplate>
                    <asp:Label ID="lblDebut" runat="server" Text='<%# eval("heureDebut") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtDebut" runat="server" Text='<%# Bind("heureDebut") %>' Width="50px"
                        MaxLength="5"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regExDebut" runat="server" ErrorMessage="* De 00:00 à 23:59"
                        ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtDebut"
                        ForeColor="Red" ValidationGroup="horaire">*</asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="compareJourSemaine" runat="server" ErrorMessage="* L'heure de début doit être supérieur à l'heure de fin."
                        ForeColor="Red" Operator="GreaterThan" ControlToValidate="txtFin" ControlToCompare="txtDebut"
                        Display="Dynamic" ValidationGroup="horaire">*</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredHeureDebut" runat="server" ErrorMessage="* Heure de début requise."
                        ControlToValidate="txtDebut" ForeColor="Red" Display="Dynamic" ValidationGroup="horaire">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtDebutAjout" runat="server" Text="" Width="50px" MaxLength="5"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regExDebut" runat="server" ErrorMessage="* De 00:00 à 23:59"
                        ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtDebutAjout"
                        ForeColor="Red" ValidationGroup="horaireAjout">*</asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="compareJourSemaine" runat="server" ErrorMessage="* L'heure de début doit être supérieur à l'heure de fin."
                        ForeColor="Red" Operator="GreaterThan" ControlToValidate="txtFinAjout" ControlToCompare="txtDebutAjout"
                        Display="Dynamic" ValidationGroup="horaireAjout">*</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredHeureDebut" runat="server" ErrorMessage="* Heure de début requise."
                        ControlToValidate="txtDebutAjout" ForeColor="Red" Display="Dynamic" ValidationGroup="horaireAjout">*</asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Heure de fin">
                <ItemTemplate>
                    <asp:Label ID="lblFin" runat="server" Text='<%# eval("heureFin") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtFin" runat="server" Text='<%# Bind("heureFin") %>' Width="50px"
                        MaxLength="5"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regExFin" runat="server" ErrorMessage="* De 00:00 à 23:59"
                        ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtFin"
                        ForeColor="Red" ValidationGroup="horaire">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredHeureFin" runat="server" ErrorMessage="* Heure de fin requise."
                        ControlToValidate="txtFin" ForeColor="Red" Display="Dynamic" ValidationGroup="horaire">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtFinAjout" runat="server" Text="" Width="50px" MaxLength="5"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regExFin" runat="server" ErrorMessage="* De 00:00 à 23:59"
                        ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtFinAjout"
                        ForeColor="Red" ValidationGroup="horaireAjout">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredHeureFin" runat="server" ErrorMessage="* Heure de fin requise."
                        ControlToValidate="txtFinAjout" ForeColor="Red" Display="Dynamic" ValidationGroup="horaireAjout">*</asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="No local">
                <ItemTemplate>
                    <asp:Label ID="lblLocal" runat="server" Text='<%# eval("noLocal") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtLocal" runat="server" Text='<%# Bind("noLocal") %>' Width="50px"
                        MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredLocal" runat="server" ErrorMessage="* No local requis"
                        ControlToValidate="txtLocal" ForeColor="Red" Display="Dynamic" Font-Size="14px"
                        ValidationGroup="horaire">*</asp:RequiredFieldValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtLocalAjout" runat="server" Text="" Width="50px" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredLocal" runat="server" ErrorMessage="* No local requis"
                        ControlToValidate="txtLocalAjout" ForeColor="Red" Display="Dynamic" Font-Size="14px"
                        ValidationGroup="horaireAjout">*</asp:RequiredFieldValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="False" Visible="false" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btngvdelete" runat="server" OnClientClick="return confirm('Voulez-vous vraiment supprimer cet horaire?');"
                        CommandName="Delete" ForeColor="Red" Font-Bold="true" Text="Supprimer">
                    </asp:LinkButton>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="lbCancel" runat="server" CommandName="Cancel" Text="Annuler"></asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
        </Columns>
        <EmptyDataTemplate>
            <table cellpadding="0" style="border-collapse: collapse;">
                <tr>
                    <th scope="col">
                        
                    </th>
                    <th scope="col">
                        Jour de la semaine
                    </th>
                    <th scope="col">
                        Heure de début
                    </th>
                    <th scope="col">
                        Heure de Fin
                    </th>
                    <th scope="col">
                        No Local
                    </th>
                    <th scope="col">

                    </th>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="lbInsert" runat="server" OnClick="actionAjout" ForeColor="#1800B8"
                        Font-Bold="true" Font-Size="18px" Text="Nouveau" CausesValidation="true" ValidationGroup="horaireAjout"></asp:LinkButton>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlSemaineAjout" DataSourceID="dsJourSemaine" runat="server" Width="120px"
                            DataTextField="jourSemaine" DataValueField="idSemaine" AppendDataBoundItems="False">
                    </asp:DropDownList>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDebutAjout" runat="server" Text="" Width="50px" MaxLength="5"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regExDebut" runat="server" ErrorMessage="* De 00:00 à 23:59"
                        ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtDebutAjout"
                        ForeColor="Red" ValidationGroup="horaireAjout">*</asp:RegularExpressionValidator>
                    <asp:CompareValidator ID="compareJourSemaine" runat="server" ErrorMessage="* L'heure de début doit être supérieur à l'heure de fin."
                        ForeColor="Red" Operator="GreaterThan" ControlToValidate="txtFinAjout" ControlToCompare="txtDebutAjout"
                        Display="Dynamic" ValidationGroup="horaireAjout">*</asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="RequiredHeureDebut" runat="server" ErrorMessage="* Heure de début requise."
                        ControlToValidate="txtDebutAjout" ForeColor="Red" Display="Dynamic" ValidationGroup="horaireAjout">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFinAjout" runat="server" Text="" Width="50px" MaxLength="5"></asp:TextBox>
                    <asp:RegularExpressionValidator ID="regExFin" runat="server" ErrorMessage="* De 00:00 à 23:59"
                        ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtFinAjout"
                        ForeColor="Red" ValidationGroup="horaireAjout">*</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="RequiredHeureFin" runat="server" ErrorMessage="* Heure de fin requise."
                        ControlToValidate="txtFinAjout" ForeColor="Red" Display="Dynamic" ValidationGroup="horaireAjout">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:TextBox ID="txtLocalAjout" runat="server" Text="" Width="50px" MaxLength="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredLocal" runat="server" ErrorMessage="* No local requis"
                        ControlToValidate="txtLocalAjout" ForeColor="Red" Display="Dynamic" Font-Size="14px"
                        ValidationGroup="horaireAjout">*</asp:RequiredFieldValidator>
                    </td>
                    <td>
                        <asp:LinkButton ID="lbCancel" runat="server" CommandName="Cancel" Text="Annuler"></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </EmptyDataTemplate>
    </asp:GridView>
    <br />
    <div class="validationListe">
        <asp:ValidationSummary ID="ValidationInfo" ValidationGroup="horaire" DisplayMode="List"
            ForeColor="Red" runat="server" />
    </div>
    <div class="validationListe">
        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="horaireAjout" DisplayMode="List"
            ForeColor="Red" runat="server" />
    </div>
    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.nomCours">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsGroupe" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.idGroupe"
        Where="(@coursID = it.Cours_idCours)">
        <WhereParameters>
            <asp:ControlParameter Name="coursID" ControlID="ddlNomCours" PropertyName="SelectedValue"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsHoraire" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="HoraireJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" include="JourSemaineJeu" OrderBy="it.JourSemaine_idSemaine"
        Where="(@groupeID = it.GroupeJeu_idGroupe)">
        <WhereParameters>
            <asp:ControlParameter Name="groupeID" ControlID="ddlNomGroupe" PropertyName="SelectedValue"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsJourSemaine" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="JourSemaineJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.idSemaine">
    </asp:EntityDataSource>
</asp:Content>
