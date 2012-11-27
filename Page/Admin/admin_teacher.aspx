<%@ Page Title="" Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master"
    AutoEventWireup="false" CodeFile="admin_teacher.aspx.vb" Inherits="Page_Admin_admin_teacher_add"
    Theme="Original" %>

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
    <asp:MultiView ID="MVPrincipal" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewAjout" runat="server">
            <asp:Label ID="lblTitreAjout" runat="server" Text="Ajouter un Animateur" Font-Size="24px"
                Font-Bold="true" />
            <br />
            <br />
            <br />
            <div class="ligneFormulaireAdmin">
                <div class="elementFormulaireTexte">
                    <asp:Label ID="lblCourriel" runat="server" Text="E-mail"></asp:Label></div>
                <div class="elementFormulaireAdmin" style="width:250px;">
                    <asp:TextBox ID="txtCourriel" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                        MaxLength="50"></asp:TextBox></div>
                <div class="validation">
                    <asp:RequiredFieldValidator ID="requiredCourriel" runat="server" ErrorMessage="*L'adresse courriel est obligatoire"
                        ControlToValidate="txtCourriel" ForeColor="Red" Display="Dynamic" ValidationGroup="animateur">!</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regExCourriel" runat="server" ErrorMessage="*Veuillez entrer une adresse dans le format adresse@courriel.com"
                        ControlToValidate="txtCourriel" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        Display="Dynamic" ValidationGroup="animateur">!</asp:RegularExpressionValidator>
                    <asp:Label ID="lblErreurEmail" runat="server" Text="L'adresse courriel existe déjà"
                        ForeColor="Red" Visible="false" Display="Dynamic" ValidationGroup="animateur"></asp:Label>
                </div>
            </div>
            <div class="ligneFormulaireAdmin">
                <div class="elementFormulaireTexte">
                    <asp:Label ID="lblPrenom" runat="server" Text="Prénom"></asp:Label></div>
                <div class="elementFormulaireAdmin">
                    <asp:TextBox ID="txtPrenom" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                        MaxLength="25"></asp:TextBox></div>
                <div class="validation">
                    <asp:RequiredFieldValidator ID="requiredPrenom" runat="server" ErrorMessage="*Le prénom est obligatoire"
                        ControlToValidate="txtPrenom" ForeColor="Red" Display="Dynamic" ValidationGroup="animateur">!</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ligneFormulaireAdmin">
                <div class="elementFormulaireTexte">
                    <asp:Label ID="lblNom" runat="server" Text="Nom"></asp:Label></div>
                <div class="elementFormulaireAdmin">
                    <asp:TextBox ID="txtNom" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                        MaxLength="25"></asp:TextBox></div>
                <div class="validation">
                    <asp:RequiredFieldValidator ID="requiredNom" runat="server" ErrorMessage="*Le nom est obligatoire"
                        ControlToValidate="txtNom" ForeColor="Red" Display="Dynamic" ValidationGroup="animateur">!</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ligneFormulaireAdmin">
                <div class="elementFormulaireTexte">
                    <asp:Label ID="lblSexe" runat="server" Text="Sexe"></asp:Label></div>
                <div class="elementFormulaireAdmin">
                    <asp:RadioButtonList ID="rdbtnSexe" runat="server" RepeatDirection="Horizontal" Width="200px">
                        <asp:ListItem Text="Homme" Value="H" Selected="true"></asp:ListItem>
                        <asp:ListItem Text="Femme" Value="F"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="ligneFormulaireAdmin">
                <div class="elementFormulaireTexte">
                    <asp:Label ID="lblAdresse" runat="server" Text="Adresse"></asp:Label></div>
                <div class="elementFormulaireAdmin">
                    <asp:TextBox ID="txtAdresse" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                        MaxLength="40"></asp:TextBox></div>
                <div class="validation">
                    <asp:RequiredFieldValidator ID="requiredAdresse" runat="server" ErrorMessage="*L'adresse est obligatoire"
                        ControlToValidate="txtAdresse" ForeColor="Red" Display="Dynamic" ValidationGroup="animateur">!</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ligneFormulaireAdmin">
                <div class="elementFormulaireTexte">
                    <asp:Label ID="lblVille" runat="server" Text="Ville"></asp:Label></div>
                <div class="elementFormulaireAdmin">
                    <asp:TextBox ID="txtVille" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                        MaxLength="25"></asp:TextBox></div>
                <div class="validation">
                    <asp:RequiredFieldValidator ID="requiredVille" runat="server" ErrorMessage="*La ville est obligatoire"
                        ControlToValidate="txtVille" ForeColor="Red" Display="Dynamic" ValidationGroup="animateur">!</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ligneFormulaireAdmin">
                <div class="elementFormulaireTexte">
                    <asp:Label ID="lblDateNaissance" runat="server" Text="Date de naissance"></asp:Label></div>
                <div class="elementFormulaireAdmin">
                    <asp:TextBox ID="txtDate" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue"
                        MaxLength="10" ForeColor="Red" Width="72px"></asp:TextBox>
                </div>
                <div class="validation">
                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ErrorMessage="*La date de naissance est obligatoire"
                    ControlToValidate="txtDate" ForeColor="Red" Display="Dynamic" ValidationGroup="animateur">!</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regExDate" runat="server" ErrorMessage="*Votre date n'est pas dans le format aaaa/mm/jj"
                    ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$"
                    Display="Dynamic" ControlToValidate="txtDate" ForeColor="Red" ValidationGroup="animateur">!</asp:RegularExpressionValidator>
                    </div>
            </div>
            <div class="ligneFormulaireAdmin">
                <div class="elementFormulaireTexte">
                    <asp:Label ID="lblTelephone" runat="server" Text="Téléphone"></asp:Label></div>
                <div class="elementFormulaireAdmin">
                    <asp:TextBox ID="txtTelephone" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                        Width="100px" MaxLength="13"></asp:TextBox></div>
                <div class="validation">
                    <asp:RegularExpressionValidator ID="regExTelephone" runat="server" Display="Dynamic"
                        ErrorMessage="*Entrer un numéro de téléphone dans le format suivant (123)456-7890"
                        ForeColor="Red" ControlToValidate="txtTelephone" ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[0-9]{3}[\-]{1}[0-9]{4})$" ValidationGroup="animateur">!</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="requiredTelephone" runat="server" ErrorMessage="*Le téléphone est obligatoire"
                        ControlToValidate="txtTelephone" ForeColor="Red" Display="Dynamic" ValidationGroup="animateur">!</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ligneFormulaireAdmin">
                <div class="elementFormulaireTexte">
                    <asp:Label ID="lblCodePostal" runat="server" Text="Code Postal"></asp:Label></div>
                <div class="elementFormulaireAdmin">
                    <asp:TextBox ID="txtCodePostal" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                        Width="80px"></asp:TextBox></div>
                <div class="validation">
                    <asp:RegularExpressionValidator ID="regExCodePostal" runat="server" ErrorMessage="*Veuillez entrer un code postal dans le format A1A 1A1"
                        ForeColor="Red" Display="Dynamic" ControlToValidate="txtCodePostal" ValidationExpression="[A-Z]\d[A-Z] \d[A-Z]\d" ValidationGroup="animateur">!</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="requiredCodePostal" runat="server" ErrorMessage="*Le code postal est obligatoire"
                        ControlToValidate="txtCodePostal" Display="Dynamic" ForeColor="Red" ValidationGroup="animateur">!</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ligneFormulaireAdmin">
                <div class="elementFormulaireTexte">
                    <asp:Label ID="lblMDP" runat="server" Text="Mot de passe"></asp:Label></div>
                <div class="elementFormulaireAdmin">
                    <asp:TextBox ID="txtMDP" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                        MaxLength="20" TextMode="Password"></asp:TextBox></div>
                <div class="validation">
                    <asp:RegularExpressionValidator ID="regExMDP" runat="server" ErrorMessage="*Votre mot de passe doit contenir entre 8 et 20 caractère"
                        ControlToValidate="txtMDP" ForeColor="Red" Display="Dynamic" ValidationExpression="^[A-Za-z0-9]{8,}$" ValidationGroup="animateur">!</asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="requiredMDP" Display="Dynamic" runat="server" ErrorMessage="*Le mot de passe est obligatoire"
                        ControlToValidate="txtMDP" ForeColor="Red" ValidationGroup="animateur">!</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="ligneFormulaireAdmin">
                <div class="elementFormulaireTexte">
                    <asp:Label ID="lblMDPConfirm" runat="server" Text="Confirmation du mot de passe"></asp:Label></div>
                <div class="elementFormulaireAdmin">
                    <asp:TextBox ID="txtMDPConfirm" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                        TextMode="Password"></asp:TextBox></div>
                <div class="validation">
                    <asp:CompareValidator ID="compareMDPConfirm" Display="Dynamic" runat="server" ErrorMessage="*Votre mot de passe ne correspond pas"
                        ForeColor="Red" ControlToCompare="txtMDP" ControlToValidate="txtMDPConfirm" ValidationGroup="animateur">!</asp:CompareValidator>
                    <asp:RequiredFieldValidator Display="Dynamic" ID="requiredMDPConfirm" runat="server"
                        ErrorMessage="*Veuillez confirmez votre mot de passe" ControlToValidate="txtMDPConfirm"
                        ForeColor="Red" ValidationGroup="animateur">!</asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="validationListe">
                    <asp:ValidationSummary ID="ValidationInfo" ValidationGroup="animateur" DisplayMode="List" ForeColor="Red" runat="server" />
                </div>

            <div class="bouton" style="margin-left:270px;">
                    <asp:Button ID="btnAjouter" runat="server" Text="Ajouter l'animateur" CssClass="btn btn-primary btn-large btn"
                        OnClick="ajouterEmployeClick" ValidationGroup="animateur"/>
            </div>
        </asp:View>
        <asp:View ID="viewModifie" runat="server">
            <asp:Label ID="lblTitreModifie" runat="server" Text="Modifier un Animateur" Font-Size="24px"
                Font-Bold="true" />
            <br />
            <br />
            <br />
            <div class="ligneFormulaireAdmin">
                <div class="elementFormulaireTexte">
                    <asp:Label ID="lblChoisirAnimateur" runat="server" Text="Choisissez l'animateur"></asp:Label>
                </div>
                <div class="elementFormulaireAdmin">
                    <asp:DropDownList ID="dropDownAnimateur" runat="server" Width="250px" SkinID="ddlBlue"
                        DataSourceID="dsDropDownAnimateur" DataValueField="idMembre" AppendDataBoundItems="False"
                        AutoPostBack="True" DataTextField="FullName" OnSelectedIndexChanged="changeAnimateur" />
                </div>
            </div>

            <div class="sectionAdmin">
                <div class="sectionTitreAdmin">
                    <asp:Label ID="infoPersonnel" runat="server" Text="Informations personnels"></asp:Label>
                </div>
            </div>
            <asp:ListView ID="lvInfoMembre" runat="server" DataSourceID="dsAnimateurInfo" DataKeyNames="idMembre">
                <LayoutTemplate>
                    <div class="infoAdmin">
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="sectionInfo">
                        <div class="partiGauche">
                            <asp:Label ID="lblNom" runat="server" Text="Nom:"></asp:Label>
                            </br>
                            <asp:Label ID="lblAdresse" runat="server" Text="Adresse:"></asp:Label>
                            </br>
                            <asp:Label ID="lblTelephone" runat="server" Text="Téléphone:"></asp:Label>
                            </br>
                            <asp:Label ID="lblNaissance" runat="server" Text="Date de naissance:"></asp:Label>
                        </div>
                        <div class="partiDroite">
                            <asp:Label ID="lblNomClient" runat="server" Text='<%# Eval("nomMembre") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblAdresseClient" runat="server" Text='<%# Eval("adresse") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblTelephoneClient" runat="server" Text='<%# Eval("telephoneMembre") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblNaissanceClient" runat="server" Text='<%# (CType(Eval("dateNaissance"),DateTime)).ToShortDateString %>'></asp:Label>
                            </br>
                        </div>
                    </div>
                    <div class="sectionInfo">
                        <div class="partiGauche">
                            <asp:Label ID="lblPrenom" runat="server" Text="Prénom:"></asp:Label>
                            </br>
                            <asp:Label ID="lblPostal" runat="server" Text="Code postal:"></asp:Label>
                            </br>
                            <asp:Label ID="lblVille" runat="server" Text="Ville:"></asp:Label>
                            </br>
                            <asp:Label ID="lblDateInscription" runat="server" Text="Date d'inscription:"></asp:Label>
                        </div>
                        <div class="partiDroite">
                            <asp:Label ID="lblPrenomClient" runat="server" Text='<%# Eval("prenomMembre") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblVilleClient" runat="server" Text='<%# Eval("ville") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblPostalClient" runat="server" Text='<%# Eval("codePostal") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblDateInscriptionClient" runat="server" Text='<%# (CType(Eval("dateInscription"),DateTime)).ToShortDateString %>'></asp:Label>
                        </div>
                    </div>
                    <div class="bouton">
                        <asp:Button ID="btnModifier" runat="server" CommandName="Edit" Text="Modifier les informations"
                            CssClass="btn btn-primary" OnClick="changeAnimateur" />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div>
                        <div class="partiGauche" style="width:180px;">
                            <div class="formatZone">
                                <asp:Label ID="lblPrenom" runat="server" Text="Prénom:"></asp:Label>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:Label ID="lblNom" runat="server" Text="Nom:"></asp:Label>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:Label ID="lblAdresse" runat="server" Text="Adresse:"></asp:Label>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:Label ID="lblVille" runat="server" Text="Ville:"></asp:Label>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:Label ID="lblNaissance" runat="server" Text="Date de naissance:"></asp:Label>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:Label ID="lblTelephone" runat="server" Text="Téléphone:"></asp:Label>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:Label ID="lblPostal" runat="server" Text="Code postal:"></asp:Label>
                            </div>
                        </div>
                        <div class="partiDroite">
                            <div class="formatZone">
                                <asp:TextBox ID="txtPrenomClient" SkinID="txtBoxYellow" runat="server" CssClass="search-query"
                                    Text='<%# Bind("prenomMembre") %>'></asp:TextBox>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:TextBox ID="txtNomClient" runat="server" SkinID="txtBoxYellow" CssClass="search-query"
                                    Text='<%# Bind("nomMembre") %>'></asp:TextBox>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:TextBox ID="txtAdresseClient" runat="server" SkinID="txtBoxYellow" CssClass="search-query"
                                    Text='<%# Bind("adresse") %>'></asp:TextBox>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:TextBox ID="txtVilleClient" SkinID="txtBoxYellow" runat="server" CssClass="search-query"
                                    Text='<%# Bind("ville") %>'></asp:TextBox>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:TextBox ID="txtDate" runat="server" CssClass="datepicker search-query" SkinID="txtBoxYellow"
                                    MaxLength="10" Width="80px" ForeColor="Red" Text='<%# Bind("dateNaissance", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:TextBox ID="txtTelephoneClient" runat="server" SkinID="txtBoxYellow" CssClass="search-query"
                                    Text='<%# Bind("telephoneMembre") %>' MaxLength="13" Width="100px"></asp:TextBox>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:TextBox ID="txtPostalClient" SkinID="txtBoxYellow" runat="server" CssClass="search-query"
                                    Text='<%# Bind("codePostal") %>' MaxLength="7" Width="65px"></asp:TextBox>
                            </div>
                            </br>
                        </div>
                        <div class="validation">
                            <div class="formatZone">
                                <asp:RequiredFieldValidator ID="requiredPrenom" runat="server" ErrorMessage="*Le prénom est obligatoire"
                                    ControlToValidate="txtPrenomClient" ForeColor="Red" ValidationGroup="infoPerso">!</asp:RequiredFieldValidator>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:RequiredFieldValidator ID="requiredNom" runat="server" ErrorMessage="*Le nom est obligatoire"
                                    ControlToValidate="txtNomClient" ForeColor="Red" ValidationGroup="infoPerso">!</asp:RequiredFieldValidator>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:RequiredFieldValidator ID="requiredAdresse" runat="server" ErrorMessage="*L'adresse est obligatoire"
                                    ControlToValidate="txtAdresseClient" ForeColor="Red" ValidationGroup="infoPerso">!</asp:RequiredFieldValidator>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:RequiredFieldValidator ID="requiredVille" runat="server" ErrorMessage="*La ville est obligatoire"
                                    ControlToValidate="txtVilleClient" ForeColor="Red" ValidationGroup="infoPerso">!</asp:RequiredFieldValidator>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" Display="Dynamic" ErrorMessage="*La date de naissance est obligatoire"
                                    ControlToValidate="txtDate" ForeColor="Red">!</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExDate" runat="server" Display="Dynamic" ErrorMessage="*Votre date n'est pas dans le format aaaa/mm/jj"
                                    ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$"
                                    ControlToValidate="txtDate" ForeColor="Red">!</asp:RegularExpressionValidator>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:RegularExpressionValidator ID="regExTelephone" runat="server" Display="Dynamic"
                                    ErrorMessage="*Entrer un numéro de téléphone dans le format suivant (123)456-7890"
                                    ForeColor="Red" ControlToValidate="txtTelephoneClient" ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[0-9]{3}[\-]{1}[0-9]{4})$"
                                    ValidationGroup="infoPerso">!</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="requiredTelephone" runat="server" Display="Dynamic"
                                    ErrorMessage="*Le téléphone est obligatoire" ControlToValidate="txtTelephoneClient"
                                    ForeColor="Red" ValidationGroup="infoPerso">!</asp:RequiredFieldValidator>
                            </div>
                            </br>
                            <div class="formatZone">
                                <asp:RegularExpressionValidator ID="regExCodePostal" runat="server" Display="Dynamic"
                                    ErrorMessage="*Veuillez entrer un code postal dans le format A1A 1A1" ForeColor="Red"
                                    ControlToValidate="txtPostalClient" ValidationExpression="[A-Z]\d[A-Z] \d[A-Z]\d"
                                    ValidationGroup="infoPerso"> !</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="requiredCodePostal" runat="server" Display="Dynamic"
                                    ErrorMessage="*Le code postal est obligatoire" ControlToValidate="txtPostalClient"
                                    ForeColor="Red" ValidationGroup="infoPerso">!</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="validationListe" style="margin-top:10px;">
                            <asp:ValidationSummary ID="ValidationInfo" ValidationGroup="infoPerso" DisplayMode="List"
                                ForeColor="Red" runat="server" />
                        </div>
                        <div class="bouton">
                            <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter"
                                ValidationGroup="infoPerso" CssClass="btn btn-primary btn-small" />
                            <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Annuler" CausesValidation="false"
                                CssClass="btn btn-primary btn-small" />
                        </div>
                    </div>
                </EditItemTemplate>
            </asp:ListView>
            <div class="sectionAdmin">
                <div class="sectionTitreAdmin">
                    <asp:Label ID="lblTitreCourriel" runat="server" Text="Courriel"></asp:Label>
                </div>
            </div>
            <asp:ListView ID="lvCourriel" runat="server" DataSourceID="dsAnimateurModifie" DataKeyNames="idMembre">
                <LayoutTemplate>
                    <div class="infoAdmin">
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="partiGaucheCourriel" style="width:150px;">
                        <asp:Label ID="lblCourriel" runat="server" Text="Votre courriel:" Font-Bold="True"></asp:Label>
                        </br>
                    </div>
                    <div class="partiDroiteCourriel">
                        <asp:Label ID="lblCourrielClient" runat="server" Text='<%# Eval("MembresJeu.courriel") %>'></asp:Label>
                        </br>
                    </div>
                    <div class="modifierBouton" style="margin-left: 20px;">
                        <asp:LinkButton ID="btnModifierCourriel" runat="server" Text="Modifier le courriel" OnClick="changeAnimateur"
                            CommandName="Edit"></asp:LinkButton>
                        </br>
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="partiGaucheCourrielEdit" style="width:280px;">
                        <div class="formatZone">
                            <asp:Label ID="lblCourriel" runat="server" Text="Votre présent courriel:"></asp:Label>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:Label ID="lblNouveauCourriel" runat="server" Text="Entrez votre nouveau courriel:"></asp:Label>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:Label ID="lblNouveauCourrielEncore" runat="server" Text="Retapez votre nouveau courriel:"></asp:Label>
                        </div>
                    </div>
                    <div class="partiDroiteCourrielEdit">
                        <div class="formatZone">
                            <asp:Label ID="lblCourrielPresent" runat="server" Text='<%# Eval("MembresJeu.courriel") %>'></asp:Label>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:TextBox ID="txtNouveauCourriel" runat="server" SkinID="txtBoxYellow" CssClass="search-query"
                                Text="" Width="200px"></asp:TextBox>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:TextBox ID="txtNouveauCourrielConfirme" runat="server" SkinID="txtBoxYellow"
                                CssClass="search-query" Text="" Width="200px"></asp:TextBox>
                        </div>
                    </div>
                    <div class="validation">
                        <div class="formatZone">
                            </br>
                        </div>
                        <br />
                        <div class="formatZone">
                            <asp:RequiredFieldValidator ID="courrielRequis" runat="server" ErrorMessage="*Une addresse courriel est requise!"
                                ControlToValidate='txtNouveauCourriel' ForeColor="Red" Display="Dynamic" ValidationGroup="courriel">!</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regExCourriel" runat="server" ErrorMessage="*Veuillez entrer une adresse dans le format adresse@courriel.com!"
                                ControlToValidate="txtNouveauCourriel" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                Display="Dynamic" ValidationGroup="courriel">!</asp:RegularExpressionValidator>
                            <asp:CustomValidator ID="courrielCompare" runat="server" ControlToValidate="txtNouveauCourriel"
                                OnServerValidate="validationCourriel" ErrorMessage="Ce courriel est déjà utilisé!"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="courriel">!</asp:CustomValidator>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:RequiredFieldValidator ID="courrielRequisConfirme" runat="server" ErrorMessage="*Veuillez confirmer votre courriel!"
                                ControlToValidate='txtNouveauCourrielConfirme' ForeColor="Red" Display="Dynamic"
                                ValidationGroup="courriel">!</asp:RequiredFieldValidator>
                            <asp:CompareValidator Display="Dynamic" ID="CompareCourriel" runat="server" ErrorMessage="*Votre courriel ne correspond pas!"
                                ForeColor="Red" ControlToCompare="txtNouveauCourriel" ControlToValidate="txtNouveauCourrielConfirme"
                                ValidationGroup="courriel">!</asp:CompareValidator>
                        </div>
                    </div>
                    <div class="validationListe" style="margin-top:10px;">
                        <asp:ValidationSummary ID="ValidationInfo" ValidationGroup="courriel" DisplayMode="List"
                            ForeColor="Red" runat="server" />
                    </div>
                    <div class="boutonAdmin" style="margin-left: 350px;">
                        <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter"
                            CssClass="btn btn-primary btn-small" ValidationGroup="courriel" />
                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" CausesValidation="false"
                            Text="Annuler" CssClass="btn btn-primary btn-small" />
                    </div>
                </EditItemTemplate>
            </asp:ListView>
            <div class="sectionAdmin">
                <div class="sectionTitreAdmin">
                    <asp:Label ID="lblTitreMotPasse" runat="server" Text="Mot de passe"></asp:Label>
                </div>
            </div>
            <asp:ListView ID="lvMotPasse" runat="server" DataSourceID="dsAnimateurModifie" DataKeyNames="idMembre">
                <LayoutTemplate>
                    <div class="infoAdmin">
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="modifierBouton">
                        <asp:LinkButton ID="btnModifierMP" runat="server" CommandName="Edit" Text="Changer votre mot de passe" OnClick="changeAnimateur"></asp:LinkButton>
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="partiGaucheMotPasse" style="width:300px;">
                        <div class="formatZone">
                            <asp:Label ID="lblMP" runat="server" Text="Présent mot de passe:"></asp:Label>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:Label ID="lblNouveauMP" runat="server" Text="Nouveau mot de passe:"></asp:Label>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:Label ID="lblNouveauMPEncore" runat="server" Text="Retapez nouveau mot de passe:"></asp:Label>
                        </div>
                    </div>
                    <div class="partiDroiteMotPasse">
                        <div class="formatZone">
                            <asp:TextBox ID="txtPresentMP" runat="server" SkinID="txtBoxYellow" CssClass="search-query"
                                Text="" TextMode="Password"></asp:TextBox>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:TextBox ID="txtNouveauMP" runat="server" SkinID="txtBoxYellow" CssClass="search-query"
                                Text="" TextMode="Password"></asp:TextBox>
                        </div>
                        </br>
                        <div class="formatZone">
                            <asp:TextBox ID="txtNouveauMPConfirm" runat="server" SkinID="txtBoxYellow" CssClass="search-query"
                                Text="" TextMode="Password"></asp:TextBox>
                        </div>
                    </div>
                    <div class="validation" style="margin-top:10px;">
                        <div class="formatZone">
                            <asp:RequiredFieldValidator ID="motPasseValideRequis" runat="server" ErrorMessage="*Veuillez entrer votre présent mot de passe!"
                                ControlToValidate='txtPresentMP' ForeColor="Red" Display="Dynamic" ValidationGroup="motPasse">!</asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="motPasseCompare" runat="server" ControlToValidate="txtPresentMP"
                                OnServerValidate="validationMotPasse" ErrorMessage="Votre mot de passe est incorrect!"
                                ForeColor="Red" Display="Dynamic" ValidationGroup="motPasse">!</asp:CustomValidator>
                        </div>
                        </br>
                        <div class="formatZone" style="margin-top: 5px;">
                            <asp:RegularExpressionValidator ID="regExMDP" runat="server" ErrorMessage="*Votre mot de passe doit contenir entre 8 et <br/> 20 caractère"
                                ControlToValidate="txtNouveauMP" ForeColor="Red" Display="Dynamic" ValidationExpression="^[A-Za-z0-9]{8,}$"
                                ValidationGroup="motPasse">!</asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="motPasseRequis" runat="server" ErrorMessage="*Un mot de passe est requis!"
                                ControlToValidate='txtNouveauMP' ForeColor="Red" Display="Dynamic" ValidationGroup="motPasse">!</asp:RequiredFieldValidator>
                        </div>
                        </br>
                        <div class="formatZone" style="margin-top: 5px;">
                            <asp:CompareValidator Display="Dynamic" ID="CompareMP" runat="server" ErrorMessage="*Votre mot de passe ne correspond pas"
                                ForeColor="Red" ControlToCompare="txtNouveauMP" ControlToValidate="txtNouveauMPConfirm"
                                ValidationGroup="motPasse">!</asp:CompareValidator>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="requiredMDPConfirm" runat="server"
                                ErrorMessage="*Veuillez confirmez votre mot de passe" ControlToValidate="txtNouveauMPConfirm"
                                ForeColor="Red" ValidationGroup="motPasse">!</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="validationListe" style="margin-top:10px;">
                        <asp:ValidationSummary ID="ValidationInfo" ValidationGroup="motPasse" DisplayMode="List"
                            ForeColor="Red" runat="server" />
                    </div>
                    <div class="bouton" style="margin-left: 350px;">
                        <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter"
                            CssClass="btn btn-primary btn-small" ValidationGroup="motPasse" />
                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" CausesValidation="false"
                            Text="Annuler" CssClass="btn btn-primary btn-small" />
                    </div>
                </EditItemTemplate>
            </asp:ListView>
        </asp:View>
        <asp:View ID="viewSupprime" runat="server">
            <asp:Label ID="lblTitreSupprime" runat="server" Text="Supprimer un Animateur" Font-Size="24px"
                Font-Bold="true" />
            <br />
            <br />
            <br />
            <asp:ListView ID="lvAnimateur" runat="server" DataSourceID="dsAnimateurSupprime"
                DataKeyNames="idMembre, idAnimateur">
                <LayoutTemplate>
                    <div class="coursAnimateur">
                        <div class="blockNomAnimateur1">
                            <b>Nom de l'employé </b>
                        </div>
                        <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="blockNomAnimateur2">
                        <asp:Label ID="lblprenomEmploye" runat="server" Text='<%# Eval("MembresJeu.prenomMembre ") %>'></asp:Label>
                        <asp:Label ID="lblNomEmploye" runat="server" Text='<%# Eval("MembresJeu.nomMembre ") %>'></asp:Label>
                        <asp:ImageButton ID="imgDelete" CommandArgument='<%#Eval("idMembre")%>' CssClass="boutonFloatRight"
                            ImageUrl="~/App_Themes/Original/img/delete.png" OnClientClick="return confirm('Etes-vous certain?');"
                            CommandName="Delete" runat="server" Width="20px" Height="20px" OnClick="DeletingMemberID" />
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </asp:View>
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

    <asp:EntityDataSource ID="dsAnimateurInfo" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu"
        EnableFlattening="False" EnableDelete="true" EnableInsert="true" EnableUpdate="true"
        OrderBy="it.idMembre" Where="(@MembreID = it.idMembre)">
        <WhereParameters>
            <asp:ControlParameter Name="MembreID" ControlID="dropDownAnimateur" PropertyName="SelectedValue"
                Type="Int32" DefaultValue="0" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsAnimateurModifie" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu_Animateur"
        EnableFlattening="False" EnableDelete="true" EnableInsert="true" EnableUpdate="true"
        OrderBy="it.idMembre" Include="MembresJeu" Where="(@MembreID = it.idMembre)">
        <WhereParameters>
            <asp:ControlParameter Name="MembreID" ControlID="dropDownAnimateur" PropertyName="SelectedValue"
                Type="Int32" DefaultValue="0" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsAnimateurSupprime" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu_Animateur"
        EnableFlattening="false" EnableDelete="true" EnableInsert="false" Include="MembresJeu,CoursJeu"
        EnableUpdate="true">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsDropDownAnimateur" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu_Animateur"
        EnableFlattening="false" EnableDelete="false" EnableInsert="false" EnableUpdate="false"
        Select="it.idAnimateur, it.idMembre,(it.MembresJeu.[prenomMembre]+' '+it.MembresJeu.[nomMembre]) as FullName">
    </asp:EntityDataSource>
</asp:Content>
