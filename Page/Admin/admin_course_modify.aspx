<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_course_modify.aspx.vb" Inherits="Page_Admin_admin_course_modify" Theme="Original" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="containerContenuAdmin">


<div class="titleAdminNormal">
    <asp:Label ID="lblModifierCours" runat="server" Text="Modifier un cours"></asp:Label>
</div>


<div class="ligneFormulaire">
    <div class="elementFormulaireTexte">
         Choisissez un cours</div>
<div class="elementFormulaire">
             <asp:DropDownList ID="ddlCours" runat="server" Width="200px" SkinID="ddlBlue" DataSourceId="dsCours" DataValueField="idCours" AppendDataBoundItems="False" AutoPostBack="True" DataTextField="nomCours" />
         </div>
</div>

<asp:ListView ID="lvCourseModify" runat="server" DataSourceID="dsModifyCourse" DataKeyNames="idCours" ItemPlaceholderID="itemPlaceHolder">
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
                    <asp:Label ID="lblGroupeAgeCours" runat="server" Text='<%# Eval("groupeAge") %>'></asp:Label>
                    </div>
                    <div class="ligneCoursNormal">
                    <asp:Label ID="lblAnimateurCours" runat="server" Text='<%# Eval("Animateur_idMembre") %>'></asp:Label>
                    </div>
                </div>
            </div>

            <div class="modifierCoursDroite">
                <div class="partiGaucheCours">
                    <asp:Label ID="lblTarifAdulte" runat="server" Text="Tarif adulte:"></asp:Label>
                    </br>
                    <asp:Label ID="lblTarifEnfant" runat="server" Text="Tarif enfant:"></asp:Label>
                    </br>
                    <asp:Label ID="lblDateDebutInscription" runat="server" Text="Date début inscription:"></asp:Label>
                    </br>
                    <asp:Label ID="lblDateFinInscription" runat="server" Text="Date fin inscription:"></asp:Label>
                    </br>
                    <asp:Label ID="lblDateDebutCours" runat="server" Text="Date début cours:"></asp:Label>
                    </br>
                    <asp:Label ID="lblDateFinCours" runat="server" Text="Date fin cours:"></asp:Label>

                </div>
                
                <div class="partiDroiteCours">
                    <asp:Label ID="lblTarifAdulteCours" runat="server" Text='<%# Eval("tarifAdulte") %>'></asp:Label>
                    </br>
                    <asp:Label ID="lblTarifEnfantCours" runat="server" Text='<%# Eval("tarifEnfant") %>'></asp:Label>
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
                    <asp:Button ID="btnModifier" runat="server" CommandName="Edit" Text="Modifier les informations" CssClass="btn btn-primary" />
                    <asp:Button ID="btnRetour" runat="server" PostBackUrl="~/Page/Admin/home_admin.aspx" Text="Retour" CssClass="btn btn-primary"/> 
                </div>
               
                
        </ItemTemplate>

        <EditItemTemplate>
         <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblNomCours" runat="server" Text="Nom du cours"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtCours" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="50" Text='<%#Bind("nomCours") %>'></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredCours" runat="server" ErrorMessage="*Le nom du cours est obligatoire" ControlToValidate="txtCours" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:Label ID="lblErreurCorus" runat="server" Text="Le cours existe déjà" ForeColor="Red" Visible="false" ></asp:Label>
        </div>
    </div> <%--Nom du cours--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblCategorie" runat="server" Text="Catégorie"></asp:Label></div>
         <div class="elementFormulaire"><asp:DropDownList ID="ddlCategorie" runat="server" Width="100px" SkinID="ddlBlue" AppendDataBoundItems="False" CssClass="search-query" SelectedValue='<%#Bind("categorie") %>' >
             <asp:ListItem Selected="True" Value="Culture">Culture</asp:ListItem>
             <asp:ListItem Value="Loisir">Loisir</asp:ListItem>
             <asp:ListItem Value="Sport">Sport</asp:ListItem>
             </asp:DropDownList>
         </div>
    </div> <%--Catégorie--%>

    <div class="ligneFormulaireDescription">
         <div class="elementFormulaireTexte"><asp:Label ID="lblDescription" runat="server" Text="Description du cours"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtDescription" runat="server" CssClass="search-query" Font-Bold="false"  SkinID="txtBoxDescription"  MaxLength="20" Height="120px" TextMode="MultiLine" Width="320px" style="resize:none;" Text='<%#Bind("description") %>' ></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredDescription" runat="server" ErrorMessage="*La description est obligatoire" ControlToValidate="txtDescription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div> <%--Description--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblPrerequis" runat="server" Text="Prérequis"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtPrerequis" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="25" Text='<%#Bind("prerequis") %>'></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredPrerequis" runat="server" ErrorMessage="*Le prérequis est obligatoire" ControlToValidate="txtPrerequis" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div>  <%--Prérequis--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblTarifAdulte" runat="server" Text="Tarif Adulte"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtTarifAdulte" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="6" Width="50px" Text='<%#Bind("tarifAdulte") %>'></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredTarifAdulte" runat="server" ErrorMessage="*Le tarif adulte est obligatoire" ControlToValidate="txtTarifAdulte" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div> <%--Tarif Adulte--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblTarifEnfant" runat="server" Text="Tarif Enfant"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtTarifEnfant" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="6" Width="50px" Text='<%#Bind("tarifEnfant") %>'></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredTarifEnfant" runat="server" ErrorMessage="*Le tarif enfant est obligatoire" ControlToValidate="txtTarifEnfant" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div> <%--Tarif Enfant--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblGroupeAge" runat="server" Text="Groupe d'âge"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtGroupeAge" runat="server" CssClass="search-query" SkinID="txtBoxBlue" MaxLength="10" Text='<%#Bind("groupeAge") %>'></asp:TextBox></div>
         <div class="elementFormulaireRequired">
        <asp:RequiredFieldValidator ID="requiredGroupeAge" runat="server" ErrorMessage="*Le groupe d'âge est obligatoire" ControlToValidate="txtGroupeAge" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        </div>
    </div> <%--Groupe d'âge--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblDateDebutInscription" runat="server" Text="Date début des inscriptions"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtDateDebutInscription" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateDebutInscription", "{0:yyyy-MM-dd}") %>'></asp:TextBox></div>
        <asp:RequiredFieldValidator ID="requiredDateDebutInscription" runat="server" ErrorMessage="*La date de début des inscriptions est obligatoire" ControlToValidate="txtDateDebutInscription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExDateDebutInscription" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa" ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  " Display="Dynamic" ControlToValidate="txtDateDebutInscription" ForeColor="Red"></asp:RegularExpressionValidator>
    </div> <%--Date début des inscriptions--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblDateFinInscription" runat="server" Text="Date fin des inscriptions"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtDateFinInscription" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateFinInscription", "{0:yyyy-MM-dd}") %>'></asp:TextBox></div>
        <asp:RequiredFieldValidator ID="requiredDateFinInscription" runat="server" ErrorMessage="*La date de fin des inscriptions est obligatoire" ControlToValidate="txtDateFinInscription" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExDateFinInscription" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa" ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  " Display="Dynamic" ControlToValidate="txtDateFinInscription" ForeColor="Red"></asp:RegularExpressionValidator>
    </div> <%--Date fin des inscriptions--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblDateDebutCours" runat="server" Text="Date début des cours"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtDateDebutCours" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateDebutCours", "{0:yyyy-MM-dd}") %>'></asp:TextBox></div>
        <asp:RequiredFieldValidator ID="requiredDateDebutCours" runat="server" ErrorMessage="*La date de début des cours est obligatoire" ControlToValidate="txtDateDebutCours" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExDateDebutCours" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa" ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  " Display="Dynamic" ControlToValidate="txtDateDebutCours" ForeColor="Red"></asp:RegularExpressionValidator>
    </div> <%--Date début des cours--%>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblDateFinCours" runat="server" Text="Date fin des cours"></asp:Label></div>
         <div class="elementFormulaire"><asp:TextBox ID="txtDateFinCours" runat="server" CssClass="datepicker search-query" SkinID="txtBoxBlue" MaxLength="10" ForeColor="Red" Width="80px" Text='<%#Bind("dateFinCours", "{0:yyyy-MM-dd}") %>'></asp:TextBox></div>
        <asp:RequiredFieldValidator ID="requiredDateFinCours" runat="server" ErrorMessage="*La date de fin des cours est obligatoire" ControlToValidate="txtDateFinCours" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="regExDateFinCours" runat="server" ErrorMessage="*La date n'est pas dans le format jj/mm/aaaa" ValidationExpression="^(((((0[1-9])|(1\d)|(2[0-8]))\/((0[1-9])|(1[0-2])))|((31\/((0[13578])|(1[02])))|((29|30)\/((0[1,3-9])|(1[0-2])))))\/((20[0-9][0-9])|(19[0-9][0-9])))|((29\/02\/(19|20)(([02468][048])|([13579][26]))))$  " Display="Dynamic" ControlToValidate="txtDateFinCours" ForeColor="Red"></asp:RegularExpressionValidator>
    </div> <%--Date fin des cours--%>
    
    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"><asp:Label ID="lblTeacher" runat="server" Text="Animateur du cours"></asp:Label></div>
         <div class="elementFormulaire"><asp:DropDownList ID="ddlTeachers" runat="server" DataSourceID="dsTeachers" DataTextField="FullName" DataValueField="idMembre" SkinID="ddlBlue" AppendDataBoundItems="False" CssClass="search-query" SelectedValue='<%#Bind("Animateur_idMembre") %>'>
             </asp:DropDownList>
         </div>
    </div>

    <div class="ligneFormulaire">
         <div class="elementFormulaireTexte"></div>
         <div class="elementFormulaire">
             <asp:Button ID="btnAjouter" runat="server" Text="Accepter les modifications" CssClass="btn btn-primary btn-large btn" CommandName="Update" />
             <asp:Button ID="btnCancel" runat="server" Text="Canceller" CssClass="btn btn-primary btn-large btn" PostBackUrl="~/Page/Admin/home_admin.aspx" CausesValidation="false"/>
         </div>
    </div> <%--Boutons--%>

    <div class="ligneFormulaire">
        <div class="elementFormulaireTexte"></div>
        <div class="elementFormulaire">
            <asp:Image ID="checkImage" runat="server" ImageUrl="~/App_Themes/Original/img/icon_check.png" Visible="false" Height="20px" Width="20px" />
            <asp:Label ID="lblFelicitation" runat="server" ForeColor="Green" Text="Le cours a été mis à jour avec succès !" Visible="false"></asp:Label>
        </div>
    </div> <%--Label félicitation--%>
</div>



        </EditItemTemplate>

</asp:ListView>

<asp:EntityDataSource ID="dsTeachers" runat="server" ConnectionString="name=modelCLSContainer" 
DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu_Animateur" EnableFlattening="false"
EnableDelete="false" EnableInsert="false" EnableUpdate="false"
Select="it.idAnimateur, it.idMembre,(it.MembresJeu.[prenomMembre]+' '+it.MembresJeu.[nomMembre]) as FullName"
>
</asp:EntityDataSource>

<asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer" 
DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="false"
EnableDelete="true" EnableInsert="true" EnableUpdate="true">
</asp:EntityDataSource>

<asp:EntityDataSource ID="dsModifyCourse" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="false" EnableUpdate="True" orderBy="it.nomCours"
    where="(@CoursID = it.idCours)">
    <WhereParameters>
        <asp:ControlParameter Name="CoursID" ControlID="ddlCours" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>



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
 
	</script> <%--Date Picker--%>

</div>
</asp:Content>
