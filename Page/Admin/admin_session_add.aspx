<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_session_add.aspx.vb" Inherits="Page_Admin_admin_session_add" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">
<div class="title">
<h3>Ajouter une session</h3>
<br />
</div>

<div class="contenuStandard">

    <asp:ListView ID="lvSession" runat="server" DataSourceID="dsSession" DataKeyNames="idSession" InsertItemPosition="LastItem">
        <LayoutTemplate>
            <div class="partiSession">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>

        <InsertItemTemplate>
            <div class="sessionGauche">   
                <div class="formatZone">
                    <asp:Label ID="lblSaisonSession" runat="server" Text="Saison de session:"></asp:Label>
                </div>
                <br />
                <div class="formatZone">
                    <asp:Label ID="lblAnneSession" runat="server" Text="Année de session:"></asp:Label>
                </div>
                <br />
                <div class="formatZone">
                    <asp:Label ID="lblDebutSession" runat="server" Text="Début de la session:(*)"></asp:Label>
                </div>
                <br />
                <div class="formatZone">
                    <asp:Label ID="lblFinSession" runat="server" Text="Fin de la session:(*)"></asp:Label>
                </div>
            </div>

            <div class="sessionDroite">           
                <div class="formatZone">
                    <asp:DropDownList ID="ddlSaison" SkinID="ddlBlue"  runat="server" CssClass="search-query" Width="125px">
                        <asp:ListItem Text="Printemps" Value="Printemps" Selected="true"></asp:ListItem>
                        <asp:ListItem Text="Ete" Value="Ete"></asp:ListItem>
                        <asp:ListItem Text="Automne" Value="Automne"></asp:ListItem>
                        <asp:ListItem Text="Hiver" Value="Hiver"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <br />
                 <div class="formatZone">
                    <asp:DropDownList ID="ddlAnnee" SkinID="ddlBlue"  runat="server" CssClass="search-query" Width="100px" AutoPostBack="true">
                    </asp:DropDownList>
                </div>
                <br />
                <div class="formatZone">
                    <asp:TextBox ID="txtDateDebut" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" text='<%# Bind("debutSession", "{0:yyyy-MM-dd}") %>' Width="75px"></asp:TextBox>
                </div>
                <br />
                <div class="formatZone">
                    <asp:TextBox ID="txtDateFin" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" text='<%# Bind("finSession", "{0:yyyy-MM-dd}") %>' Width="75px"></asp:TextBox>
                </div>
            </div>
            <div class="validationSession">
                <br />
                <br />
                <br />
                <br />
                <div class="formatZone">
                    <asp:RequiredFieldValidator ID="requiredDateDebut" runat="server" ErrorMessage="*Date de début obligatoire" ControlToValidate="txtDateDebut" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regExDateDebut" runat="server" ErrorMessage="*Votre date n'est pas dans le format aaaa/mm/jj" 
                ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$" Display="Dynamic" ControlToValidate="txtDateDebut" ForeColor="Red"></asp:RegularExpressionValidator>
                </div>
                <br />
                <div class="formatZone">
                    <asp:RequiredFieldValidator ID="requiredDateFin" runat="server" ErrorMessage="*Date de fin obligatoire" ControlToValidate="txtDateFin" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regExDateFin" runat="server" ErrorMessage="*Votre date n'est pas dans le format aaaa/mm/jj" 
                ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$" Display="Dynamic" ControlToValidate="txtDateFin" ForeColor="Red"></asp:RegularExpressionValidator>
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
</div>

    <asp:EntityDataSource ID="dsSession" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="SessionJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:EntityDataSource>

    <script>
        $(function () {
            $(".datepicker").datepicker({
                dayNamesMin: ["Di", "Lu", "Ma", "Me", "Je", "ve", "Sa"],
                monthNamesShort: ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"],
                yearRange: "c-100:c",
                changeMonth: true,
                changeYear: true,
                dateFormat: "yy/mm/dd"
            });
        });
	</script>

</asp:Content>
