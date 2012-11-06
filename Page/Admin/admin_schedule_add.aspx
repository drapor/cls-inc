<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_schedule_add.aspx.vb" Inherits="Page_Admin_admin_group_add" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">
<div class="titlePanier">
<h3>Ajouter un horaire</h3>
<br />
</div>

<div class="contenuStandard">

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
        
    <asp:ListView ID="lvHoraire" runat="server" DataSourceID="dsHoraire" DataKeyNames="idHoraire" InsertItemPosition="LastItem">
        <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
        </LayoutTemplate>

        <InsertItemTemplate>
            <div class="local">
            <div class="interieurGauche">
                <div class="formatZone">
                    <asp:Label ID="lblLocal" runat="server" Text="Local:"></asp:Label>
                </div>
                <br />
                <br />      
            </div>

            <div class="interieurDroit">
                <div class="formatZone">
                    <asp:TextBox ID="txtLocal" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text='<%# Bind("noLocal") %>'  MaxLength="10" Width="50px" CausesValidation="false"></asp:TextBox>
                </div>
                <br />
                <br />           
            </div>
            <div class="validationLocal">
                <asp:RequiredFieldValidator ID="requiredLocal" runat="server" ErrorMessage="No local requis" ControlToValidate="txtLocal" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <br />
                <br />
            </div>
            </div>
            <div class="jourSemaine">
                <div class="formatZone" style="font-size:20px;">
                    <asp:DropDownList ID="DropDownList1" SkinID="ddlBlue" runat="server" width="120px" SelectedValue='<%# Bind("nomJourSemaine") %>'>
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
                        <asp:TextBox ID="txtDebut" SkinID="txtBoxYellowPerso" runat="server" CssClass="search-query" Text='<%# Bind("heureDebutLundi") %>' MaxLength="5" Width="50px"></asp:TextBox>
                    </div>
                    <br />
                    <div class="formatZone">
                        <asp:TextBox ID="txtFin" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text='<%# Bind("heureFinLundi") %>'  MaxLength="5" Width="50px"></asp:TextBox>
                    </div>
                </div>
                <div class="validationHoraire">
                    <div class="formatZone">
                        <asp:RegularExpressionValidator ID="regExDebut" runat="server" ErrorMessage="De 00:00 à 23:59" 
                        ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtDebut" ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="compareJourSemaine" runat="server" ErrorMessage="L'heure de début doit être supérieur à l'heure de fin."  ForeColor="Red" Operator="GreaterThan" ControlToValidate="txtFin" ControlToCompare="txtDebut" Display="Dynamic"></asp:CompareValidator>
                        <asp:CustomValidator ID="customJourSemaine" runat="server" ErrorMessage="Vous devez mettre une heure de début et de fin." OnServerValidate="ServerValidate" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
                    </div>
                    <br />
                    <div class="formatZone">
                        <asp:RegularExpressionValidator ID="regExFin" runat="server" ErrorMessage="De 00:00 à 23:59" 
                        ValidationExpression="(?:[01][0-9]|2[0-4]):[0-5][0-9]" Display="Dynamic" ControlToValidate="txtFin" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                </div>
            </div>

            <div class="groupeBouton">
                <div class="boutonGroupeRetour" style="margin-bottom:20px;">
                        <asp:Button ID="btnRetour" runat="server" Text="Retour page admin" CssClass="btn btn-primary" Width="150px" PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false"/>
                    </div>
                <div class="boutonGroupeAjout">
                    <asp:Button ID="btnConfirme" runat="server" commandName="Insert" Text="Ajouter l'horaire" CssClass="btn btn-primary" Width="130px" />
                </div>
            </div>
        </InsertItemTemplate>

        <ItemTemplate>            
        </ItemTemplate>
    </asp:ListView>
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
