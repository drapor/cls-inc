<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Page/Admin/MasterPageAdmin.master" CodeFile="admin_membre.aspx.vb" Inherits="Page_Admin_admin_membre" Theme="Original"  %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menu" Runat="Server">
    <div class="containerContenuAdmin">
        <div class="entetePage">
                <div class="menuPageGauche" style="margin-top:10px;">
                    <asp:Label ID="lblEntete" runat="server" text="Opérations Membres" Font-Size="32px" Font-Bold="true"/>
                </div>
                <div class="menuPageDroit">
                    <div class="boutonEntete" style="margin-right:10px;">
                        <asp:Button ID="btnAjout" runat="server" onClick="actionAjout" Text="Ajouter" CssClass="btn btn-primary" Width="150px" height="40px" CausesValidation="false"/>
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
                        <asp:Label ID="lblTitreAjout" runat="server" text="Ajouter un Membre" Font-Size="24px" Font-Bold="true"/>
                        <br />
                        <br />
                        <br />
                        <asp:ListView ID="lvNouveauMembre" runat="server" DataSourceID="dsMembreAjout" DataKeyNames="idMembre" InsertItemPosition="LastItem" ItemPlaceholderID="itemPlaceHolder">
                            <LayoutTemplate>
                                <div class="containerFormulaire">
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <div class="ligneFormulaire">
                                    <div class="elementFormulaireTexte"><asp:Label ID="lblCourriel" runat="server" Text="E-mail(*)"></asp:Label></div>
                                    <div class="elementFormulaire"><asp:TextBox ID="txtCourriel" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="50" Text='<%# Bind("courriel") %>'></asp:TextBox></div>
                                    <div class="elementFormulaireRequired">
                                        <asp:RequiredFieldValidator ID="requiredCourriel" runat="server" ErrorMessage="*L'adresse courriel est obligatoire" ControlToValidate="txtCourriel" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regExCourriel" runat="server" ErrorMessage="*Veuillez entrer une adresse dans le format adresse@courriel.com" ControlToValidate="txtCourriel" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                                        <asp:CustomValidator ID="courrielCompare" runat="server" ControlToValidate="txtCourriel" OnServerValidate="validationCourriel" ErrorMessage="Ce courriel est déjà utilisé!" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
                                    </div>
                                </div>
                                <div class="ligneFormulaire">
                                    <div class="elementFormulaireTexte"><asp:Label ID="lblPrenom" runat="server" Text="Prénom(*)"></asp:Label></div>
                                    <div class="elementFormulaire"><asp:TextBox ID="txtPrenom" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25" Text='<%# Bind("prenomMembre") %>'></asp:TextBox></div>
                                    <div class="elementFormulaireRequired">
                                        <asp:RequiredFieldValidator ID="requiredPrenom" runat="server" ErrorMessage="*Le prénom est obligatoire" ControlToValidate="txtPrenom" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="ligneFormulaire">
                                    <div class="elementFormulaireTexte"><asp:Label ID="lblNom" runat="server" Text="Nom(*)"></asp:Label></div>
                                    <div class="elementFormulaire"><asp:TextBox ID="txtNom" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25" Text='<%# Bind("nomMembre") %>'></asp:TextBox></div>
                                    <div class="elementFormulaireRequired">
                                        <asp:RequiredFieldValidator ID="requiredNom" runat="server" ErrorMessage="*Le nom est obligatoire" ControlToValidate="txtNom" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="ligneFormulaire">
                                 <div class="elementFormulaireTexte"><asp:Label ID="lblSexe" runat="server" Text="Sexe"></asp:Label></div>
                                 <div class="elementFormulaire">
                                     <asp:RadioButtonList ID="rdbtnSexe" runat="server" RepeatDirection="Horizontal" Width="200px" SelectedValue='<%# Bind("sexe") %>'>
                                     <asp:ListItem Text="Homme" Value="H" Selected="true"></asp:ListItem>
                                     <asp:ListItem Text="Femme" Value="F"></asp:ListItem>
                                    </asp:RadioButtonList>
                                 </div>
                            </div>
                                <div class="ligneFormulaire">
                                    <div class="elementFormulaireTexte"><asp:Label ID="lblAdresse" runat="server" Text="Adresse(*)"></asp:Label></div>
                                    <div class="elementFormulaire"><asp:TextBox ID="txtAdresse" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="40" Text='<%# Bind("adresse") %>'></asp:TextBox></div>
                                    <div class="elementFormulaireRequired">
                                        <asp:RequiredFieldValidator ID="requiredAdresse" runat="server" ErrorMessage="*L'adresse est obligatoire" ControlToValidate="txtAdresse" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="ligneFormulaire">
                                    <div class="elementFormulaireTexte"><asp:Label ID="lblVille" runat="server" Text="Ville(*)"></asp:Label></div>
                                    <div class="elementFormulaire"><asp:TextBox ID="txtVille" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25" Text='<%# Bind("ville") %>'></asp:TextBox></div>
                                    <div class="elementFormulaireRequired">
                                        <asp:RequiredFieldValidator ID="requiredVille" runat="server" ErrorMessage="*La ville est obligatoire" ControlToValidate="txtVille" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="ligneFormulaire">
                                    <div class="elementFormulaireTexte"><asp:Label ID="lblDateNaissance" runat="server" Text="Date de naissance(*)"></asp:Label></div>
                                    <div class="elementFormulaire"><asp:TextBox ID="txtDate" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" text='<%# Bind("dateNaissance", "{0:yyyy/MM/dd}") %>' Width="75px"></asp:TextBox></div>
                                        <asp:RequiredFieldValidator ID="requiredDate" runat="server" ErrorMessage="*La date de naissance est obligatoire" ControlToValidate="txtDate" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="regExDate" runat="server" ErrorMessage="*Votre date n'est pas dans le format aaaa/mm/jj" 
                                        ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$" Display="Dynamic" ControlToValidate="txtDate" ForeColor="Red"></asp:RegularExpressionValidator>
                                </div>
                                <div class="ligneFormulaire">
                                    <div class="elementFormulaireTexte"><asp:Label ID="lblTelephone" runat="server" Text="Téléphone(*)"></asp:Label></div>
                                    <div class="elementFormulaire"><asp:TextBox ID="txtTelephone" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="13" Text='<%# Bind("telephoneMembre") %>' Width="95px"></asp:TextBox></div>
                                    <div class="elementFormulaireRequired">
                                        <asp:RegularExpressionValidator ID="regExTelephone" runat="server" Display="Dynamic" ErrorMessage="*Entrer un numéro de téléphone dans le format suivant (123)456-7890" ForeColor="Red" ControlToValidate="txtTelephone" ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[0-9]{3}[\-]{1}[0-9]{4})$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="requiredTelephone" runat="server" ErrorMessage="*Le téléphone est obligatoire" ControlToValidate="txtTelephone" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="ligneFormulaire">
                                    <div class="elementFormulaireTexte"><asp:Label ID="lblCodePostal" runat="server" Text="Code Postal(*)"></asp:Label></div>
                                    <div class="elementFormulaire"><asp:TextBox ID="txtCodePostal" runat="server" CssClass="search-query" SkinID="txtBoxBlue" Width="60px" Text='<%# Bind("codePostal") %>' MaxLength="7"></asp:TextBox></div>
                                    <div class="elementFormulaireRequired">
                                        <asp:RegularExpressionValidator ID="regExCodePostal" runat="server" ErrorMessage="*Veuillez entrer un code postal dans le format A1A 1A1" ForeColor="Red" Display="Dynamic" ControlToValidate="txtCodePostal" ValidationExpression="[A-Z]\d[A-Z] \d[A-Z]\d"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="requiredCodePostal" runat="server" ErrorMessage="*Le code postal est obligatoire" ControlToValidate="txtCodePostal" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="ligneFormulaire">
                                    <div class="elementFormulaireTexte"><asp:Label ID="lblMDP" runat="server" Text="Mot de passe(*)"></asp:Label></div>
                                    <div class="elementFormulaire"><asp:TextBox ID="txtMDP" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="20" TextMode="Password" Text='<%# Bind("motPasse") %>'></asp:TextBox></div>
                                    <div class="elementFormulaireRequired">
                                        <asp:RegularExpressionValidator ID="regExMDP" runat="server" ErrorMessage="*Votre mot de passe doit contenir entre 8 et 20 caractère" ControlToValidate="txtMDP" ForeColor="Red" Display="Dynamic" ValidationExpression="^[A-Za-z0-9]{8,}$"></asp:RegularExpressionValidator>
                                        <asp:RequiredFieldValidator ID="requiredMDP" Display="Dynamic" runat="server" ErrorMessage="*Le mot de passe est obligatoire" ControlToValidate="txtMDP" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="ligneFormulaire">
                                    <div class="elementFormulaireTexte"><asp:Label ID="lblMDPConfirm" runat="server" Text="Confirmation du mot de passe(*)"></asp:Label></div>
                                    <div class="elementFormulaire"><asp:TextBox ID="txtMDPConfirm" runat="server" CssClass="search-query" SkinID="txtBoxBlue" TextMode="Password"></asp:TextBox></div>
                                    <div class="elementFormulaireRequired">
                                        <asp:CompareValidator ID="compareMDPConfirm" runat="server" ErrorMessage="*Votre mot de passe ne correspond pas" ForeColor="Red" ControlToCompare="txtMDP" ControlToValidate="txtMDPConfirm"></asp:CompareValidator>
                                        <asp:RequiredFieldValidator Display="Dynamic" ID="requiredMDPConfirm" runat="server" ErrorMessage="*Veuillez confirmez votre mot de passe" ControlToValidate="txtMDPConfirm" ForeColor="Red"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="ligneFormulaire">
                                    <div class="elementFormulaireTexte"></div>
                                    <div class="elementFormulaire" style="margin-left:80px; margin-top:10px; margin-bottom:20px;">
                                        <asp:Button ID="btnAjouter" runat="server" CommandName="Insert" Text="Ajouter l'employé" CssClass="btn btn-primary btn-large btn"/>
                                    </div>
                                </div>
                            </InsertItemTemplate>
                        </asp:ListView>

                    </div>
                </asp:View>

                <asp:View ID="viewModifie" runat="server">
                    <div class="contenuStandard">
                        <asp:Label ID="lbltitreModifie" runat="server" text="Modifier un Membre" Font-Size="24px" Font-Bold="true"/>
                        <br />
                        <br />
                        <br />
                        <div class="infoClient">
                            <div class="partiGaucheCourrielEdit">
                                    <div class="formatZone">
                                        <asp:Label ID="lblCourriel" runat="server" Text="Entrez le courriel du membre:"></asp:Label>
                                    </div>
                                </div>
                                <div class="partiDroiteCourrielEdit">
                                    <div class="formatZone">
                                        <asp:ToolkitScriptManager id="toolKitScriptManager1" runat="server"></asp:ToolkitScriptManager>

                                        <asp:TextBox ID="txtCourriel" runat="server" SkinID="txtBoxYellow" CssClass="search-query" Text=""></asp:TextBox>

                                        <asp:AutoCompleteExtender ID="AutoCompleteExtender1" 
                                            TargetControlID="txtCourriel" runat="server" ServiceMethod="GetCompletionList" MinimumPrefixLength="1">
                                        </asp:AutoCompleteExtender>
                                    </div>
                                    <div class="bouton">
                                        <asp:Button ID="btnAccepter" runat="server" Text="Rechercher" onClick="actionRecherche" CssClass="btn btn-primary btn-small" />
                                    </div>                   
                                </div>
                            </div>
                            <br />

                        <asp:ListView ID="lvMembre" runat="server" DataSourceID="dsListView" DataKeyNames="idMembre">
                            <LayoutTemplate>
                                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                            </LayoutTemplate>
                            <ItemTemplate>
                            <div class="infoClient">
                                <div class="partiGaucheCourrielEdit">
                                    <div class="formatZone">
                                        <asp:Label ID="lblNouveauCourriel" runat="server" Text="Voici le membre à modifier:" ></asp:Label>
                                    </div>
                                </div>
                                <div class="partiDroiteCourrielEdit">
                                    <div class="formatZone">
                                        <asp:Label ID="lblMembre" runat="server" Text='<%# Eval("prenomMembre") + " " + Eval("nomMembre") %>'></asp:Label>
                                    </div>
                                    <div class="bouton">
                                        <asp:Button ID="btnAccepter" runat="server" Text="Modifier le membre" commandName="modifier" CssClass="btn btn-primary btn-small" />
                                    </div> 
                                </div>
                             </div>    
                            </ItemTemplate>
                        </asp:ListView>

                    </div>
                </asp:View>

                <asp:View ID="viewSupprime" runat="server">
                    <div class="contenuStandard">
                        <asp:Label ID="lblTitreSupprime" runat="server" text="Supprimer un Membre" Font-Size="24px" Font-Bold="true"/>
                        <br />
                        <br />
                        <br />
                        <div class="infoClient">
                            <div class="partiGaucheCourrielEdit">
                                    <div class="formatZone">
                                        <asp:Label ID="lblCourrielSupprime" runat="server" Text="Entrez le courriel du membre:"></asp:Label>
                                    </div>
                                </div>
                                <div class="partiDroiteCourrielEdit">
                                    <div class="formatZone">

                                        <asp:TextBox ID="txtCourrielSupprime" runat="server" SkinID="txtBoxYellow" CssClass="search-query" Text=""></asp:TextBox>

                                        <asp:AutoCompleteExtender ID="AutoCompleteExtender2" 
                                            TargetControlID="txtCourrielSupprime" runat="server" ServiceMethod="GetCompletionList" MinimumPrefixLength="1">
                                        </asp:AutoCompleteExtender>

                                    </div>
                                    <div class="bouton">
                                        <asp:Button ID="btnRecherche" runat="server" Text="Rechercher" onClick="actionRecherche" CssClass="btn btn-primary btn-small" />
                                        <br />
                                        <br />
                                        <asp:Label ID="lblSupprime" runat="server" Text="Le membre à été supprimé!" Visible="false"  ForeColor="Green" Font-Bold="True"></asp:Label>
                                    </div>                   
                                </div>
                            </div>
                            <br />

                        <asp:ListView ID="lvMembreSupprime" runat="server" DataSourceID="dsListView" DataKeyNames="idMembre">
                            <LayoutTemplate>
                                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                            </LayoutTemplate>
                            <ItemTemplate>
                            <div class="infoClient">
                                <div class="partiGaucheCourrielEdit">
                                    <div class="formatZone">
                                        <asp:Label ID="lblNouveauCourriel" runat="server" Text="Voici le membre à supprimer:" ></asp:Label>
                                    </div>
                                </div>
                                <div class="partiDroiteCourrielEdit">
                                    <div class="formatZone">
                                        <asp:Label ID="lblMembre" runat="server" Text='<%# Eval("prenomMembre") + " " + Eval("nomMembre") %>'></asp:Label>
                                    </div>
                                    <div class="bouton">
                                        <asp:Button ID="btnAccepter" runat="server" Text="Supprimer le membre" commandName="Delete" CssClass="btn btn-primary btn-small" />
                                    </div> 
                                </div>
                             </div>    
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </asp:View>

            </asp:MultiView>

            <div class="groupeBouton" style="clear:both;">
                <div class="boutonGroupeRetour" style="margin-bottom:20px;">
                    <asp:Button ID="Button1" runat="server" Text="Retour page employé" CssClass="btn btn-primary" Width="160px" PostBackUrl="~/Page/Employe/home_employe.aspx" CausesValidation="false"/>
                </div>
            </div>

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

</div>

<asp:EntityDataSource ID="dsMembreAjout" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu"
    EnableFlattening="False" EnableDelete="False" EnableInsert="True" EnableUpdate="False" 
    orderBy="it.idMembre">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsListeRole" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="RoleJeu"
    EnableFlattening="False" EnableDelete="False" EnableInsert="True" EnableUpdate="False" 
    orderBy="it.idRole" Where="it.idRole = 4 or it.idRole = 5">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsListView" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="false" EnableUpdate="True"
    EntityTypeFilter="MembresJeu" 
    where="(@courriel = it.courriel and it.RoleJeu_idRole = 3)">
    <WhereParameters>
        <asp:Parameter Name="courriel" Type="String" defaultValue=""/>
    </WhereParameters>
    </asp:EntityDataSource>

</asp:Content>
