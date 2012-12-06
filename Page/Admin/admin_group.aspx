<%@ Page Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master" AutoEventWireup="false" CodeFile="admin_group.aspx.vb" Inherits="Page_Admin_admin_group_add" Theme="Original" %>

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
    <div style="width:313px;height:28px;float:left;">
    <asp:Label ID="lblTitreAjout" runat="server" Text="Opérations sur les groupes" Font-Size="24px"
        Font-Bold="true" /></div>
        <div style="float:right;">
    <asp:Label ID="lblListeAttente" runat="server" Text="" Visible="false" Font-Size="15px" ForeColor="Green" ></asp:Label>
    </div>
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
    <div style="width:100%;">
    <asp:ListView ID="lvGroupe" runat="server" DataSourceID="dsGroupeAjout" DataKeyNames="idGroupe" InsertItemPosition="LastItem" ItemPlaceholderID="itemPlaceHolder">
        <LayoutTemplate>
            <table align="center" style="width: 100%; border: 1px solid #000000; font-weight:bolder;">
                    <tr style="background-color:#1800B8; color:White; font-size:18px;">
                        <th style="border: 1px solid #000000; width:25%;" >
                            
                        </th>
                        <th style="border: 1px solid #000000; width:40%; padding:5px;" >
                            <asp:Label ID="lblTitreGroupe" runat="server" Text="Nom du groupe"></asp:Label>
                        </th>
                        <th style="border: 1px solid #000000; width:20%;">
                            <asp:Label ID="lblTitreMax" runat="server" Text="Nombre max"></asp:Label>
                        </th>
                        <th style="border: 1px solid #000000; width:15%;">
                            
                        </th>
                    </tr>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </table>
        </LayoutTemplate>
        <ItemTemplate>
        <tr align="center" class="<%# GetCssName(Container) %>">
            <td style="border: 1px solid #000000; width:25%; height:50px;">
                <asp:LinkButton ID="btnModifier" runat="server" Text="Modifier" ForeColor="Black" CommandName="Edit" OnClick="resetLabel"></asp:LinkButton>
            </td>
            <td style="border: 1px solid #000000; width:40%;">
                <asp:Label ID="lblNomGroupe" runat="server" Text='<%# eval("nomGroupe") %>'></asp:Label>
            </td>
            <td style="border: 1px solid #000000; width:20%;">
                <asp:Label ID="lblNbMax" runat="server" Text='<%# eval("nbMax") %>'></asp:Label>
            </td>
            <td style="border: 1px solid #000000; width:15%;">
                <asp:LinkButton ID="btnSupprime" runat="server" Text="Supprimer" CommandName="Delete" ForeColor="Red"></asp:LinkButton>
            </td>
            </tr>
        </ItemTemplate>
        <InsertItemTemplate>
            <tr align="center">
            <td style="border: 1px solid #000000; width:25%;">
                
            </td>
            <td style="border: 1px solid #000000; width:40%;">
                <asp:LinkButton ID="btnAjout" runat="server" Text="Ajouter un groupe" CommandName="Insert" ValidationGroup="groupeAjout"></asp:LinkButton>
            </td>
            <td style="border: 1px solid #000000; width:20%; padding-top:10px;">
                <asp:TextBox ID="txtNombreAjout" runat="server" Text='<%# Bind("nbMax") %>' Width="30px" MaxLength="3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="requiredNb" runat="server" ErrorMessage="*Nombres de membres"
                            ForeColor="Red" Font-Bold="true" CausesValidation="false" ControlToValidate="txtNombreAjout"
                            Display="Dynamic" ValidationGroup="groupeAjout">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="rangeNb" runat="server" ErrorMessage="*Nombre entre 1 et 999"
                            ForeColor="Red" Font-Bold="true" Type="Integer" MinimumValue="1" MaximumValue="999"
                            CausesValidation="false" ControlToValidate="txtNombreAjout" Display="Dynamic"
                            ValidationGroup="groupeAjout">*</asp:RangeValidator>
            </td>
            <td style="border: 1px solid #000000; width:15%;">
                <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" CommandName="Cancel" OnClick="resetLabel"></asp:LinkButton>
            </td>
            </tr>
        </InsertItemTemplate>
        <EditItemTemplate>
            <tr align="center" class="<%# GetCssName(Container) %>">
            <td style="border: 1px solid #000000; width:25%; height:40px">
                <asp:LinkButton ID="btnUpdate" runat="server" Text="Mise à jour" ForeColor="Black" CommandName="Update" ValidationGroup="groupe"></asp:LinkButton>
                /
                <asp:LinkButton ID="btnCancel" runat="server" Text="Cancel" ForeColor="Black" CommandName="Cancel"></asp:LinkButton>
            </td>
            <td style="border: 1px solid #000000; width:40%;">
                <asp:Label ID="lblNomGroupe" runat="server" Text='<%# eval("nomGroupe") %>'></asp:Label>
            </td>
            <td style="border: 1px solid #000000; width:20%; padding-top:10px;">
                <asp:TextBox ID="txtNbMax" runat="server" Text='<%# Bind("nbMax") %>' Width="30px" MaxLength="3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="requiredNb" runat="server" ErrorMessage="*Nombres de membres"
                        ForeColor="Red" Font-Bold="true" CausesValidation="false" ControlToValidate="txtNbMax"
                        Display="Dynamic" ValidationGroup="groupe">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rangeNb" runat="server" ErrorMessage="*Nombre entre 1 et 999"
                        ForeColor="Red" Font-Bold="true" Type="Integer" MinimumValue="1" MaximumValue="999"
                        CausesValidation="false" ControlToValidate="txtNbMax" Display="Dynamic" ValidationGroup="groupe">*</asp:RangeValidator>
            </td>
            <td style="border: 1px solid #000000; width:15%;">
                <asp:LinkButton ID="btnSupprime" runat="server" Text="Supprimer" CommandName="Delete" ForeColor="Red"></asp:LinkButton>
            </td>
            </tr>
        </EditItemTemplate>
    </asp:ListView>
    </div>
    <%--<asp:GridView ID="listeGroupe" runat="server" DataSourceID="dsGroupeAjout" DataKeyNames="idGroupe"
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
    </asp:GridView>--%>
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
