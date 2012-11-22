<%@ Page Title="" Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master"
    AutoEventWireup="false" CodeFile="admin_course.aspx.vb" Inherits="Page_Admin_admin_course"
    Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="Server">
    <asp:MultiView ID="mvCours" runat="server" ActiveViewIndex="0">
        <asp:View ID="viewAjout" runat="server">
            <asp:ListView ID="lvCourseAdd" runat="server" DataSourceID="dsCourseAdd" DataKeyNames="idCours" InsertItemPosition="LastItem" ItemPlaceholderID="itemPlaceHolder">
                <LayoutTemplate>
                    <div class="titleClient">
                        <h3>
                            Ajouter un cours</h3>
                        <br />
                    </div>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                </LayoutTemplate>

                <InsertItemTemplate>
                    <div class="containerFormulaire">
                        <div class="ligneFormulaire">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblNomCours" runat="server" Text="Nom du cours"></asp:Label></div>
                            <div class="elementFormulaire">
                                <asp:TextBox ID="txtCours" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    MaxLength="50" Text='<%#Bind("nomCours") %>'></asp:TextBox></div>
                            <div class="validation" style="padding-top:2px;">
                                <asp:RequiredFieldValidator ID="requiredCours" runat="server" ErrorMessage="Le nom du cours est obligatoire"
                                    ControlToValidate="txtCours" ForeColor="Red" Display="Dynamic" ValidationGroup="formulaire">!</asp:RequiredFieldValidator>
                                <asp:Label ID="lblErreurCorus" runat="server" Text="Le cours existe déjà" ForeColor="Red"
                                    Visible="false">!</asp:Label>
                            </div>
                        </div>
                        <%--Nom du cours--%>
                        <div class="ligneFormulaire">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblCategorie" runat="server" Text="Catégorie"></asp:Label></div>
                            <div class="elementFormulaire">
                                <asp:DropDownList ID="ddlCategorie" runat="server" Width="100px" SkinID="ddlBlue"
                                    AppendDataBoundItems="False" CssClass="search-query" SelectedValue='<%#Bind("categorie") %>'>
                                    <asp:ListItem Selected="True" Value="Culture">Culture</asp:ListItem>
                                    <asp:ListItem Value="Loisir">Loisir</asp:ListItem>
                                    <asp:ListItem Value="Sport">Sport</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <%--Catégorie--%>
                        <div class="ligneFormulaireDescription">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblDescription" runat="server" Text="Description du cours"></asp:Label></div>
                            <div class="elementFormulaire">
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="search-query" Font-Bold="false"
                                    SkinID="txtBoxDescription" MaxLength="20" Height="120px" TextMode="MultiLine"
                                    Width="320px" Text='<%#Bind("description") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredDescription" runat="server" ErrorMessage="La description est obligatoire"
                                    ControlToValidate="txtDescription" ForeColor="Red" Display="Dynamic" ValidationGroup="formulaire">!</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExDescription" runat="server" ErrorMessage="La description ne doit pas contenir plus de 400 caractère."
                                    ValidationExpression="[\s\S]{0,500}" ForeColor="Red" ControlToValidate="txtDescription" ValidationGroup="formulaire">!</asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <%--Description--%>
                        <div class="ligneFormulaire">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblPrerequis" runat="server" Text="Prérequis"></asp:Label></div>
                            <div class="elementFormulaire">
                                <asp:TextBox ID="txtPrerequis" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    MaxLength="25" Text='<%#Bind("prerequis") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredPrerequis" runat="server" ErrorMessage="Le prérequis est obligatoire"
                                    ControlToValidate="txtPrerequis" ForeColor="Red" Display="Dynamic" ValidationGroup="formulaire">!</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <%--Prérequis--%>
                        <div class="ligneFormulaire">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblTarif" runat="server" Text="Tarif"></asp:Label></div>
                            <div class="elementFormulaire">
                                <asp:TextBox ID="txtTarif" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    MaxLength="6" Width="50px" Text='<%#Bind("tarif") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredTarif" runat="server" ErrorMessage="Le tarif est obligatoire"
                                    ControlToValidate="txtTarif" ForeColor="Red" Display="Dynamic" ValidationGroup="formulaire">!</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExTarif" runat="server" ErrorMessage="Veuillez entrer seulement des chiffres"
                                    ValidationExpression="^[0-9]+$" Display="Dynamic" ControlToValidate="txtTarif"
                                    ForeColor="Red" ValidationGroup="formulaire">!</asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <%--Tarif--%>
                        <div class="ligneFormulaire">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblGroupeAge" runat="server" Text="Groupe d'âge"></asp:Label></div>
                            <div class="elementFormulaire">
                                <asp:TextBox ID="txtGroupeAgeMin" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    MaxLength="2" Text='<%#Bind("groupeAgeMin") %>' Width="30px"></asp:TextBox>
                                <asp:DropDownList ID="ddlGroupeAgeMod" runat="server" SkinID="ddlBlue" Width="75px"
                                    CssClass="ddlGroupeAgeMod" AppendDataBoundItems="false" DataValueField="groupeAgeMod"
                                    SelectedValue='<%#Bind("groupeAgeMod") %>' OnSelectedIndexChanged="changementAgeMod" AutoPostBack="true">
                                    <asp:ListItem>à</asp:ListItem>
                                    <asp:ListItem>et +</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txtGroupeAgeMax" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                    Width="30px" MaxLength="3" Text='<%#Bind("groupeAgeMax") %>'></asp:TextBox>
                            </div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredGroupeAgeMin" runat="server" ErrorMessage="Le groupe d'âge minimum est obligatoire"
                                    ControlToValidate="txtGroupeAgeMin" ForeColor="Red" Display="Dynamic" ValidationGroup="formulaire">!</asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="requiredGroupeAgeMax" runat="server" ErrorMessage="Le groupe d'âge maximum est obligatoire"
                                    ControlToValidate="txtGroupeAgeMax" ForeColor="Red" Display="Dynamic" ValidationGroup="formulaire">!</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExGroupeAgeMin" runat="server" ErrorMessage="Veuillez entrer seulement des chiffres"
                                    ValidationExpression="^[0-9]+$" Display="Dynamic" ControlToValidate="txtGroupeAgeMin"
                                    ForeColor="Red" ValidationGroup="formulaire">!</asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="regExGroupeAgeMax" runat="server" ErrorMessage="Veuillez entrer seulement des chiffres"
                                    ValidationExpression="^[0-9]+$" Display="Dynamic" ControlToValidate="txtGroupeAgeMax"
                                    ForeColor="Red" ValidationGroup="formulaire">!</asp:RegularExpressionValidator>
                                <asp:CompareValidator ID="compareGroupeAge" runat="server" ForeColor="Red" ErrorMessage="L'âge maximum doit être plus élevé
                                    que celle minimum" ControlToCompare="txtGroupeAgeMin" ControlToValidate="txtGroupeAgeMax" Operator="GreaterThan" ValidationGroup="formulaire">!</asp:CompareValidator>
                            </div>
                        </div>
                        <%--Groupe d'âge--%>
                        <div class="ligneFormulaire">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblDateDebutInscription" runat="server" Text="Date début des inscriptions"></asp:Label></div>
                            <div class="elementFormulaire">
                                <asp:TextBox ID="txtDateDebutInscription" runat="server" CssClass="datepicker search-query"
                                    SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateDebutInscription") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredDateDebutInscription" runat="server" ErrorMessage="La date de début des inscriptions est obligatoire"
                                ControlToValidate="txtDateDebutInscription" ForeColor="Red" Display="Dynamic" ValidationGroup="formulaire">!</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExDateDebutInscription" runat="server" ErrorMessage="La date n'est pas dans le format aaaa/mm/jj"
                                ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$"
                                Display="Dynamic" ControlToValidate="txtDateDebutInscription" ForeColor="Red" ValidationGroup="formulaire">!</asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <%--Date début des inscriptions--%>
                        <div class="ligneFormulaire">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblDateFinInscription" runat="server" Text="Date fin des inscriptions"></asp:Label></div>
                            <div class="elementFormulaire">
                                <asp:TextBox ID="txtDateFinInscription" runat="server" CssClass="datepicker search-query"
                                    SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateFinInscription") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredDateFinInscription" runat="server" ErrorMessage="La date de fin des inscriptions est obligatoire"
                                    ControlToValidate="txtDateFinInscription" ForeColor="Red" Display="Dynamic" ValidationGroup="formulaire">!</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExDateFinInscription" runat="server" ErrorMessage="La date n'est pas dans le format aaaa/mm/jj"
                                    ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$"
                                    Display="Dynamic" ControlToValidate="txtDateFinInscription" ForeColor="Red" ValidationGroup="formulaire">!</asp:RegularExpressionValidator>
                                <asp:CompareValidator ID="compareDateFinInscritpion" runat="server" ErrorMessage="La date de fin d'inscritpion doit être après celle de début d'inscritpion
                                " Display="Dynamic" ControlToValidate="txtDateFinInscription" ControlToCompare="txtDateDebutInscription"
                                    ForeColor="red" Operator="GreaterThan" ValidationGroup="formulaire">!</asp:CompareValidator>
                            </div>
                        </div>
                        <%--Date fin des inscriptions--%>
                        <div class="ligneFormulaire">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblDateDebutCours" runat="server" Text="Date début des cours"></asp:Label></div>
                            <div class="elementFormulaire">
                                <asp:TextBox ID="txtDateDebutCours" runat="server" CssClass="datepicker search-query"
                                    SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateDebutCours") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredDateDebutCours" runat="server" ErrorMessage="La date de début des cours est obligatoire"
                                    ControlToValidate="txtDateDebutCours" ForeColor="Red" Display="Dynamic" ValidationGroup="formulaire">!</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExDateDebutCours" runat="server" ErrorMessage="La date n'est pas dans le format aaaa/mm/jj"
                                    ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$"
                                    Display="Dynamic" ControlToValidate="txtDateDebutCours" ForeColor="Red" ValidationGroup="formulaire">!</asp:RegularExpressionValidator>
                                <asp:CompareValidator ID="compareDateDebutCoursADateFinInscription" runat="server" ErrorMessage="La date de début de cours doit être après celle de fin d'inscription" 
                                    Display="Dynamic" ControlToValidate="txtDateDebutCours" ControlToCompare="txtDateFinInscription" ForeColor="red" Operator="GreaterThan" ValidationGroup="formulaire">!</asp:CompareValidator>
                            </div>
                        </div>
                        <%--Date début des cours--%>
                        <div class="ligneFormulaire">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblDateFinCours" runat="server" Text="Date fin des cours"></asp:Label></div>
                            <div class="elementFormulaire">
                                <asp:TextBox ID="txtDateFinCours" runat="server" CssClass="datepicker search-query"
                                    SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateFinCours") %>'></asp:TextBox></div>
                            <div class="validation">
                                <asp:RequiredFieldValidator ID="requiredDateFinCours" runat="server" ErrorMessage="La date de fin des cours est obligatoire"
                                    ControlToValidate="txtDateFinCours" ForeColor="Red" Display="Dynamic" ValidationGroup="formulaire">!</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="regExDateFinCours" runat="server" ErrorMessage="La date n'est pas dans le format aaaa/mm/jj"
                                    ValidationExpression="^(19|20)\d\d([- /.])(0[1-9]|1[012])\2(0[1-9]|[12][0-9]|3[01])$"
                                    Display="Dynamic" ControlToValidate="txtDateFinCours" ForeColor="Red" ValidationGroup="formulaire">!</asp:RegularExpressionValidator>
                                <asp:CompareValidator ID="compareDateFinCoursADateDebutCours" runat="server" ErrorMessage="La date de fin de cours doit être après celle de début de cours
                                " Display="Dynamic" ControlToValidate="txtDateFinCours" ControlToCompare="txtDateDebutCours"
                                    ForeColor="red" Operator="GreaterThan" ValidationGroup="formulaire">!</asp:CompareValidator>
                            </div>
                        </div>
                        <%--Date fin des cours--%>
                        <div class="ligneFormulaire">
                            <div class="elementFormulaireTexte">
                                <asp:Label ID="lblTeacher" runat="server" Text="Animateur du cours"></asp:Label></div>
                            <div class="elementFormulaire">
                                <asp:DropDownList ID="ddlTeachers" runat="server" DataSourceID="dsTeachers" DataTextField="FullName"
                                    DataValueField="idMembre" SkinID="ddlBlue" AppendDataBoundItems="False" CssClass="search-query"
                                    SelectedValue='<%#Bind("Animateur_idMembre") %>'>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="validationListe">
                            <asp:ValidationSummary ID="ValidationInfo" ValidationGroup="formulaire" DisplayMode="List"
                            ForeColor="Red" runat="server" />
                        </div>

                        <%--Animateur--%>
                        <div class="bouton" style="margin-left:260px;">
                                <asp:Button ID="btnAjouter" runat="server" Text="Ajouter" CssClass="btn btn-primary btn-large btn"
                                    CommandName="Insert" ValidationGroup="formulaire"/>
                                <asp:Button ID="btnCancel" runat="server" Text="Annuler" CssClass="btn btn-primary btn-large btn"
                                    PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false" />
                        </div>
                        <%--Boutons--%>
                        <%--Label félicitation--%>
                    </div>
                </InsertItemTemplate>
                <ItemTemplate>
                </ItemTemplate>
            </asp:ListView>
        </asp:View>
        <asp:View ID="viewModifie" runat="server">
            <div class="titleAdminNormal">
                <asp:Label ID="lblModifierCours" runat="server" Text="Modifier un cours"></asp:Label>
            </div>
            <div class="ligneFormulaire">
                <div class="elementFormulaireTexte">
                    Choisissez un cours</div>
                <div class="elementFormulaire">
                    <asp:DropDownList ID="ddlCours" runat="server" Width="200px" SkinID="ddlBlue" DataSourceID="dsCours"
                        DataValueField="idCours" AppendDataBoundItems="False" AutoPostBack="True" DataTextField="nomCours" />
                </div>
            </div>
            <asp:ListView ID="lvCourseModify" runat="server" DataSourceID="dsModifyCourse" DataKeyNames="idCours"
                ItemPlaceholderID="itemPlaceHolder">
                <LayoutTemplate>
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="modifierCoursGauche">
                        <div class="partiGaucheCours">
                            <div class="ligneCoursNormalLabelGauche">
                                <asp:Label ID="lblNom" runat="server" Text="Nom:"></asp:Label>
                            </div>
                            <div class="ligneCoursNormalLabelGauche">
                                <asp:Label ID="lblCategorie" runat="server" Text="Catégorie:"></asp:Label>
                            </div>
                            <div class="ligneCoursDescriptionLabel">
                                <asp:Label ID="lblDescription" runat="server" Text="Description:"></asp:Label>
                            </div>
                            <div class="ligneCoursNormalLabelGauche">
                                <asp:Label ID="lblPrerequis" runat="server" Text="Prérequis:"></asp:Label>
                            </div>
                            <div class="ligneCoursNormalLabelGauche">
                                <asp:Label ID="lblGroupeAge" runat="server" Text="Groupe d'âge:"></asp:Label>
                            </div>
                            <div class="ligneCoursNormalLabelGauche">
                                <asp:Label ID="lblAnimateur" runat="server" Text="Animateur:"></asp:Label>
                            </div>
                        </div>
                        <div class="partiDroiteCours">
                            <div class="ligneCoursNormal">
                                <asp:Label ID="lblNomCours" runat="server" Text='<%# Eval("nomCours") %>'></asp:Label>
                            </div>
                            <div class="ligneCoursNormal">
                                <asp:Label ID="lblCategorieCours" runat="server" Text='<%# Eval("categorie") %>'></asp:Label>
                            </div>
                            <div class="ligneCoursDescription">
                                <asp:Label ID="lblDescriptionCours" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                            </div>
                            <div class="ligneCoursNormal">
                                <asp:Label ID="lblPrerequisCours" runat="server" Text='<%# Eval("prerequis") %>'></asp:Label>
                            </div>
                            <div class="ligneCoursNormal">
                                <asp:Label ID="lblGroupeAgeMin" runat="server" Text='<%# Eval("groupeAgeMin") %>'></asp:Label>
                                <asp:Label ID="lblGroupeAgeMod" runat="server" Text='<%# Eval("groupeAgeMod") %>'></asp:Label>
                                <asp:Label ID="lblGroupeAgeMax" runat="server" Text='<%# Eval("groupeAgeMax") %>'></asp:Label>
                            </div>
                            <div class="ligneCoursNormal">
                                <asp:Label ID="lblAnimateurPrenomCours" runat="server" Text='<%# Eval("MembresJeu_Animateur.MembresJeu.prenomMembre ") %>'></asp:Label>
                                <asp:Label ID="lblAnimateurNomCours" runat="server" Text='<%# Eval("MembresJeu_Animateur.MembresJeu.nomMembre") %>'></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="modifierCoursDroite">
                        <div class="partiGaucheCoursDate">
                            <asp:Label ID="lblTarif" runat="server" Text="Tarif:"></asp:Label>
                            </br>
                            <asp:Label ID="lblDateDebutInscription" runat="server" Text="Date début inscription:"></asp:Label>
                            </br>
                            <asp:Label ID="lblDateFinInscription" runat="server" Text="Date fin inscription:"></asp:Label>
                            </br>
                            <asp:Label ID="lblDateDebutCours" runat="server" Text="Date début cours:"></asp:Label>
                            </br>
                            <asp:Label ID="lblDateFinCours" runat="server" Text="Date fin cours:"></asp:Label>
                        </div>
                        <div class="partiDroiteCoursDate">
                            <asp:Label ID="lblTarifCours" runat="server" Text='<%# Eval("tarif") %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblDateDebutInscriptionCours" runat="server" Text='<%# (CType(Eval("dateDebutInscription"),DateTime)).ToShortDateString %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblDateFinInscriptionCours" runat="server" Text='<%# (CType(Eval("dateFinInscription"),DateTime)).ToShortDateString %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblDateDebutCoursCours" runat="server" Text='<%# (CType(Eval("dateDebutCours"),DateTime)).ToShortDateString %>'></asp:Label>
                            </br>
                            <asp:Label ID="lblDateFinCoursCours" runat="server" Text='<%# (CType(Eval("dateFinCours"),DateTime)).ToShortDateString %>'></asp:Label>
                        </div>
                    </div>
                    <div class="bouton">
                        <asp:Button ID="btnModifier" runat="server" CommandName="Edit" Text="Modifier les informations"
                            CssClass="btn btn-primary" />
                        <asp:Button ID="btnRetour" runat="server" PostBackUrl="~/Page/Admin/home_admin.aspx"
                            Text="Retour" CssClass="btn btn-primary" />
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblNomCours" runat="server" Text="Nom du cours"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtCours" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                MaxLength="50" Text='<%#Bind("nomCours") %>'></asp:TextBox></div>
                        <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredCours" runat="server" ErrorMessage="*Le nom du cours est obligatoire"
                                ControlToValidate="txtCours" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:Label ID="lblErreurCorus" runat="server" Text="Le cours existe déjà" ForeColor="Red"
                                Visible="false"></asp:Label>
                        </div>
                    </div>
                    <%--Nom du cours--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblCategorie" runat="server" Text="Catégorie"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:DropDownList ID="ddlCategorie" runat="server" Width="100px" SkinID="ddlBlue"
                                AppendDataBoundItems="False" CssClass="search-query" SelectedValue='<%#Bind("categorie") %>'>
                                <asp:ListItem Selected="True" Value="Culture">Culture</asp:ListItem>
                                <asp:ListItem Value="Loisir">Loisir</asp:ListItem>
                                <asp:ListItem Value="Sport">Sport</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <%--Catégorie--%>
                    <div class="ligneFormulaireDescription">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblDescription" runat="server" Text="Description du cours"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtDescription" runat="server" CssClass="search-query" Font-Bold="false"
                                SkinID="txtBoxDescription" MaxLength="20" Height="120px" TextMode="MultiLine"
                                Width="320px" Text='<%#Bind("description") %>'></asp:TextBox></div>
                        <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredDescription" runat="server" ErrorMessage="*La description est obligatoire"
                                ControlToValidate="txtDescription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <%--Description--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblPrerequis" runat="server" Text="Prérequis"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtPrerequis" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                MaxLength="25" Text='<%#Bind("prerequis") %>'></asp:TextBox></div>
                        <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredPrerequis" runat="server" ErrorMessage="*Le prérequis est obligatoire"
                                ControlToValidate="txtPrerequis" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <%--Prérequis--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblTarif" runat="server" Text="Tarif"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtTarif" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                MaxLength="6" Width="50px" Text='<%#Bind("tarif") %>'></asp:TextBox></div>
                        <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredTarif" runat="server" ErrorMessage="*Le tarif est obligatoire"
                                ControlToValidate="txtTarif" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <%--Tarif Adulte--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblGroupeAge" runat="server" Text="Groupe d'âge"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtGroupeAgeMin" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                MaxLength="2" Text='<%#Bind("groupeAgeMin") %>' Width="30px"></asp:TextBox>
                            <asp:DropDownList ID="ddlGroupeAgeMod" runat="server" SkinID="ddlBlue" Width="55px"
                                CssClass="ddlGroupeAgeMod" AppendDataBoundItems="false" SelectedValue='<%#Bind("groupeAgeMod") %>'>
                                <asp:ListItem Selected="true" Value="à">à</asp:ListItem>
                                <asp:ListItem Value="et" Text="et">et</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtGroupeAgeMax" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                Width="30px" MaxLength="3" Text='<%#Bind("groupeAgeMax") %>'></asp:TextBox>*
                        </div>
                        <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredGroupeAgeMin" runat="server" ErrorMessage="*Le groupe d'âge minimum est obligatoire"
                                ControlToValidate="txtGroupeAgeMin" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="requiredGroupeAgeMax" runat="server" ErrorMessage="*Le groupe d'âge maximum est obligatoire"
                                ControlToValidate="txtGroupeAgeMax" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regExGroupeAgeMin" runat="server" ErrorMessage="*Veuillez entrer seulement des chiffres"
                                ValidationExpression="^[0-9]+$" Display="Dynamic" ControlToValidate="txtGroupeAgeMin"
                                ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="regExGroupeAgeMax" runat="server" ErrorMessage="*Veuillez entrer seulement des chiffres"
                                ValidationExpression="^[0-9]+$" Display="Dynamic" ControlToValidate="txtGroupeAgeMax"
                                ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:CompareValidator ID="compareGroupeAge" runat="server" ForeColor="Red" ErrorMessage="*L'âge maximum doit être plus élevé
                             que celle minimum" ControlToCompare="txtGroupeAgeMin" ControlToValidate="txtGroupeAgeMax"
                                Operator="GreaterThan">
                            </asp:CompareValidator>
                        </div>
                    </div>
                    <%--Groupe d'âge--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblDateDebutInscription" runat="server" Text="Date début des inscriptions"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtDateDebutInscription" runat="server" CssClass="datepicker search-query"
                                SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateDebutInscription", "{0:dd/MM/yyyy}") %>'></asp:TextBox></div>
                        <asp:RequiredFieldValidator ID="requiredDateDebutInscription" runat="server" ErrorMessage="*La date de début des inscriptions est obligatoire"
                            ControlToValidate="txtDateDebutInscription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExDateDebutInscription" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa"
                            ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  "
                            Display="Dynamic" ControlToValidate="txtDateDebutInscription" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <%--Date début des inscriptions--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblDateFinInscription" runat="server" Text="Date fin des inscriptions"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtDateFinInscription" runat="server" CssClass="datepicker search-query"
                                SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateFinInscription", "{0:dd/MM/yyyy}") %>'></asp:TextBox></div>
                        <asp:RequiredFieldValidator ID="requiredDateFinInscription" runat="server" ErrorMessage="*La date de fin des inscriptions est obligatoire"
                            ControlToValidate="txtDateFinInscription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExDateFinInscription" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa"
                            ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  "
                            Display="Dynamic" ControlToValidate="txtDateFinInscription" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <%--Date fin des inscriptions--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblDateDebutCours" runat="server" Text="Date début des cours"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtDateDebutCours" runat="server" CssClass="datepicker search-query"
                                SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateDebutCours", "{0:dd/MM/yyyy}") %>'></asp:TextBox></div>
                        <asp:RequiredFieldValidator ID="requiredDateDebutCours" runat="server" ErrorMessage="*La date de début des cours est obligatoire"
                            ControlToValidate="txtDateDebutCours" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExDateDebutCours" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa"
                            ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  "
                            Display="Dynamic" ControlToValidate="txtDateDebutCours" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <%--Date début des cours--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblDateFinCours" runat="server" Text="Date fin des cours"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtDateFinCours" runat="server" CssClass="datepicker search-query"
                                SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateFinCours", "{0:dd/MM/yyyy}") %>'></asp:TextBox></div>
                        <asp:RequiredFieldValidator ID="requiredDateFinCours" runat="server" ErrorMessage="*La date de fin des cours est obligatoire"
                            ControlToValidate="txtDateFinCours" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExDateFinCours" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa"
                            ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  "
                            Display="Dynamic" ControlToValidate="txtDateFinCours" ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                    <%--Date fin des cours--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblTeacher" runat="server" Text="Animateur du cours"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:DropDownList ID="ddlTeachers" runat="server" DataSourceID="dsTeachers" DataTextField="FullName"
                                DataValueField="idMembre" SkinID="ddlBlue" AppendDataBoundItems="False" CssClass="search-query"
                                SelectedValue='<%#Bind("Animateur_idMembre") %>'>
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                        </div>
                        <div class="elementFormulaire">
                            <asp:Button ID="btnAjouter" runat="server" Text="Accepter les modifications" CssClass="btn btn-primary btn-large btn"
                                CommandName="Update" />
                            <asp:Button ID="btnCancel" runat="server" Text="Canceller" CssClass="btn btn-primary btn-large btn"
                                PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false" />
                        </div>
                    </div>
                    <%--Boutons--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                        </div>
                        <div class="elementFormulaire">
                            <asp:Image ID="checkImage" runat="server" ImageUrl="~/App_Themes/Original/img/icon_check.png"
                                Visible="false" Height="20px" Width="20px" />
                            <asp:Label ID="lblFelicitation" runat="server" ForeColor="Green" Text="Le cours a été mis à jour avec succès !"
                                Visible="false"></asp:Label>
                        </div>
                    </div>
                    <%--Label félicitation--%>
                    </div>
                </EditItemTemplate>
            </asp:ListView>
        </asp:View>
        <asp:View ID="viewSupprime" runat="server">
            <asp:ListView ID="lvCours" runat="server" DataSourceID="dsCours" DataKeyNames="idCours">
                <LayoutTemplate>
                    <div class="titleAdminNormal">
                        <asp:Label ID="lblSupprimerCours" runat="server" Text="Supprimer un cours" Font-Size="24px" Font-Bold="true"></asp:Label>
                        <br />
                        <br />
                    </div>
                    <div class="infoAdmin">
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="blockNomAnimateur2">
                        <asp:Label ID="lblprenomEmploye" runat="server" Text='<%# Eval("nomCours ") %>'></asp:Label>
                        <asp:ImageButton ID="imgDelete" CommandArgument='<%#Eval("idCours")%>' CssClass="boutonFloatRight"
                            ImageUrl="~/App_Themes/Original/img/delete.png" OnClientClick="return confirm('Etes-vous certain?');"
                            CommandName="Delete" runat="server" Width="20px" Height="20px" OnClick="DeletingCoursID" />
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </asp:View>
    </asp:MultiView>
    <%--<div class="ligneFormulaire">
        <div class="elementFormulaireTexte">
        </div>
        <div class="elementFormulaire">
            <asp:Image ID="checkImage" runat="server" ImageUrl="~/App_Themes/Original/img/icon_check.png"
                Visible="false" Height="20px" Width="20px" />
            <asp:Label ID="lblFelicitation" runat="server" ForeColor="Green" Text="Le cours a été ajouter avec succès !"
                Visible="false"></asp:Label>
        </div>
    </div>--%>
    <asp:EntityDataSource ID="dsCourseAdd" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="false"
        EnableDelete="true" EnableInsert="true" EnableUpdate="true">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsTeachers" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu_Animateur"
        EnableFlattening="false" EnableDelete="false" EnableInsert="false" EnableUpdate="false"
        Select="it.idAnimateur, it.idMembre,(it.MembresJeu.[prenomMembre]+' '+it.MembresJeu.[nomMembre]) as FullName">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsModifyCourse" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="false" EnableUpdate="True" OrderBy="it.nomCours"
        Include="MembresJeu_Animateur, MembresJeu_Animateur.MembresJeu" Where="(@CoursID = it.idCours)">
        <WhereParameters>
            <asp:ControlParameter Name="CoursID" ControlID="ddlCours" PropertyName="SelectedValue"
                Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="false"
        EnableDelete="true" EnableInsert="false" EnableUpdate="true" EntityTypeFilter="CoursJeu"
        OrderBy="it.nomCours">
    </asp:EntityDataSource>
    <script>
        $(function () {
            $(".datepicker").datepicker({
                dayNamesMin: ["Di", "Lu", "Ma", "Me", "Je", "ve", "Sa"],
                monthNamesShort: ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"],
                yearRange: "c:c+2",
                changeMonth: true,
                changeYear: true,
                dateFormat: "yy/mm/dd",
                minDate: "+7d"
            });
        });
    </script>
    <%--Date Picker--%>
</asp:Content>
