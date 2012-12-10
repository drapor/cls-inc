<%@ Page Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master" AutoEventWireup="false"
    CodeFile="admin_schedule.aspx.vb" Inherits="Page_Admin_admin_schedule" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="Server">
    <div style="float: right; height: auto; width: auto;">
        <asp:Image ID="checkImage" runat="server" ImageUrl="~/App_Themes/Original/img/icon_check.png"
            Visible="false" Height="20px" Width="20px" />
        <asp:Image ID="failImage" runat="server" ImageUrl="~/App_Themes/Original/img/delete.png"
            Visible="false" Height="20px" Width="20px" />
        <asp:Label ID="lblFelicitation" runat="server" ForeColor="Green" Text="Le cours a été mis à jour avec succès !"
            Visible="false"></asp:Label>
        <asp:Label ID="lblFailure" runat="server" ForeColor="Red" Text="" Visible="True"></asp:Label>
    </div>
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
                    MaxLength="16" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="resetLabel">
                </asp:DropDownList>
            </div>
            <br />
            <div class="formatZone">
                <asp:DropDownList ID="ddlNomGroupe" SkinID="ddlBlue" runat="server" CssClass="search-query"
                    DataSourceID="dsGroupe" DataTextField="NomGroupe" DataValueField="idGroupe" AppendDataBoundItems="False"
                    MaxLength="16" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="resetLabel">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <div style="width: 100%;">
        <asp:ListView ID="lvHoraire" runat="server" DataSourceID="dsHoraire" DataKeyNames="idHoraire"
            InsertItemPosition="LastItem" ItemPlaceholderID="itemPlaceHolder">
            <LayoutTemplate>
                <table align="center" style="width: 100%; border: 1px solid #000000; font-weight: bolder;">
                    <tr style="background-color: #1800B8; color: White; font-size: 16px;">
                        <th style="border: 1px solid #000000; width: 22%;">
                        </th>
                        <th style="border: 1px solid #000000; width: 20%; padding: 5px;">
                            <asp:Label ID="lblTitreSemaine" runat="server" Text="Jour semaine"></asp:Label>
                        </th>
                        <th style="border: 1px solid #000000; width: 19%;">
                            <asp:Label ID="lblTitreDebut" runat="server" Text="Heure de début"></asp:Label>
                        </th>
                        <th style="border: 1px solid #000000; width: 15%;">
                            <asp:Label ID="lblTitreFin" runat="server" Text="Heure de fin"></asp:Label>
                        </th>
                        <th style="border: 1px solid #000000; width: 14%;">
                            <asp:Label ID="lblTitreLocal" runat="server" Text="No de local"></asp:Label>
                        </th>
                        <th style="border: 1px solid #000000; width: 10%;">
                        </th>
                    </tr>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr align="center" class="<%# GetCssName(Container) %>">
                    <td style="border: 1px solid #000000; width: 22%; height: 50px;">
                        <asp:LinkButton ID="btnModifier" runat="server" Text="Modifier" ForeColor="Black"
                            CommandName="Edit" OnClick="resetLabel"></asp:LinkButton>
                    </td>
                    <td style="border: 1px solid #000000; width: 20%;">
                        <asp:Label ID="lblJourSemaine" runat="server" Text='<%# eval("JourSemaineJeu.jourSemaine") %>'></asp:Label>
                    </td>
                    <td style="border: 1px solid #000000; width: 19%;">
                        <asp:Label ID="lblDebut" runat="server" Text='<%# eval("heureDebut") %>'></asp:Label>
                    </td>
                    <td style="border: 1px solid #000000; width: 15%;">
                        <asp:Label ID="lblFin" runat="server" Text='<%# eval("heureFin") %>'></asp:Label>
                    </td>
                    <td style="border: 1px solid #000000; width: 14%;">
                        <asp:Label ID="lblLocal" runat="server" Text='<%# eval("noLocal") %>'></asp:Label>
                    </td>
                    <td style="border: 1px solid #000000; width: 10%;">
                        <asp:LinkButton ID="btnSupprime" runat="server" Text="Supprimer" CommandName="Delete"
                            ForeColor="Red"></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <InsertItemTemplate>
                <tr align="center">
                    <td style="border: 1px solid #000000; width: 22%;">
                        <asp:LinkButton ID="btnAjout" runat="server" Text="Ajouter un horaire" CommandName="Insert"
                            ValidationGroup="horaireAjout"></asp:LinkButton>
                    </td>
                    <td style="border: 1px solid #000000; width: 20%; padding-top: 10px;">
                        <asp:DropDownList ID="ddlSemaine" DataSourceID="dsJourSemaine" runat="server" Width="120px"
                            SelectedValue='<%# Bind("JourSemaine_idSemaine") %>' DataTextField="jourSemaine"
                            DataValueField="idSemaine" AppendDataBoundItems="False">
                        </asp:DropDownList>
                    </td>
                    <td style="border: 1px solid #000000; width: 19%; padding-top: 10px;">
                        <asp:TextBox ID="txtDebutAjout" runat="server" Text='<%# Bind("heureDebut") %>' Width="40px"
                            MaxLength="5"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regExDebut" runat="server" ErrorMessage="* De 00:00 à 23:59"
                            ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtDebutAjout"
                            ForeColor="Red" ValidationGroup="horaireAjout">*</asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="compareJourSemaine" runat="server" ErrorMessage="* L'heure de début doit être supérieur à l'heure de fin."
                            ForeColor="Red" Operator="GreaterThan" ControlToValidate="txtFinAjout" ControlToCompare="txtDebutAjout"
                            Display="Dynamic" ValidationGroup="horaireAjout">*</asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredHeureDebut" runat="server" ErrorMessage="* Heure de début requise."
                            ControlToValidate="txtDebutAjout" ForeColor="Red" Display="Dynamic" ValidationGroup="horaireAjout">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="border: 1px solid #000000; width: 15%; padding-top: 10px;">
                        <asp:TextBox ID="txtFinAjout" runat="server" Text='<%# Bind("heureFin") %>' Width="40px"
                            MaxLength="5"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regExFin" runat="server" ErrorMessage="* De 00:00 à 23:59"
                            ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtFinAjout"
                            ForeColor="Red" ValidationGroup="horaireAjout">*</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredHeureFin" runat="server" ErrorMessage="* Heure de fin requise."
                            ControlToValidate="txtFinAjout" ForeColor="Red" Display="Dynamic" ValidationGroup="horaireAjout">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="border: 1px solid #000000; width: 14%; padding-top: 10px;">
                        <asp:TextBox ID="txtLocalAjout" runat="server" Text='<%# Bind("noLocal") %>' Width="60px"
                            MaxLength="7"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredLocal" runat="server" ErrorMessage="* No local requis"
                            ControlToValidate="txtLocalAjout" ForeColor="Red" Display="Dynamic" Font-Size="14px"
                            ValidationGroup="horaireAjout">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="border: 1px solid #000000; width: 10%;">
                        <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel"
                            OnClick="resetLabel"></asp:LinkButton>
                    </td>
                </tr>
            </InsertItemTemplate>
            <EditItemTemplate>
                <tr align="center">
                    <td style="border: 1px solid #000000; width: 22%;">
                        <asp:LinkButton ID="btnUpdate" runat="server" Text="Mise à jour" ForeColor="Black"
                            CommandName="Update" ValidationGroup="horaire"></asp:LinkButton>
                        /
                        <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" ForeColor="Black" CommandName="Cancel"
                            OnClick="resetLabel"></asp:LinkButton>
                    </td>
                    <td style="border: 1px solid #000000; width: 20%; padding-top: 10px;">
                        <asp:DropDownList ID="ddlSemaine" DataSourceID="dsJourSemaine" runat="server" Width="120px"
                            SelectedValue='<%# Bind("JourSemaine_idSemaine") %>' DataTextField="jourSemaine"
                            DataValueField="idSemaine" AppendDataBoundItems="False">
                        </asp:DropDownList>
                    </td>
                    <td style="border: 1px solid #000000; width: 19%; padding-top: 10px;">
                        <asp:TextBox ID="txtDebut" runat="server" Text='<%# Bind("heureDebut") %>' Width="40px"
                            MaxLength="5"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regExDebut" runat="server" ErrorMessage="* De 00:00 à 23:59"
                            ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtDebut"
                            ForeColor="Red" ValidationGroup="horaire">*</asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="compareJourSemaine" runat="server" ErrorMessage="* L'heure de début doit être supérieur à l'heure de fin."
                            ForeColor="Red" Operator="GreaterThan" ControlToValidate="txtFin" ControlToCompare="txtDebut"
                            Display="Dynamic" ValidationGroup="horaire">*</asp:CompareValidator>
                        <asp:RequiredFieldValidator ID="RequiredHeureDebut" runat="server" ErrorMessage="* Heure de début requise."
                            ControlToValidate="txtDebut" ForeColor="Red" Display="Dynamic" ValidationGroup="horaire">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="border: 1px solid #000000; width: 15%; padding-top: 10px;">
                        <asp:TextBox ID="txtFin" runat="server" Text='<%# Bind("heureFin") %>' Width="40px"
                            MaxLength="5"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="regExFin" runat="server" ErrorMessage="* De 00:00 à 23:59"
                            ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtFin"
                            ForeColor="Red" ValidationGroup="horaire">*</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredHeureFin" runat="server" ErrorMessage="* Heure de fin requise."
                            ControlToValidate="txtFin" ForeColor="Red" Display="Dynamic" ValidationGroup="horaire">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="border: 1px solid #000000; width: 14%; padding-top: 10px;">
                        <asp:TextBox ID="txtLocal" runat="server" Text='<%# Bind("noLocal") %>' Width="60px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredLocal" runat="server" ErrorMessage="* No local requis"
                            ControlToValidate="txtLocal" ForeColor="Red" Display="Dynamic" Font-Size="14px"
                            ValidationGroup="horaire">*</asp:RequiredFieldValidator>
                    </td>
                    <td style="border: 1px solid #000000; width: 10%;">
                        <asp:LinkButton ID="btnSupprime" runat="server" Text="Supprimer" CommandName="Delete"
                            ForeColor="Red"></asp:LinkButton>
                    </td>
                </tr>
            </EditItemTemplate>
        </asp:ListView>
    </div>
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
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" Include="JourSemaineJeu"
        OrderBy="it.JourSemaine_idSemaine" Where="(@groupeID = it.GroupeJeu_idGroupe)">
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
