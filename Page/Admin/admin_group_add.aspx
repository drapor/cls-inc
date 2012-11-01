<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_group_add.aspx.vb" Inherits="Page_Admin_admin_group_add" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">
<div class="title">
<h3>Ajouter un groupe</h3>
<br />
</div>

<div class="contenuStandard">
    <div class="partiGaucheGroupe">
        <div class="interieurGauche">
            <div class="formatZone">
                <asp:Label ID="lblNomCours" runat="server" Text="Nom du cours:"></asp:Label>
            </div>
            <br />
        </div>
        <div class="interieurDroit">
            <div class="formatZone">
                <asp:DropDownList ID="ddlNomCours" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" appendDataBoundItems="False"  MaxLength="16" Width="150px" AutoPostBack="true"></asp:DropDownList>
            </div>
            <br /> 
        </div>

    <asp:ListView ID="lvGroupe" runat="server" DataSourceID="dsGroupe" DataKeyNames="idGroupe" InsertItemPosition="LastItem">
        <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
        </LayoutTemplate>

        <InsertItemTemplate>
            <div class="interieurGauche">   
                <div class="formatZone">
                    <asp:Label ID="lblNbsMax" runat="server" Text="Nombre maximal:"></asp:Label>
                </div>
            </div>

            <div class="interieurDroit">           
                <div class="formatZone">
                    <asp:TextBox ID="txtNbsMax" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text='<%# Bind("nbMax") %>'  MaxLength="3" Width="25px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredNb" runat="server" ErrorMessage="*Entrez le nombre de membre" ForeColor="Red" CausesValidation="false" ControlToValidate="txtNbsMax" Display="Dynamic"></asp:RequiredFieldValidator>
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
</div>
    <div class="partiDroiteGroupe">
        <asp:ListView ID="lvListGroupe" runat="server" DataSourceID="dsGroupe" DataKeyNames="idGroupe">
            <LayoutTemplate>
                <div class="gauche">
                    <asp:Label ID="lblGroupe" runat="server" Text="Nom groupe"></asp:Label>
                </div>
                <div class="droit">
                    <asp:Label ID="lblNb" runat="server" Text="Nombre membre"></asp:Label>
                </div>
                <br />
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </LayoutTemplate>
            <ItemTemplate>
                <asp:TextBox ID="lblGroupe" runat="server" Text='<%# Eval("nomGroupe") %>' ReadOnly="True" width="150px"></asp:TextBox>
                <asp:TextBox ID="TextBox" runat="server" Text='<%# Eval("nbMax") %>' ReadOnly="True" width="50px" ></asp:TextBox>
                <br />
            </ItemTemplate>
        </asp:ListView>
    </div>
    <%--<br />
    <br />
    <div class="groupeBouton">
        <asp:Label ID="lblAjoute" runat="server" Text="Le groupe a été ajouté!" Visible="false"  ForeColor="Green" Font-Bold="True"></asp:Label>
    </div>--%>
</div>
</div>

<asp:EntityDataSource ID="dsGroupe" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True"
    where="(@coursNo = it.Cours_idCours)">
    <WhereParameters>
        <asp:ControlParameter Name="coursNo" controlID="ddlNomCours" Type="Int32" DefaultValue="0"/>
    </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.nomCours">
    </asp:EntityDataSource>

</asp:Content>
