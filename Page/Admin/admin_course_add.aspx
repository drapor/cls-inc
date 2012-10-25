<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="admin_course_add.aspx.vb" Inherits="Page_Admin_admin_course_add" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="containerContenuAdmin">
        <div class="titleAdminNormal">
            <asp:Label ID="lblAjouterCours" runat="server" Text="Ajouter un cours"></asp:Label>
        </div>
        <asp:ListView ID="lvCourseAdd" runat="server" DataSourceID="dsCourseAdd" DataKeyNames="idCours"
            InsertItemPosition="LastItem" ItemPlaceholderID="itemPlaceHolder">
            <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </LayoutTemplate>
            <InsertItemTemplate>
                <div class="containerFormulaire">
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblNomCours" runat="server" Text="Nom du cours"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtCours" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                MaxLength="50" Text='<%#Bind("nomCours") %>'></asp:TextBox>*</div>
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
                                Width="320px" Style="resize: none;" Text='<%#Bind("description") %>'></asp:TextBox>*</div>
                        <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredDescription" runat="server" ErrorMessage="*La description est obligatoire"
                                ControlToValidate="txtDescription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="regExDescription" runat="server" ErrorMessage="*La description ne doit pas contenir plus de 400 caractère."
                                ValidationExpression="[\s\S]{0,500}" ForeColor="Red" ControlToValidate="txtDescription"></asp:RegularExpressionValidator>
                        </div>
                    </div>
                    <%--Description--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblPrerequis" runat="server" Text="Prérequis"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtPrerequis" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                MaxLength="25" Text='<%#Bind("prerequis") %>'></asp:TextBox>*</div>
                        <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredPrerequis" runat="server" ErrorMessage="*Le prérequis est obligatoire"
                                ControlToValidate="txtPrerequis" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <%--Prérequis--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblTarifAdulte" runat="server" Text="Tarif Adulte"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtTarifAdulte" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                MaxLength="6" Width="50px" Text='<%#Bind("tarifAdulte") %>'></asp:TextBox>*</div>
                        <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredTarifAdulte" runat="server" ErrorMessage="*Le tarif adulte est obligatoire"
                                ControlToValidate="txtTarifAdulte" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <%--Tarif Adulte--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblTarifEnfant" runat="server" Text="Tarif Enfant"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtTarifEnfant" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                MaxLength="6" Width="50px" Text='<%#Bind("tarifEnfant") %>'></asp:TextBox>*</div>
                        <div class="elementFormulaireRequired">
                            <asp:RequiredFieldValidator ID="requiredTarifEnfant" runat="server" ErrorMessage="*Le tarif enfant est obligatoire"
                                ControlToValidate="txtTarifEnfant" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <%--Tarif Enfant--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblGroupeAge" runat="server" Text="Groupe d'âge"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtGroupeAgeMin" runat="server" CssClass="search-query" SkinID="txtBoxBlue"
                                MaxLength="2" Text='<%#Bind("groupeAgeMin") %>' Width="30px"></asp:TextBox>
                            <asp:DropDownList ID="ddlGroupeAgeMod" runat="server" SkinID="ddlBlue" Width="55px"
                                CssClass="ddlGroupeAgeMod" AppendDataBoundItems="false" DataValueField="groupeAgeMod"
                                SelectedValue='<%#Bind("groupeAgeMod") %>'>
                                <asp:ListItem>à</asp:ListItem>
                                <asp:ListItem>et</asp:ListItem>
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
                            ValidationExpression="^[0-9]+$"
                            Display="Dynamic" ControlToValidate="txtGroupeAgeMin" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="regExGroupeAgeMax" runat="server" ErrorMessage="*Veuillez entrer seulement des chiffres"
                            ValidationExpression="^[0-9]+$"
                            Display="Dynamic" ControlToValidate="txtGroupeAgeMax" ForeColor="Red"></asp:RegularExpressionValidator>
                            <asp:CompareValidator ID="compareGroupeAge" runat="server" ForeColor="Red" ErrorMessage="*L'âge maximum doit être plus élevé
                             que celle minimum" ControlToCompare="txtGroupeAgeMin" ControlToValidate="txtGroupeAgeMax" Operator="GreaterThan">
                             </asp:CompareValidator>
                        </div>
                    </div>
                    <%--Groupe d'âge--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblDateDebutInscription" runat="server" Text="Date début des inscriptions"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtDateDebutInscription" runat="server" CssClass="datepicker search-query"
                                SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateDebutInscription") %>'></asp:TextBox>*</div>
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
                                SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateFinInscription") %>'></asp:TextBox>*</div>
                        <asp:RequiredFieldValidator ID="requiredDateFinInscription" runat="server" ErrorMessage="*La date de fin des inscriptions est obligatoire"
                            ControlToValidate="txtDateFinInscription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExDateFinInscription" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa"
                            ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  "
                            Display="Dynamic" ControlToValidate="txtDateFinInscription" ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="compareDateFinInscritpion" runat="server" ErrorMessage="*La date de fin d'inscritpion doit être après celle de début d'inscritpion
                            " Display="Dynamic" ControlToValidate="txtDateFinInscription" ControlToCompare="txtDateDebutInscription" ForeColor="red" Operator="GreaterThan"></asp:CompareValidator>
                    </div>
                    <%--Date fin des inscriptions--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblDateDebutCours" runat="server" Text="Date début des cours"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtDateDebutCours" runat="server" CssClass="datepicker search-query"
                                SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateDebutCours") %>'></asp:TextBox>*</div>
                        <asp:RequiredFieldValidator ID="requiredDateDebutCours" runat="server" ErrorMessage="*La date de début des cours est obligatoire"
                            ControlToValidate="txtDateDebutCours" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExDateDebutCours" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa"
                            ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  "
                            Display="Dynamic" ControlToValidate="txtDateDebutCours" ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="compareDateDebutCoursADateFinInscription" runat="server" ErrorMessage="*La date de début de cours doit être après celle de fin d'inscription
                            " Display="Dynamic" ControlToValidate="txtDateDebutCours" ControlToCompare="txtDateFinInscription" ForeColor="red" Operator="GreaterThan"></asp:CompareValidator>
                    </div>
                    <%--Date début des cours--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                            <asp:Label ID="lblDateFinCours" runat="server" Text="Date fin des cours"></asp:Label></div>
                        <div class="elementFormulaire">
                            <asp:TextBox ID="txtDateFinCours" runat="server" CssClass="datepicker search-query"
                                SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateFinCours") %>'></asp:TextBox>*</div>
                        <asp:RequiredFieldValidator ID="requiredDateFinCours" runat="server" ErrorMessage="*La date de fin des cours est obligatoire"
                            ControlToValidate="txtDateFinCours" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExDateFinCours" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa"
                            ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  "
                            Display="Dynamic" ControlToValidate="txtDateFinCours" ForeColor="Red"></asp:RegularExpressionValidator>
                        <asp:CompareValidator ID="compareDateFinCoursADateDebutCours" runat="server" ErrorMessage="*La date de fin de cours doit être après celle de début de cours
                            " Display="Dynamic" ControlToValidate="txtDateFinCours" ControlToCompare="txtDateDebutCours" ForeColor="red" Operator="GreaterThan"></asp:CompareValidator>
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
                    <%--Animateur--%>
                    <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                        </div>
                        <div class="elementFormulaire">
                            <asp:Button ID="btnAjouter" runat="server" Text="Ajouter" CssClass="btn btn-primary btn-large btn"
                                CommandName="Insert" />
                            <asp:Button ID="btnCancel" runat="server" Text="Canceller" CssClass="btn btn-primary btn-large btn"
                                PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false" />
                        </div>
                    </div>
                    <%--Boutons--%>
                    
                    <%--Label félicitation--%>
                </div>
            </InsertItemTemplate>
            <ItemTemplate>
            </ItemTemplate>
        </asp:ListView>
        <div class="ligneFormulaire">
                        <div class="elementFormulaireTexte">
                        </div>
                        <div class="elementFormulaire">
                            <asp:Image ID="checkImage" runat="server" ImageUrl="~/App_Themes/Original/img/icon_check.png"
                                Visible="false" Height="20px" Width="20px" />
                            <asp:Label ID="lblFelicitation" runat="server" ForeColor="Green" Text="Le cours a été ajouter avec succès !"
                                Visible="false"></asp:Label>
                        </div>
                    </div>
        <asp:EntityDataSource ID="dsCourseAdd" runat="server" ConnectionString="name=modelCLSContainer"
            DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="false"
            EnableDelete="true" EnableInsert="true" EnableUpdate="true">
        </asp:EntityDataSource>
        <asp:EntityDataSource ID="dsTeachers" runat="server" ConnectionString="name=modelCLSContainer"
            DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu_Animateur"
            EnableFlattening="false" EnableDelete="false" EnableInsert="false" EnableUpdate="false"
            Select="it.idAnimateur, it.idMembre,(it.MembresJeu.[prenomMembre]+' '+it.MembresJeu.[nomMembre]) as FullName">
        </asp:EntityDataSource>
        <script>
            $(function () {
                $(".datepicker").datepicker({
                    dayNamesMin: ["Di", "Lu", "Ma", "Me", "Je", "ve", "Sa"],
                    monthNamesShort: ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"],
                    yearRange: "c:c+2",
                    changeMonth: true,
                    changeYear: true,
                    dateFormat: "dd/mm/yy",
                    minDate: "+7d"
                });
            });
        </script>
        <%--Date Picker--%>
    </div>
</asp:Content>
