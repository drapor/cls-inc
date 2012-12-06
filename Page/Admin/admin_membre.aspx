<%@ Page Language="VB" AutoEventWireup="false" MasterPageFile="~/Page/Admin/MasterPageAdmin.master"
    CodeFile="admin_membre.aspx.vb" Inherits="Page_Admin_admin_membre" Theme="Original" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="Server">
    <asp:MultiView ID="MVPrincipal" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewAjout" runat="server">
                <asp:Label ID="lblTitreAjout" runat="server" Text="Ajouter un Membre" Font-Size="24px"
                    Font-Bold="true" />
                <br />
                <br />
                <br />
                <asp:ListView ID="lvNouveauMembre" runat="server" DataSourceID="dsMembreAjout" DataKeyNames="idMembre"
                    InsertItemPosition="LastItem" ItemPlaceholderID="itemPlaceHolder">
                    <LayoutTemplate>
                        <div class="containerFormulaire">
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                    </ItemTemplate>
                    <InsertItemTemplate>
                        <div class="ligneFormulaireAdmin">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblCourriel" runat="server" Text="E-mail(*)"></asp:Label></div>
                            <div class="elementFormulaireAdmin">
                                <asp:TextBox ID="txtCourriel" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    MaxLength="50" Text='<%# Bind("courriel") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredCourriel" runat="server" ErrorMessage="*L'adresse courriel est obligatoire"
                                    ControlToValidate="txtCourriel" ForeColor="Red" Display="Dynamic" ValidationGroup="membre">!</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExCourriel" runat="server" ErrorMessage="*Veuillez entrer une adresse dans le format adresse@courriel.com"
                                    ControlToValidate="txtCourriel" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    Display="Dynamic" ValidationGroup="membre">!</asp:RegularExpressionValidator>
                                <asp:CustomValidator ID="courrielCompare" runat="server" ControlToValidate="txtCourriel"
                                    OnServerValidate="validationCourriel" ErrorMessage="Ce courriel est déjà utilisé!"
                                    ForeColor="Red" Display="Dynamic" ValidationGroup="membre">!</asp:CustomValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaireAdmin">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblPrenom" runat="server" Text="Prénom(*)"></asp:Label></div>
                            <div class="elementFormulaireAdmin">
                                <asp:TextBox ID="txtPrenom" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    MaxLength="25" Text='<%# Bind("prenomMembre") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredPrenom" runat="server" ErrorMessage="*Le prénom est obligatoire"
                                    ControlToValidate="txtPrenom" ForeColor="Red" Display="Dynamic" ValidationGroup="membre">!</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaireAdmin">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblNom" runat="server" Text="Nom(*)"></asp:Label></div>
                            <div class="elementFormulaireAdmin">
                                <asp:TextBox ID="txtNom" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    MaxLength="25" Text='<%# Bind("nomMembre") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredNom" runat="server" ErrorMessage="*Le nom est obligatoire"
                                    ControlToValidate="txtNom" ForeColor="Red" Display="Dynamic" ValidationGroup="membre">!</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaireAdmin">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblSexe" runat="server" Text="Sexe"></asp:Label></div>
                            <div class="elementFormulaireAdmin">
                                <asp:RadioButtonList ID="rdbtnSexe" runat="server" RepeatDirection="Horizontal" Width="200px"
                                    SelectedValue='<%# Bind("sexe") %>'>
                                    <asp:ListItem Text="Homme" Value="H" Selected="true"></asp:ListItem>
                                    <asp:ListItem Text="Femme" Value="F"></asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="ligneFormulaireAdmin">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblAdresse" runat="server" Text="Adresse(*)"></asp:Label></div>
                            <div class="elementFormulaireAdmin">
                                <asp:TextBox ID="txtAdresse" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    MaxLength="40" Text='<%# Bind("adresse") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredAdresse" runat="server" ErrorMessage="*L'adresse est obligatoire"
                                    ControlToValidate="txtAdresse" ForeColor="Red" Display="Dynamic" ValidationGroup="membre">!</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaireAdmin">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblVille" runat="server" Text="Ville(*)"></asp:Label></div>
                            <div class="elementFormulaireAdmin">
                                <asp:TextBox ID="txtVille" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    MaxLength="25" Text='<%# Bind("ville") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredVille" runat="server" ErrorMessage="*La ville est obligatoire"
                                    ControlToValidate="txtVille" ForeColor="Red" Display="Dynamic" ValidationGroup="membre">!</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaireAdmin">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblDateNaissance" runat="server" Text="Date de naissance(*)"></asp:Label></div>
                            <div class="elementFormulaireAdmin">
                                <asp:TextBox ID="txtDate" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue"
                                    MaxLength="10" Text='<%# Bind("dateNaissance", "{0:yyyy/MM/dd}") %>' Width="75px"></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ErrorMessage="*La date de naissance est obligatoire"
                                    ControlToValidate="txtDate" ForeColor="Red" Display="Dynamic" ValidationGroup="membre">!</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExDate" runat="server" ErrorMessage="*Votre date n'est pas dans le format aaaa/mm/jj"
                                    ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$"
                                    Display="Dynamic" ControlToValidate="txtDate" ForeColor="Red" ValidationGroup="membre">!</asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaireAdmin">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblTelephone" runat="server" Text="Téléphone(*)"></asp:Label></div>
                            <div class="elementFormulaireAdmin">
                                <asp:TextBox ID="txtTelephone" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    MaxLength="13" Text='<%# Bind("telephoneMembre") %>' Width="95px"></asp:TextBox></div>
                            <div class="validation">
                                <asp:RegularExpressionValidator ID="regExTelephone" runat="server" Display="Dynamic"
                                    ErrorMessage="*Entrer un numéro de téléphone dans le format suivant (123)456-7890"
                                    ForeColor="Red" ControlToValidate="txtTelephone" ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[0-9]{3}[\-]{1}[0-9]{4})$"
                                    ValidationGroup="membre">!</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="requiredTelephone" runat="server" ErrorMessage="*Le téléphone est obligatoire"
                                    ControlToValidate="txtTelephone" ForeColor="Red" Display="Dynamic" ValidationGroup="membre">!</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaireAdmin">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblCodePostal" runat="server" Text="Code Postal(*)"></asp:Label></div>
                            <div class="elementFormulaireAdmin">
                                <asp:TextBox ID="txtCodePostal" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    Width="60px" Text='<%# Bind("codePostal") %>' MaxLength="7"></asp:TextBox></div>
                            <div class="validation">
                                <asp:RegularExpressionValidator ID="regExCodePostal" runat="server" ErrorMessage="*Veuillez entrer un code postal dans le format A1A 1A1"
                                    ForeColor="Red" Display="Dynamic" ControlToValidate="txtCodePostal" ValidationExpression="[A-Z]\d[A-Z] \d[A-Z]\d"
                                    ValidationGroup="membre">!</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="requiredCodePostal" runat="server" ErrorMessage="*Le code postal est obligatoire"
                                    ControlToValidate="txtCodePostal" Display="Dynamic" ForeColor="Red" ValidationGroup="membre">!</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaireAdmin">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblMDP" runat="server" Text="Mot de passe(*)"></asp:Label></div>
                            <div class="elementFormulaireAdmin">
                                <asp:TextBox ID="txtMDP" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    MaxLength="20" TextMode="Password" Text='<%# Bind("motPasse") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RegularExpressionValidator ID="regExMDP" runat="server" ErrorMessage="*Votre mot de passe doit contenir entre 8 et 20 caractère"
                                    ControlToValidate="txtMDP" ForeColor="Red" Display="Dynamic" ValidationExpression="^[A-Za-z0-9]{8,}$"
                                    ValidationGroup="membre">!</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="requiredMDP" Display="Dynamic" runat="server" ErrorMessage="*Le mot de passe est obligatoire"
                                    ControlToValidate="txtMDP" ForeColor="Red" ValidationGroup="membre">!</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaireAdmin">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblMDPConfirm" runat="server" Text="Confirmation du mot de passe(*)"></asp:Label></div>
                            <div class="elementFormulaireAdmin">
                                <asp:TextBox ID="txtMDPConfirm" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    TextMode="Password"></asp:TextBox></div>
                            <div class="validation">
                                <asp:CompareValidator ID="compareMDPConfirm" Display="Dynamic" runat="server" ErrorMessage="*Votre mot de passe ne correspond pas"
                                    ForeColor="Red" ControlToCompare="txtMDP" ControlToValidate="txtMDPConfirm" ValidationGroup="membre">!</asp:CompareValidator>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="requiredMDPConfirm" runat="server"
                                    ErrorMessage="*Veuillez confirmez votre mot de passe" ControlToValidate="txtMDPConfirm"
                                    ForeColor="Red" ValidationGroup="membre">!</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="validationListe">
                            <asp:ValidationSummary ID="ValidationInfo" ValidationGroup="membre" DisplayMode="List"
                                ForeColor="Red" runat="server" />
                        </div>
                        <div class="bouton" style="margin-left: 270px;">
                            <asp:Button ID="btnAjouter" runat="server" CommandName="Insert" Text="Ajouter le membre"
                                CssClass="btn btn-primary btn-large btn" ValidationGroup="membre" />
                        </div>
                    </InsertItemTemplate>
                </asp:ListView>
        </asp:View>
        <asp:View ID="viewModifie" runat="server">
            <asp:Label ID="lblType" runat="server" Text="Trier selon:"></asp:Label>
            <asp:DropDownList ID="dropDownType" runat="server" Width="250px" SkinID="ddlBlue"
                AutoPostBack="True">
                <asp:ListItem Value="0" Text="Nom de  famille" Selected="True"></asp:ListItem>
                <asp:ListItem Value="1" Text="Courriel"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <div id="contentStart">
                <asp:MultiView ID="MVListe" runat="server" ActiveViewIndex="0">
                    <asp:View ID="viewNom" runat="server">
                        <asp:Label ID="lblEmployeNom" runat="server" Text="Liste des Clients triés par nom de famille"
                            Font-Size="20px" Font-Bold="true" />
                        <br />
                        <br />
                        <asp:ListView ID="lvEmployeNom" runat="server" DataSourceID="dsMembre" DataKeyNames="idMembre">
                            <LayoutTemplate>
                                <table align="center" style="width: 100%; border: 1px solid #000000; font-weight: bolder;">
                                    <tr style="background-color: #1800B8; color: White; font-size: 14px;">
                                        <th style="border: 1px solid #000000; width: 15%;">
                                            <asp:Label ID="lblNom" runat="server" Text="Nom"></asp:Label>
                                        </th>
                                        <th style="border: 1px solid #000000; width: 15%; padding: 5px;">
                                            <asp:Label ID="lblPrenom" runat="server" Text="Prénom"></asp:Label>
                                        </th>
                                        <th style="border: 1px solid #000000; width: 25%;">
                                            <asp:Label ID="lblCourriel" runat="server" Text="Courriel"></asp:Label>
                                        </th>
                                        <th style="border: 1px solid #000000; width: 15%;">
                                            <asp:Label ID="lblTelephone" runat="server" Text="Téléphone"></asp:Label>
                                        </th>  
                                        <th style="border: 1px solid #000000; width: 15%;">
                                        </th> 
                                        <th style="border: 1px solid #000000; width: 15%;">
                                        </th>                                 
                                    </tr>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr align="center" class="<%# GetCssName(Container) %>" style="font-size: 10px;">
                                    <th style="border: 1px solid #000000; width: 15%;">
                                        <asp:Label ID="txtNom" runat="server" Text='<%# eval("nomMembre") %>'></asp:Label>
                                    </th>
                                    <th style="border: 1px solid #000000; width: 15%; padding: 5px;">
                                        <asp:Label ID="txtPrenom" runat="server" Text='<%# eval("prenomMembre") %>'></asp:Label>
                                    </th>
                                    <th style="border: 1px solid #000000; width: 25%;">
                                        <asp:Label ID="txtCourriel" runat="server" Text='<%# eval("courriel") %>'></asp:Label>
                                    </th>
                                    <th style="border: 1px solid #000000; width: 15%;">
                                        <asp:Label ID="txtTelephone" runat="server" Text='<%# eval("telephoneMembre") %>'></asp:Label>
                                    </th>
                                    <th style="border: 1px solid #000000; width: 15%;">
                                        <asp:LinkButton ID="btnModifier" runat="server" Text="Modifier"></asp:LinkButton>
                                    </th>
                                    <th style="border: 1px solid #000000; width: 15%;">
                                        <asp:LinkButton ID="btnSupprimer" runat="server" CommandName="Delete" ForeColor="Red" Text="Supprimer"></asp:LinkButton>
                                    </th>
                                    
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </asp:View>
                    <asp:View ID="viewCourriel" runat="server">
                        <asp:Label ID="lblEmployeCourriel" runat="server" Text="Liste des Clients triés par courriel"
                            Font-Size="20px" Font-Bold="true" />
                        <br />
                        <br />
                        <asp:ListView ID="lvEmployeCourriel" runat="server" DataSourceID="dsMembre" DataKeyNames="idMembre">
                            <LayoutTemplate>
                                <table align="center" style="width: 100%; border: 1px solid #000000; font-weight: bolder;">
                                    <tr style="background-color: #1800B8; color: White; font-size: 14px;">
                                        <th style="border: 1px solid #000000; width: 25%;">
                                            <asp:Label ID="lblCourriel" runat="server" Text="Courriel"></asp:Label>
                                        </th>
                                        <th style="border: 1px solid #000000; width: 15%;">
                                            <asp:Label ID="lblNom" runat="server" Text="Nom"></asp:Label>
                                        </th>
                                        <th style="border: 1px solid #000000; width: 15%; padding: 5px;">
                                            <asp:Label ID="lblPrenom" runat="server" Text="Prénom"></asp:Label>
                                        </th>
                                        <th style="border: 1px solid #000000; width: 15%;">
                                            <asp:Label ID="lblTelephone" runat="server" Text="Téléphone"></asp:Label>
                                        </th>   
                                        <th style="border: 1px solid #000000; width: 15%;">
                                        </th> 
                                        <th style="border: 1px solid #000000; width: 15%;">
                                        </th>      
                                    </tr>
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tr align="center" class="<%# GetCssName(Container) %>" style="font-size: 10px;">
                                    <th style="border: 1px solid #000000; width: 25%;">
                                        <asp:Label ID="txtCourriel" runat="server" Text='<%# eval("courriel") %>'></asp:Label>
                                    </th>
                                    <th style="border: 1px solid #000000; width: 15%;">
                                        <asp:Label ID="txtNom" runat="server" Text='<%# eval("nomMembre") %>'></asp:Label>
                                    </th>
                                    <th style="border: 1px solid #000000; width: 15%; padding: 5px;">
                                        <asp:Label ID="txtPrenom" runat="server" Text='<%# eval("prenomMembre") %>'></asp:Label>
                                    </th>
                                   <th style="border: 1px solid #000000; width: 15%;">
                                        <asp:Label ID="txtTelephone" runat="server" Text='<%# eval("telephoneMembre") %>'></asp:Label>
                                    </th>
                                    <th style="border: 1px solid #000000; width: 15%;">
                                        <asp:LinkButton ID="btnModifier" runat="server" Text="Modifier"></asp:LinkButton>
                                    </th>
                                    <th style="border: 1px solid #000000; width: 15%;">
                                        <asp:LinkButton ID="btnSupprimer" runat="server" CommandName="Delete" ForeColor="Red" Text="Supprimer"></asp:LinkButton>
                                    </th>
                                </tr>
                            </ItemTemplate>
                        </asp:ListView>
                    </asp:View>
                </asp:MultiView>
            </div>


            <%--<asp:Label ID="lbltitreModifie" runat="server" text="Modifier un Membre" Font-Size="24px" Font-Bold="true"/>
                        <br />
                        <br />
                        <br />
                        <div class="infoAdmin">
                            <div class="partiGaucheCourrielEdit">
                                    <div class="formatZone">
                                        <asp:Label ID="lblCourriel" runat="server" Text="Entrez le courriel du membre:"></asp:Label>
                                    </div>
                                </div>
                                <div class="partiDroiteCourrielEdit">
                                    <div class="formatZone">

                                        <asp:TextBox ID="txtCourriel" runat="server" SkinID="txtBoxYellow" CssClass="search-query" Text=""></asp:TextBox>

                                        <asp:AutoCompleteExtender ID="AutoCompleteExtender2" 
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
                            <div class="infoAdmin">
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
                        </asp:ListView>--%>
        </asp:View>
        <%--<asp:View ID="viewSupprime" runat="server">
                        <asp:Label ID="lblTitreSupprime" runat="server" text="Supprimer un Membre" Font-Size="24px" Font-Bold="true"/>
                        <br />
                        <br />
                        <br />
                        <div class="infoAdmin">
                            <div class="partiGaucheCourrielEdit">
                                    <div class="formatZone">
                                        <asp:Label ID="lblCourrielSupprime" runat="server" Text="Entrez le courriel du membre:"></asp:Label>
                                    </div>
                                </div>
                                <div class="partiDroiteCourrielEdit">
                                    <div class="formatZone">

                                        <asp:TextBox ID="txtCourrielSupprime" runat="server" SkinID="txtBoxYellow" CssClass="search-query" Text=""></asp:TextBox>

                                        <asp:AutoCompleteExtender ID="AutoCompleteExtender3" 
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
                            <div class="infoAdmin">
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
                </asp:View>--%>
    </asp:MultiView>
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
    <asp:EntityDataSource ID="dsMembreAjout" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
        EnableDelete="False" EnableInsert="True" EnableUpdate="False" OrderBy="it.idMembre">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsListeRole" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="RoleJeu" EnableFlattening="False"
        EnableDelete="False" EnableInsert="True" EnableUpdate="False" OrderBy="it.idRole"
        Where="it.idRole = 4 or it.idRole = 5">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsListView" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="false" EnableUpdate="True" EntityTypeFilter="MembresJeu"
        Where="(@courriel = it.courriel and it.RoleJeu_idRole = 3)">
        <WhereParameters>
            <asp:Parameter Name="courriel" Type="String" DefaultValue="" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsMembre" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" include="RoleJeu" 
        Where="it.RoleJeu_idRole = 3">
    </asp:EntityDataSource>
</asp:Content>
