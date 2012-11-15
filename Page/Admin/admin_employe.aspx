<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_employe.aspx.vb" Inherits="Page_Admin_admin_employe_add" Theme="Original" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="containerContenuAdmin">
            <div class="entetePage">
                <div class="menuPageGauche" style="margin-top:10px;">
                    <asp:Label ID="lblEntete" runat="server" text="Opérations Employés" Font-Size="32px" Font-Bold="true"/>
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
                        <asp:Label ID="lblTitreAjout" runat="server" text="Ajouter un employé" Font-Size="24px" Font-Bold="true"/>
                        <br />
                        <br />
                        <br />
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte"><asp:Label ID="lblCourriel" runat="server" Text="E-mail"></asp:Label></div>
                             <div class="elementFormulaire"><asp:TextBox ID="txtCourriel" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="50"></asp:TextBox></div>
                             <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredCourriel" runat="server" ErrorMessage="*L'adresse courriel est obligatoire" ControlToValidate="txtCourriel" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regExCourriel" runat="server" ErrorMessage="*Veuillez entrer une adresse dans le format adresse@courriel.com" ControlToValidate="txtCourriel" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                            <asp:Label ID="lblErreurEmail" runat="server" Text="L'adresse courriel existe déjà" ForeColor="Red" Visible="false" ></asp:Label>
                            </div>
                        </div>
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte"><asp:Label ID="lblPrenom" runat="server" Text="Prénom"></asp:Label></div>
                             <div class="elementFormulaire"><asp:TextBox ID="txtPrenom" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25"></asp:TextBox></div>
                             <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredPrenom" runat="server" ErrorMessage="*Le prénom est obligatoire" ControlToValidate="txtPrenom" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte"><asp:Label ID="lblNom" runat="server" Text="Nom"></asp:Label></div>
                             <div class="elementFormulaire"><asp:TextBox ID="txtNom" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25"></asp:TextBox></div>
                             <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredNom" runat="server" ErrorMessage="*Le nom est obligatoire" ControlToValidate="txtNom" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte"><asp:Label ID="lblSexe" runat="server" Text="Sexe"></asp:Label></div>
                             <div class="elementFormulaire">
                                 <asp:RadioButtonList ID="rdbtnSexe" runat="server" RepeatDirection="Horizontal" Width="200px">
                                 <asp:ListItem Text="Homme" Value="H" Selected="true"></asp:ListItem>
                                 <asp:ListItem Text="Femme" Value="F"></asp:ListItem>
                                </asp:RadioButtonList>
                             </div>
                        </div>
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte"><asp:Label ID="lblAdresse" runat="server" Text="Adresse"></asp:Label></div>
                             <div class="elementFormulaire"><asp:TextBox ID="txtAdresse" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="40"></asp:TextBox></div>
                             <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredAdresse" runat="server" ErrorMessage="*L'adresse est obligatoire" ControlToValidate="txtAdresse" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte"><asp:Label ID="lblVille" runat="server" Text="Ville"></asp:Label></div>
                             <div class="elementFormulaire"><asp:TextBox ID="txtVille" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25"></asp:TextBox></div>
                             <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredVille" runat="server" ErrorMessage="*La ville est obligatoire" ControlToValidate="txtVille" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte"><asp:Label ID="lblDateNaissance" runat="server" Text="Date de naissance"></asp:Label></div>
                             <div class="elementFormulaire"><asp:TextBox ID="txtDate" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="72px"></asp:TextBox></div>
                            <asp:RequiredFieldValidator ID="requiredDate" runat="server" ErrorMessage="*La date de naissance est obligatoire" ControlToValidate="txtDate" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regExDate" runat="server" ErrorMessage="*Votre date n'est pas dans le format jj/mm/aaaa" ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  " Display="Dynamic" ControlToValidate="txtDate" ForeColor="Red"></asp:RegularExpressionValidator>
                        </div>
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte"><asp:Label ID="lblTelephone" runat="server" Text="Téléphone"></asp:Label></div>
                             <div class="elementFormulaire"><asp:TextBox ID="txtTelephone" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="13" Width="100px"></asp:TextBox></div>
                             <div class="elementFormulaireRequired">
                                 <asp:RegularExpressionValidator ID="regExTelephone" runat="server" Display="Dynamic" ErrorMessage="*Entrer un numéro de téléphone dans le format suivant (123)456-7890" ForeColor="Red" ControlToValidate="txtTelephone" ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[0-9]{3}[\-]{1}[0-9]{4})$"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="requiredTelephone" runat="server" ErrorMessage="*Le téléphone est obligatoire" ControlToValidate="txtTelephone" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte"><asp:Label ID="lblCodePostal" runat="server" Text="Code Postal"></asp:Label></div>
                             <div class="elementFormulaire"><asp:TextBox ID="txtCodePostal" runat="server" CssClass="search-query" SkinID="txtBoxBlue" Width="80px"></asp:TextBox></div>
                             <div class="elementFormulaireRequired">
                                 <asp:RegularExpressionValidator ID="regExCodePostal" runat="server" ErrorMessage="*Veuillez entrer un code postal dans le format A1A 1A1" ForeColor="Red" Display="Dynamic" ControlToValidate="txtCodePostal" ValidationExpression="[A-Z]\d[A-Z] \d[A-Z]\d"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="requiredCodePostal" runat="server" ErrorMessage="*Le code postal est obligatoire" ControlToValidate="txtCodePostal" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte"><asp:Label ID="lblMDP" runat="server" Text="Mot de passe"></asp:Label></div>
                             <div class="elementFormulaire"><asp:TextBox ID="txtMDP" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="20" TextMode="Password"></asp:TextBox></div>
                             <div class="elementFormulaireRequired">
                                 <asp:RegularExpressionValidator ID="regExMDP" runat="server" ErrorMessage="*Votre mot de passe doit contenir entre 8 et 20 caractère" ControlToValidate="txtMDP" ForeColor="Red" Display="Dynamic" ValidationExpression="^[A-Za-z0-9]{8,}$"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="requiredMDP" Display="Dynamic" runat="server" ErrorMessage="*Le mot de passe est obligatoire" ControlToValidate="txtMDP" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaire">   
                             <div class="elementFormulaireTexte"><asp:Label ID="lblMDPConfirm" runat="server" Text="Confirmation du mot de passe"></asp:Label></div>
                             <div class="elementFormulaire"><asp:TextBox ID="txtMDPConfirm" runat="server" CssClass="search-query" SkinID="txtBoxBlue" TextMode="Password"></asp:TextBox></div>
                             <div class="elementFormulaireRequired">
                                 <asp:CompareValidator ID="compareMDPConfirm" runat="server" ErrorMessage="*Votre mot de passe ne correspond pas" ForeColor="Red" ControlToCompare="txtMDP" ControlToValidate="txtMDPConfirm"></asp:CompareValidator>
                            <asp:RequiredFieldValidator Display="Dynamic" ID="requiredMDPConfirm" runat="server" ErrorMessage="*Veuillez confirmez votre mot de passe" ControlToValidate="txtMDPConfirm" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte"><asp:Label ID="lblType" runat="server" Text="Type de compte"></asp:Label></div>
                             <div class="elementFormulaire"><asp:DropDownList ID="dropDownType" runat="server" SkinID="ddlBlue" AppendDataBoundItems="False" CssClass="search-query">
                                 <asp:ListItem Selected="True" Value="2">Employé</asp:ListItem>
                                 <asp:ListItem Value="1">Administrateur</asp:ListItem>
                                 </asp:DropDownList>
                             </div>
                        </div>
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte"></div>
                             <div class="elementFormulaire" style="margin-left:80px; margin-top:20px;">
                                 <asp:Button ID="btnAjouter" runat="server" Text="Ajouter un employé" CssClass="btn btn-primary btn-large btn" OnClick="ajouterEmployeClick"/> 
                             </div>
                        </div>

                        <div class="ligneFormulaire">
                            <div class="elementFormulaireTexte"></div>
                            <div class="elementFormulaire">
                                <asp:Image ID="checkImage" runat="server" ImageUrl="~/App_Themes/Original/img/icon_check.png" Visible="false" Height="20px" Width="20px" />
                                <asp:Label ID="lblFelicitation" runat="server" ForeColor="Green" Text="L'employé a été ajouter avec succès !" Visible="false"></asp:Label>
                            </div>
                        </div>
                    </div>
                </asp:View>

                <asp:View ID="viewModifie" runat="server">
                    <div class="contenuStandard">
                        <asp:Label ID="lblTitreModifie" runat="server" text="Modifier un employé" Font-Size="24px" Font-Bold="true"/>
                        <br />
                        <br />
                        <br />
                        <div class="ligneFormulaire">
                             <div class="elementFormulaireTexte">
                                 <asp:Label ID="lblChoisirEmploye" runat="server" Text="Choisissez l'employé"></asp:Label></div>
                             <div class="elementFormulaire">
                                 <asp:DropDownList ID="dropDownEmploye" runat="server" Width="250px" SkinID="ddlBlue" DataSourceId="dsDropDownEmploye" DataValueField="idMembre" AppendDataBoundItems="False" AutoPostBack="True" DataTextField="FullName" />
                             </div>
                        </div>

                    <div class="contenuClient">

                    <div class="section">
                    <div class="sectionTitre">
                        <asp:Label ID="infoPersonnel" runat="server" Text="Informations personnels"></asp:Label>
                    </div>
                    </div>  

                        <asp:ListView ID="lvInfoMembre" runat="server" DataSourceID="dsEmployeModifie" DataKeyNames="idMembre">
                            <LayoutTemplate>
                                <div class="infoClient">
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <div class="clientInfoGauche">
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

                                <div class="clientInfoDroite">
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
                                        <asp:Button ID="btnModifier" runat="server" CommandName="Edit" Text="Modifier les informations" CssClass="btn btn-primary"/>
                                    </div>
                            </ItemTemplate>

                            <EditItemTemplate>
                            <div class="clientEditInfo">
                                    <div class="partiGauche">
                                        <div class="formatZone">
                                            <asp:Label ID="lblPrenom" runat="server" Text="Prénom:"></asp:Label>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:Label ID="lblNom" runat="server" Text="Nom:" ></asp:Label>
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
                
                                    <div class="partiDroite" >
                                        <div class="formatZone">
                                            <asp:TextBox ID="txtPrenomClient" SkinID="txtBoxYellow" runat="server" Text='<%# Bind("prenomMembre") %>'></asp:TextBox>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:TextBox ID="txtNomClient" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("nomMembre") %>'></asp:TextBox>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:TextBox ID="txtAdresseClient" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("adresse") %>'></asp:TextBox>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                        <asp:TextBox ID="txtVilleClient" SkinID="txtBoxYellow" runat="server" Text='<%# Bind("ville") %>'></asp:TextBox>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:TextBox ID="txtDate" runat="server" CssClass="datepicker" SkinID="txtBoxYellow" MaxLength="10" ForeColor="Red" Text='<%# Bind("dateNaissance", "{0:yyyy-MM-dd}") %>'></asp:TextBox>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:TextBox ID="txtTelephoneClient" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("telephoneMembre") %>'></asp:TextBox>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                        <asp:TextBox ID="txtPostalClient" SkinID="txtBoxYellow" runat="server" Text='<%# Bind("codePostal") %>'></asp:TextBox>
                                        </div>
                                        </br>
                                </div>

                                <div class="clientValidation">
                                            <div class="formatZone">
                                                <asp:RequiredFieldValidator ID="requiredPrenom" runat="server" ErrorMessage="*Le prénom est obligatoire" ControlToValidate="txtPrenomClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            </br>
                                            <div class="formatZone">
                                                <asp:RequiredFieldValidator ID="requiredNom" runat="server" ErrorMessage="*Le nom est obligatoire" ControlToValidate="txtNomClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            </br>
                                            <div class="formatZone">
                                                <asp:RequiredFieldValidator ID="requiredAdresse" runat="server" ErrorMessage="*L'adresse est obligatoire" ControlToValidate="txtAdresseClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            </br>
                                            <div class="formatZone">
                                                <asp:RequiredFieldValidator ID="requiredVille" runat="server" ErrorMessage="*La ville est obligatoire" ControlToValidate="txtVilleClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            </br>
                                            <div class="formatZone">
                                                <asp:RequiredFieldValidator ID="requiredDate" runat="server" ErrorMessage="*La date de naissance est obligatoire" ControlToValidate="txtDate" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                                <asp:RegularExpressionValidator ID="regExDate" runat="server" ErrorMessage="*Votre date n'est pas dans le format aaaa/mm/jj" 
                                                ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$" Display="Dynamic" ControlToValidate="txtDate" ForeColor="Red"></asp:RegularExpressionValidator>
                                            </div>
                                            </br>
                                            <div class="formatZone">
                                                <asp:RegularExpressionValidator ID="regExTelephone" runat="server" Display="Dynamic" ErrorMessage="*Entrer un numéro de téléphone dans le format suivant (123)456-7890" ForeColor="Red" ControlToValidate="txtTelephoneClient" ValidationExpression="^([\(]{1}[0-9]{3}[\)]{1}[0-9]{3}[\-]{1}[0-9]{4})$"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="requiredTelephone" runat="server" ErrorMessage="*Le téléphone est obligatoire" ControlToValidate="txtTelephoneClient" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                            </div>
                                            </br>
                                            <div class="formatZone">
                                                <asp:RegularExpressionValidator ID="regExCodePostal" runat="server" ErrorMessage="*Veuillez entrer un code postal dans le format A1A 1A1" ForeColor="Red" Display="Dynamic" ControlToValidate="txtPostalClient" ValidationExpression="[A-Z]\d[A-Z] \d[A-Z]\d"></asp:RegularExpressionValidator>
                                                <asp:RequiredFieldValidator ID="requiredCodePostal" runat="server" ErrorMessage="*Le code postal est obligatoire" ControlToValidate="txtPostalClient" Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
                                            </div>
                                </div>

                                    <div class="bouton">
                                        <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter" CssClass="btn btn-primary btn-small" />
                                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Annuler" CssClass="btn btn-primary btn-small" />
                                    </div>
                               </div>
                            </EditItemTemplate>
                        </asp:ListView>
    

                    <div class="section">
                        <div class="sectionTitre">
                            <asp:Label ID="lblTitreCourriel" runat="server" Text="Courriel"></asp:Label>
                        </div>
                    </div>
                    <asp:ListView ID="lvCourriel" runat="server" DataSourceID="dsEmployeModifie" DataKeyNames="idMembre">
                            <LayoutTemplate>
                                <div class="clientMotPasse">
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                    <div class="partiGaucheMotPasse">
                                        <asp:Label ID="lblCourriel" runat="server" Text="Votre courriel:" Font-Bold="True"></asp:Label>
                                        </br>
                    
                                    </div>
                
                                    <div class="partiDroiteMotPasse">
                                        <asp:Label ID="lblCourrielClient" runat="server" Text='<%# Eval("courriel") %>' ></asp:Label>
                                        </br>
                    
                                    </div>
                                    <div class="modifierBouton">
                                        <asp:LinkButton ID="btnModifierCourriel" runat="server" Text="Modifier le courriel" commandName="Edit"></asp:LinkButton>
                                        </br>    
                                    </div>
                              </ItemTemplate>
                              <EditItemTemplate>
                              <div class="partiGaucheCourriel">
                                        <div class="formatZone">
                                            <asp:Label ID="lblCourriel" runat="server" Text="Votre présent courriel:"></asp:Label>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:Label ID="lblNouveauCourriel" runat="server" Text="Entrez votre nouveau courriel:" ></asp:Label>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:Label ID="lblNouveauCourrielEncore" runat="server" Text="Retapez votre nouveau courriel:"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="partiDroiteCourriel">
                                        <div class="formatZone">
                                            <asp:Label ID="lblCourrielPresent" runat="server" Text='<%# Eval("courriel") %>'></asp:Label>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:TextBox ID="txtNouveauCourriel" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("courriel") %>'></asp:TextBox>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:TextBox ID="txtNouveauCourrielEncore" runat="server" SkinID="txtBoxYellow" Text=""></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="validation">
                                        <div class="formatZone">
                                            </br>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:CompareValidator Display="Dynamic" ID="compareCourriel" runat="server" ErrorMessage="*Votre courriel ne correspond pas" ForeColor="Red" ControlToCompare="txtNouveauCourrielEncore" ControlToValidate="txtNouveauCourriel"></asp:CompareValidator>
                                        </div>
                                    </div>

                                    <div class="boutonCourriel">
                                        <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter" CssClass="btn btn-primary btn-small" PostBackUrl="~/Page/Client/home_member.aspx"/>
                                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Annuler" CausesValidation="false" CssClass="btn btn-primary btn-small" PostBackUrl="~/Page/Client/home_member.aspx"/>
                                    </div>
                              </EditItemTemplate>
                    </asp:ListView>

                    <div class="section">
                        <div class="sectionTitre">
                            <asp:Label ID="lblTitreMotPasse" runat="server" Text="Mot de passe"></asp:Label>
                        </div>
                    </div>

                    <asp:ListView ID="lvMotPasse" runat="server" DataSourceID="dsEmployeModifie" DataKeyNames="idMembre">
                            <LayoutTemplate>
                                <div class="clientMotPasse">
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                                </div>
                            </LayoutTemplate>
                            <ItemTemplate>
                                    <div class="modifierBouton">
                                        <asp:LinkButton ID="btnModifierMP" runat="server" commandName="Edit" Text="Changer votre mot de passe"></asp:LinkButton>
                                    </div>
                
                            </ItemTemplate>
                            <EditItemTemplate>
                            <div class="partiGaucheCourriel">
                                        <div class="formatZone">
                                            <asp:Label ID="lblMP" runat="server" Text="Présent mot de passe:"></asp:Label>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:Label ID="lblNouveauMP" runat="server" Text="Nouveau mot de passe:" ></asp:Label>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:Label ID="lblNouveauMPEncore" runat="server" Text="Retapez nouveau mot de passe:"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="partiDroiteCourriel">
                                        <div class="formatZone">
                                            <asp:TextBox ID="txtPresentMP" runat="server" SkinID="txtBoxYellow" Text="" TextMode="Password"></asp:TextBox>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:TextBox ID="txtNouveauMP" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("motPasse") %>' TextMode="Password"></asp:TextBox>
                                        </div>
                                        </br>
                                        <div class="formatZone">
                                            <asp:TextBox ID="txtNouveauMPEncore" runat="server" SkinID="txtBoxYellow" Text="" TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="validation">
                                        <div class="formatZone">
                                            <%--<asp:RequiredFieldValidator ID="requiredMP" runat="server" ErrorMessage="*Le mot de passe est obligatoire" ControlToValidate="txtNouveauMP" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>--%>
                                            </br>
                                        </div>
                                        </br>
                                        <div class="formatZone">    
                                            <asp:CompareValidator Display="Dynamic" ID="compareMP" runat="server" ErrorMessage="*Votre Mot de passe ne correspond pas" ForeColor="Red" ControlToCompare="txtNouveauMPEncore" ControlToValidate="txtNouveauMP"></asp:CompareValidator>
                                            <%--<asp:RequiredFieldValidator Display="Dynamic" ID="requiredMPConfirm" runat="server" ErrorMessage="*Veuillez confirmez votre nouveau mot de passe" ControlToValidate="txtNouveauMPEncore" ForeColor="Red" SetFocusOnError="False"></asp:RequiredFieldValidator>--%>
                                        </div>
                                    </div>

                                    <div class="boutonCourriel">
                                        <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter" CssClass="btn btn-primary btn-small" />
                                        <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Annuler" CssClass="btn btn-primary btn-small" />
                                    </div>
                            </EditItemTemplate>
                    </asp:ListView> 
                    </div>
                    </div>
                </asp:View>

                <asp:View ID="viewSupprime" runat="server">
                    <div class="contenuStandard">
                        <asp:Label ID="Label1" runat="server" text="Supprimer un employé" Font-Size="24px" Font-Bold="true"/>
                        <br />
                        <br />
                        <br />
                        <asp:ListView ID="lvEmploye" runat="server" DataSourceID="dsEmployeSupprime" DataKeyNames="idMembre">
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
                                        <asp:Label ID="lblprenomEmploye" runat="server" Text='<%# Eval("prenomMembre ") %>'></asp:Label>
                                        <asp:Label ID="lblNomEmploye" runat="server" Text='<%# Eval("nomMembre ") %>'></asp:Label>
                                        <asp:ImageButton ID="imgDelete" CommandArgument='<%#Eval("idMembre")%>' CssClass="boutonFloatRight" ImageUrl="~/App_Themes/Original/img/delete.png"
                                            OnClientClick="return confirm('Etes-vous certain?');" CommandName="Delete" runat="server"
                                            Width="20px" Height="20px" />
                                    </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </asp:View>
            </asp:MultiView>
            <div class="groupeBouton" style="clear:both;">
                <div class="boutonGroupeRetour" style="margin-bottom:20px;">
                    <asp:Button ID="btnRetour" runat="server" Text="Retour page admin" CssClass="btn btn-primary" Width="150px" PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false"/>
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
            dateFormat: "dd/mm/yy"
        });
    });
	</script>

    <asp:EntityDataSource ID="dsEmployeSupprime" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="false"
        EnableDelete="true" EnableInsert="false" EnableUpdate="true" EntityTypeFilter="MembresJeu"
        Where="(it.RoleJeu_idRole = 1 OR it.RoleJeu_idRole = 2)" OrderBy="it.prenomMembre">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsEmployeModifie" runat="server" 
    ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" 
    EntitySetName="MembresJeu" EnableFlattening="False"
    EnableDelete="true" EnableInsert="true" 
    EnableUpdate="true"
    orderBy="it.idMembre" 
    Where="(@MembreID = it.idMembre)"
    EntityTypeFilter="MembresJeu">
    <WhereParameters>
        <asp:ControlParameter Name="MembreID" ControlID="dropDownEmploye" PropertyName="SelectedValue" Type="Int32" DefaultValue="9" />
    </WhereParameters>
    </asp:EntityDataSource>


    <asp:EntityDataSource ID="dsDropDownEmploye" runat="server"
    ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer"
    EntitySetName="MembresJeu"
    EnableFlattening="false"
    EnableDelete="false" EnableInsert="false" 
    EnableUpdate="false"
    EntityTypeFilter="MembresJeu"
    Where="(it.RoleJeu_idRole = 1 OR it.RoleJeu_idRole = 2)"
    Select="it.idMembre, it.RoleJeu_idRole,it.prenomMembre,(it.[prenomMembre]+' '+it.[nomMembre]) as FullName"
    OrderBy="it.prenomMembre"
    >
    </asp:EntityDataSource>

</div>
</asp:Content>

