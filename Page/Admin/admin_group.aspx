<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_group.aspx.vb" Inherits="Page_Admin_admin_group_add" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">
    <div class="entetePage">
        <div class="menuPageGauche" style="margin-top:10px;">
            <asp:Label ID="lblEntete" runat="server" text="Opérations Groupes" Font-Size="32px" Font-Bold="true"/>
        </div>
        <div class="menuPageDroit">
            <div class="boutonEntete" style="margin-right:10px;">
                <asp:Button ID="btnAjouter" runat="server" onClick="actionAjout" Text="Ajouter" CssClass="btn btn-primary" Width="150px" height="40px" CausesValidation="false"/>
            </div>
            <div class="boutonEntete" style="margin-right:10px;">
                <asp:Button ID="btnModifier" runat="server" onClick="actionModifie" Text="Modifier" CssClass="btn btn-primary" Width="150px" height="40px" CausesValidation="false"/>
            </div>
            <div class="boutonEntete" style="margin-right:10px;">
                <asp:Button ID="btnSupprimer" runat="server" onClick="actionSupprime" Text="Supprimer" CssClass="btn btn-primary" Width="150px" height="40px" CausesValidation="false"/>
            </div>
        </div>
    </div>

    <asp:MultiView ID="MVPrincipal" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewAjout" runat="server">
            <div class="contenuStandard">
                <asp:Label ID="lblTitreAjout" runat="server" text="Ajouter un groupe" Font-Size="24px" Font-Bold="true"/>
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
                            <asp:DropDownList ID="ddlNomCoursAjout" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" appendDataBoundItems="False"  MaxLength="16" Width="150px" AutoPostBack="true"></asp:DropDownList>
                        </div>
                        <br /> 
                    </div>

                <asp:ListView ID="lvAjout" runat="server" DataSourceID="dsGroupeAjout" DataKeyNames="idGroupe" InsertItemPosition="LastItem">
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
                                <asp:RequiredFieldValidator ID="requiredNb" runat="server" ErrorMessage="*Nombres de membres" ForeColor="Red" CausesValidation="false" ControlToValidate="txtNbsMax" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rangeNb" runat="server" ErrorMessage="*Nombre entre 1 et 999" ForeColor="Red" Type="Integer" MinimumValue="1" MaximumValue="999" CausesValidation="false" ControlToValidate="txtNbsMax" Display="Dynamic"></asp:RangeValidator>
                            </div>
                        </div>
                        <div class="groupeBouton">
                            <div class="boutonGroupeAjout" style="margin-left:180px;">
                                <asp:Button ID="btnConfirme" runat="server" commandName="Insert" Text="Ajouter" CssClass="btn btn-primary" Width="120px"/>
                            </div>      
                        </div>
                        </InsertItemTemplate>
                        <ItemTemplate>            
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div class="partiDroiteGroupe" style="margin-left:10px; width:400px;">
                    <asp:ListView ID="lvListGroupe" runat="server" DataSourceID="dsGroupeAjout" DataKeyNames="idGroupe">
                        <LayoutTemplate>
                            <div style="border:2px solid black; height:auto; width:400px; padding-left:25px; padding-top:20px; height:300px;">
                            <div class="gauche">
                                <asp:Label ID="lblGroupe" runat="server" Text="Nom groupe" Font-Bold="true"></asp:Label>
                            </div>
                            <div class="droit">
                                <asp:Label ID="lblNb" runat="server" Text="Nombres membres" Font-Bold="true"></asp:Label>
                            </div>
                            <br />
                            
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="gauche" style="margin-left:10px;">
                                <asp:Label ID="lblGroupe" runat="server" Text='<%# Eval("nomGroupe") %>' ></asp:Label>
                            </div>
                            <div class="droit" >
                                <asp:Label ID="TextBox" runat="server" Text='<%# Eval("nbMax") %>' ></asp:Label>
                            </div>
                            <br />
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </asp:View>

        <asp:View ID="viewModifie" runat="server">
            <div class="contenuStandard">
                <asp:Label ID="lblTitreModifie" runat="server" text="Modifier un groupe" Font-Size="24px" Font-Bold="true"/>
                <br />
                <br />
                <br />
                <div class="partiGaucheGroupe">
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
                            <asp:DropDownList ID="ddlNomCoursModifie" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsCours" DataTextField="NomCours" DataValueField="idCours" appendDataBoundItems="False" MaxLength="16" Width="150px" AutoPostBack="True"></asp:DropDownList>
                        </div>
                        <br />
                        <div class="formatZone">
                            <asp:DropDownList ID="ddlNomGroupeModifie" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsGroupeSelectionModifie" DataTextField="NomGroupe" DataValueField="idGroupe" appendDataBoundItems="False"  MaxLength="16" Width="150px" AutoPostBack="True"></asp:DropDownList>
                        </div>
                        <br />
                    </div>

                    <asp:ListView ID="lvModifie" runat="server" DataSourceID="dsGroupeModifie" DataKeyNames="idGroupe">
                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </LayoutTemplate>

                        <ItemTemplate>       
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
                                <div class="boutonGroupeAjout" style="margin-left:180px;">
                                    <asp:Button ID="btnUpdate" runat="server" commandName="Update" Text="Modifier" CssClass="btn btn-primary" Width="120px" />
                                </div> 
                            </div>  
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </asp:View>

        <asp:View ID="viewSupprime" runat="server">
            <div class="contenuStandard">
                <asp:Label ID="lblTitreSupprime" runat="server" text="Supprimer un groupe" Font-Size="24px" Font-Bold="true"/>
                <br />
                <br />
                <br />
                <div class="partiGaucheGroupe">
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
                            <asp:DropDownList ID="ddlNomCoursSupprime" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsCours" DataTextField="nomCours" DataValueField="idCours" appendDataBoundItems="False" MaxLength="16" Width="150px" AutoPostBack="True"></asp:DropDownList>
                        </div>
                        <br />
                        <div class="formatZone">
                            <asp:DropDownList ID="ddlNomGroupeSupprime" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsGroupeSelectionSupprime" DataTextField="nomGroupe" DataValueField="idGroupe" appendDataBoundItems="False"  MaxLength="16" Width="150px" AutoPostBack="True"></asp:DropDownList>
                        </div>
                    </div>

                    <asp:ListView ID="lvSupprime" runat="server" DataSourceID="dsGroupeSupprime" DataKeyNames="idGroupe">
                        <LayoutTemplate>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />     
                        </LayoutTemplate>

                        <ItemTemplate>
                            <div class="groupeBouton">    
                                <div class="boutonGroupeAjout" style="margin-left:180px;">
                                    <asp:Button ID="btnDelete" runat="server" commandName="Delete" Text="Supprimer" CssClass="btn btn-primary" Width="120px" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
    <div class="groupeBouton" style="clear:both;">
        <div class="boutonGroupeRetour" style="margin-bottom:20px;">
            <asp:Button ID="btnRetour" runat="server" Text="Retour page admin" CssClass="btn btn-primary" Width="150px" PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false"/>
        </div>
    </div>
