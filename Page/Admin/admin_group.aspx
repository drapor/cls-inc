<%@ Page Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master" AutoEventWireup="false"
    CodeFile="admin_group.aspx.vb" Inherits="Page_Admin_admin_group_add" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="Server">
    <asp:Label ID="lblTitreAjout" runat="server" Text="Opérations sur les groupes" Font-Size="24px"
        Font-Bold="true" />
    <br />
    <br />
    <br />
    <div class="partiGaucheGroupe">
        <div class="interieurGauche">
            <div class="formatZone">
                <asp:Label ID="lblNomCoursAjout" runat="server" Text="Nom du cours:"></asp:Label>
            </div>
            <br />
        </div>
        <div class="interieurDroit">
            <div class="formatZone">
                <asp:DropDownList ID="ddlNomCoursAjout" SkinID="ddlBlue" runat="server" CssClass="search-query"
                    DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" AppendDataBoundItems="False"
                    MaxLength="16" Width="150px" AutoPostBack="true">
                </asp:DropDownList>
            </div>
        </div>
    </div>
    <asp:GridView ID="listeGroupe" runat="server" DataSourceID="dsGroupeAjout" DataKeyNames="idGroupe"
        AutoGenerateColumns="False" AlternatingRowStyle-BackColor="#8c8cde" AlternatingRowStyle-ForeColor="#FFFFFF"
        CssClass="gridView" ShowFooter="true">
        <Columns>
            <asp:TemplateField ShowHeader="True">
                <ItemTemplate>
                    <asp:LinkButton ID="lbEdit" runat="server" CommandName="edit" Text="Modifier" ForeColor="Black"></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:LinkButton ID="lbUpdate" runat="server" CommandName="update" Text="Mise à jour"
                        CausesValidation="true" ValidationGroup="groupe"></asp:LinkButton>
                    <asp:LinkButton ID="lbcancel" runat="server" CommandName="Cancel" Text="Annuler"></asp:LinkButton>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nom du groupe">
                <ItemTemplate>
                    <asp:Label ID="lblNomGroupe" runat="server" Text='<%# eval("nomGroupe") %>'></asp:Label>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:LinkButton ID="lbInsert" runat="server" OnClick="actionAjout" ForeColor="#1800B8"
                        Font-Bold="true" Font-Size="18px" Text="Nouveau" CausesValidation="true" ValidationGroup="groupeAjout"></asp:LinkButton>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nombres Max">
                <ItemTemplate>
                    <asp:Label ID="lblNombre" runat="server" Text='<%# eval("nbMax") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("nbMax") %>' Width="30px"
                        MaxLength="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredNb" runat="server" ErrorMessage="*Nombres de membres"
                        ForeColor="Red" Font-Bold="true" CausesValidation="false" ControlToValidate="txtNombre"
                        Display="Dynamic" ValidationGroup="groupe">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rangeNb" runat="server" ErrorMessage="*Nombre entre 1 et 999"
                        ForeColor="Red" Font-Bold="true" Type="Integer" MinimumValue="1" MaximumValue="999"
                        CausesValidation="false" ControlToValidate="txtNombre" Display="Dynamic" ValidationGroup="groupe">*</asp:RangeValidator>
                </EditItemTemplate>
                <FooterTemplate>
                    <asp:TextBox ID="txtNombreAjout" runat="server" Text="" Width="30px" MaxLength="3"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredNb" runat="server" ErrorMessage="*Nombres de membres"
                        ForeColor="Red" Font-Bold="true" CausesValidation="false" ControlToValidate="txtNombreAjout"
                        Display="Dynamic" ValidationGroup="groupeAjout">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rangeNb" runat="server" ErrorMessage="*Nombre entre 1 et 999"
                        ForeColor="Red" Font-Bold="true" Type="Integer" MinimumValue="1" MaximumValue="999"
                        CausesValidation="false" ControlToValidate="txtNombreAjout" Display="Dynamic"
                        ValidationGroup="groupeAjout">*</asp:RangeValidator>
                </FooterTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="False" Visible="false" />
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="btngvdelete" runat="server" OnClientClick="return confirm('Voulez-vous vraiment supprimer ce groupe?');"
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
                    <th scope="col" style="width: 100px;">
                    </th>
                    <th scope="col" style="width: 231px;">
                        Nom du groupe
                    </th>
                    <th scope="col" style="width: 213px;">
                        Nombres Max
                    </th>
                    <th scope="col" style="width: 132px;">
                    </th>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <asp:LinkButton ID="lbInsert" runat="server" OnClick="actionAjout" ForeColor="#1800B8"
                            Font-Bold="true" Font-Size="18px" Text="Nouveau" CausesValidation="true" ValidationGroup="groupeAjout"></asp:LinkButton>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNombreAjout" runat="server" Text="" Width="30px" MaxLength="3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredNb" runat="server" ErrorMessage="*Nombres de membres"
                            ForeColor="Red" Font-Bold="true" CausesValidation="false" ControlToValidate="txtNombreAjout"
                            Display="Dynamic" ValidationGroup="groupeAjout">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rangeNb" runat="server" ErrorMessage="*Nombre entre 1 et 999"
                            ForeColor="Red" Font-Bold="true" Type="Integer" MinimumValue="1" MaximumValue="999"
                            CausesValidation="false" ControlToValidate="txtNombreAjout" Display="Dynamic"
                            ValidationGroup="groupeAjout">*</asp:RangeValidator>
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
        <asp:ValidationSummary ID="ValidationInfo" ValidationGroup="groupe" DisplayMode="List"
            ForeColor="Red" runat="server" />
    </div>
    <div class="validationListe">
        <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="groupeAjout" DisplayMode="List"
            ForeColor="Red" runat="server" />
    </div>
    <asp:EntityDataSource ID="dsGroupeAjout" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" Where="(@coursNo = it.Cours_idCours)">
        <WhereParameters>
            <asp:ControlParameter Name="coursNo" ControlID="ddlNomCoursAjout" Type="Int32" DefaultValue="0" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.nomCours">
    </asp:EntityDataSource>
</asp:Content>
