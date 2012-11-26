<%@ Page Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master" AutoEventWireup="false" CodeFile="admin_group.aspx.vb" Inherits="Page_Admin_admin_group_add" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="menu" Runat="Server">

    <asp:MultiView ID="MVPrincipal" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewAjout" runat="server">
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
                        <div>   
                            <br />
                            <br />
                            <asp:GridView ID="listGroupe" runat="server" DataSourceID="dsGroupeAjout"
                                DataKeyNames="idGroupe" AutoGenerateColumns="False" AlternatingRowStyle-BackColor="#8c8cde"
                                AlternatingRowStyle-ForeColor="#FFFFFF" CssClass="gridView">
                                <Columns>
                                    <asp:CommandField ShowEditButton="True" CausesValidation="true" ValidationGroup="groupe"/>
                                    <asp:BoundField DataField="nomGroupe" HeaderText="Nom groupe" ReadOnly="true"/>
                                    <asp:TemplateField HeaderText="Nombres Max" ItemStyle-VerticalAlign="Middle" > 
                                        <ItemTemplate> 
                                            <asp:Label ID="lblNombre" runat="server" Text='<%# Bind("nbMax") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox ID="txtNombre" runat="server" Text='<%# Bind("nbMax") %>' Width="20px" MaxLength="2"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="requiredNb" runat="server" ErrorMessage="*Nombres de membres" ForeColor="Red" Font-Bold="true" CausesValidation="false" ControlToValidate="txtNombre" Display="Dynamic" ValidationGroup="groupe">*</asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="rangeNb" runat="server" ErrorMessage="*Nombre entre 1 et 999" ForeColor="Red" Font-Bold="true" Type="Integer" MinimumValue="1" 
                                            MaximumValue="999" CausesValidation="false" ControlToValidate="txtNombre" Display="Dynamic" ValidationGroup="groupe">*</asp:RangeValidator>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ShowEditButton="False" Visible="false"/>
                                    <asp:TemplateField> 
                                        <ItemTemplate> 
                                            <asp:LinkButton id="btngvdelete" runat="server" 
                                            OnClientClick="return confirm('Voulez-vous vraiment supprimer ce groupe?');" 
                                            CommandName="Delete" ForeColor="Red" Font-Bold="true" Text="Supprimer">
                                            </asp:LinkButton> 
                                        </ItemTemplate> 
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <br />
                            <div class="validationListe">
                            <asp:ValidationSummary ID="ValidationInfo" ValidationGroup="groupe" DisplayMode="List" ForeColor="Red" runat="server" />
                        </div>
                        </div>

                <%--<asp:ListView ID="lvAjout" runat="server" DataSourceID="dsGroupeAjout" DataKeyNames="idGroupe" InsertItemPosition="LastItem">
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
                            <div style="width:60px; float:left;">
                                <asp:TextBox ID="txtNbsMax" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text='<%# Bind("nbMax") %>'  MaxLength="3" Width="25px"></asp:TextBox>  
                            </div>
                            <div class="validation" style="padding-top:5px;">
                                <asp:RequiredFieldValidator ID="requiredNb" runat="server" ErrorMessage="*Nombres de membres" ForeColor="Red" CausesValidation="false" ControlToValidate="txtNbsMax" Display="Dynamic" ValidationGroup="groupe">!</asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rangeNb" runat="server" ErrorMessage="*Nombre entre 1 et 999" ForeColor="Red" Type="Integer" MinimumValue="1" 
                                    MaximumValue="999" CausesValidation="false" ControlToValidate="txtNbsMax" Display="Dynamic" ValidationGroup="groupe">!</asp:RangeValidator>
                            </div>
                        </div>

                        <div class="validationListe">
                            <asp:ValidationSummary ID="ValidationInfo" ValidationGroup="groupe" DisplayMode="List" ForeColor="Red" runat="server" />
                        </div>

                        <div class="groupeBouton">
                            <div class="boutonGroupeAjout" style="margin-left:180px;">
                                <asp:Button ID="btnConfirme" runat="server" commandName="Insert" Text="Ajouter" CssClass="btn btn-primary" Width="120px" ValidationGroup="groupe" />
                            </div>      
                        </div>
                        </InsertItemTemplate>
                        <ItemTemplate>            
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div class="partiDroiteGroupe" style="margin-left:10px; width:320px;">
                    <asp:GridView ID="listGroupe" runat="server" DataSourceID="dsGroupeAjout"
                        DataKeyNames="idGroupe" AutoGenerateColumns="False" AlternatingRowStyle-BackColor="#8c8cde" 
                        AlternatingRowStyle-ForeColor="#FFFFFF" CssClass="gridView">
                        <Columns>
                            <asp:CommandField ShowEditButton="False" Visible="False" />
                            <asp:BoundField DataField="nomGroupe" HeaderText="Nom groupe" FooterText=""/>
                            <asp:BoundField DataField="nbMax" HeaderText="Nombres membres" />
                        </Columns>
                    </asp:GridView>--%>

                    <%--<asp:ListView ID="lvListGroupe" runat="server" DataSourceID="dsGroupeAjout" DataKeyNames="idGroupe">
                        <LayoutTemplate>
                            <div style="border:2px solid black; height:auto; padding-left:5px; padding-top:10px; height:300px;">
                            <div class="gauche">
                                <asp:Label ID="lblGroupe" runat="server" Text="Nom groupe" Font-Bold="true"></asp:Label>
                            </div>
                            <div class="droit">
                                <asp:Label ID="lblNb" runat="server" Text="Nbs membres" Font-Bold="true"></asp:Label>
                            </div>
                            <br />
                            
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                            </div>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <div class="gauche" style="margin-left:10px;">
                                <asp:Label ID="lblGroupe" runat="server" Text='<%# Eval("nomGroupe") %>' ></asp:Label>
                            </div>
                            <div class="droit" style="margin-left:-10px;" >
                                <asp:Label ID="TextBox" runat="server" Text='<%# Eval("nbMax") %>' ></asp:Label>
                            </div>
                            <br />
                        </ItemTemplate>
                    </asp:ListView>--%>
                </div>
        </asp:View>

        <asp:View ID="viewModifie" runat="server">
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
                                <div style="width:60px; float:left;">
                                    <asp:TextBox ID="txtNbsMax" SkinID="txtBoxYellowPerso"  runat="server" CssClass="search-query" Text='<%# Bind("nbMax") %>'  MaxLength="3" Width="25px"></asp:TextBox>
                                    
                                </div>
                                <div class="validation" style="padding-top:5px;">
                                    <asp:RequiredFieldValidator ID="requiredNb" runat="server" ErrorMessage="Entrez le nombre de membre" ForeColor="Red" CausesValidation="false" ControlToValidate="txtNbsMax" Display="Dynamic" ValidationGroup="groupe">!</asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="rangeNb" runat="server" ErrorMessage="*Nombre entre 1 et 999" ForeColor="Red" Type="Integer" MinimumValue="1" MaximumValue="999" CausesValidation="false" ControlToValidate="txtNbsMax" Display="Dynamic" ValidationGroup="groupe">!</asp:RangeValidator>
                                </div>
                            </div>

                            <div class="validationListe">
                                <asp:ValidationSummary ID="ValidationInfo" ValidationGroup="groupe" DisplayMode="List" ForeColor="Red" runat="server" />
                            </div>
                            <div class="groupeBouton">
                                <div class="boutonGroupeAjout" style="margin-left:180px;">
                                    <asp:Button ID="btnUpdate" runat="server" commandName="Update" Text="Modifier" CssClass="btn btn-primary" Width="120px" ValidationGroup="groupe"/>
                                </div> 
                            </div>  
                        </ItemTemplate>
                    </asp:ListView>
                </div>
        </asp:View>

        <asp:View ID="viewSupprime" runat="server">
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
        </asp:View>
    </asp:MultiView>

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