</div>

<asp:EntityDataSource ID="dsGroupeAjout" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True"
    where="(@coursNo = it.Cours_idCours)">
    <WhereParameters>
        <asp:ControlParameter Name="coursNo" controlID="ddlNomCoursAjout" Type="Int32" DefaultValue="0"/>
    </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsGroupeModifie" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
    EnableDelete="False" EnableInsert="False" EnableUpdate="True" orderBy="it.idGroupe"
    where="(@coursID = it.Cours_idCours) AND (@groupeID = it.idGroupe)">
    <WhereParameters>
        <asp:ControlParameter Name="coursID" ControlID="ddlNomCoursModifie" PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter Name="groupeID" ControlID="ddlNomGroupeModifie" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsGroupeSupprime" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="False" EnableUpdate="True" orderBy="it.idGroupe"
    where="(@coursID = it.Cours_idCours) AND (@groupeID = it.idGroupe)">
    <WhereParameters>
        <asp:ControlParameter Name="coursID" ControlID="ddlNomCoursSupprime" PropertyName="SelectedValue" Type="Int32" />
        <asp:ControlParameter Name="groupeID" ControlID="ddlNomGroupeSupprime" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.nomCours">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsGroupeSelectionModifie" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.idGroupe"
    where="(@coursID = it.Cours_idCours)">
    <WhereParameters>
        <asp:ControlParameter Name="coursID" ControlID="ddlNomCoursModifie" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsGroupeSelectionSupprime" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="GroupeJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="True" EnableUpdate="True" orderBy="it.idGroupe"
    where="(@coursID = it.Cours_idCours)">
    <WhereParameters>
        <asp:ControlParameter Name="coursID" ControlID="ddlNomCoursSupprime" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

</asp:Content>
