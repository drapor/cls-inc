<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_group_add.aspx.vb" Inherits="Page_Admin_admin_group_add" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">
<div class="titlePanier">
<h3>Ajouter un groupe</h3>
<br />
</div>

<div class="contenuStandard">

    <asp:ListView ID="lvGroupe" runat="server" DataSourceID="dsGroupe" DataKeyNames="idGroupe" InsertItemPosition="LastItem">
        <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
        </LayoutTemplate>

        <InsertItemTemplate>
            <div class="partiGauche">   
                <div class="formatZone">
                    <asp:Label ID="lblNomCours" runat="server" Text="Nom du cours:"></asp:Label>
                </div>
                <br />
                <div class="formatZone">
                    <asp:Label ID="lblNoGroupe" runat="server" Text="No du groupe:"></asp:Label>
                </div>
                <br />
                <div class="formatZone">
                    <asp:Label ID="lblNbsMax" runat="server" Text="Nombre maximal:"></asp:Label>
                </div>
            </div>

            <div class="partiDroite">
                
                <div class="formatZone">
                    <asp:DropDownList ID="ddlNomCours" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" appendDataBoundItems="False" SelectedValue='<%# Bind("Cours_idCours") %>'  MaxLength="16" Width="150px"></asp:DropDownList>
                </div>
                <br />
                <div class="formatZone">
                    <asp:TextBox ID="txtNoGroupe" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query" Text='<%# Bind("noGroupe") %>' MaxLength="2" Width="15px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredNo" runat="server" ErrorMessage="&nbsp;&nbsp;*Entrer le numéro de groupe" ForeColor="Red" CausesValidation="false" ControlToValidate="txtNoGroupe" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rangeNo" runat="server" ErrorMessage="&nbsp;&nbsp;*Nombre entre 1 et 99" ForeColor="Red" Type="Integer" MinimumValue="1" MaximumValue="99" CausesValidation="false" ControlToValidate="txtNoGroupe" Display="Dynamic"></asp:RangeValidator>
                </div>
                <br />            
                <div class="formatZone">
                    <asp:TextBox ID="txtNbsMax" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text='<%# Bind("nbMax") %>'  MaxLength="3" Width="25px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredNb" runat="server" ErrorMessage="*Entrer le nombre de membre maximum" ForeColor="Red" CausesValidation="false" ControlToValidate="txtNbsMax" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rangeNb" runat="server" ErrorMessage="*Nombre entre 1 et 999" ForeColor="Red" Type="Integer" MinimumValue="1" MaximumValue="999" CausesValidation="false" ControlToValidate="txtNbsMax" Display="Dynamic"></asp:RangeValidator>
                </div>
            </div>

            <div class="groupeBouton">
                <div class="boutonGroupeRetour">
                        <asp:Button ID="btnRetour" runat="server" Text="Retour" CssClass="btn btn-primary" Width="120px" CausesValidation="false" PostBackUrl="~/Page/Admin/home_admin.aspx"/>
                    </div>
                <div class="boutonGroupeAjout">
                    <asp:Button ID="btnConfirme" runat="server" commandName="Insert" Text="Confirmer" CssClass="btn btn-primary" Width="120px" />
                </div>
                
            </div>
        </InsertItemTemplate>
        <ItemTemplate>            
        </ItemTemplate>
    </asp:ListView>
    <%--<br />
    <br />
    <div class="groupeBouton">
        <asp:Label ID="lblAjoute" runat="server" Text="Le groupe a été ajouté!" Visible="false"  ForeColor="Green" Font-Bold="True"></asp:Label>
    </div>--%>
</div>
</div>

<asp:EntityDataSource ID="dsGroupe" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:EntityDataSource>

</asp:Content>
