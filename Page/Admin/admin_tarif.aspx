<%@ Page Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master" AutoEventWireup="false" CodeFile="admin_tarif.aspx.vb"
    Inherits="Page_Admin_admin_group_modify" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="Server">
    <asp:Label ID="lblTitreTarif" runat="server" Text="Modifier les tarifs" Font-Size="24px" Font-Bold="true" />
    <asp:Image ID="checkImage" runat="server" ImageUrl="~/App_Themes/Original/img/icon_check.png"
                Visible="false" Height="20px" Width="20px" />
            <asp:Label ID="lblFelicitation" runat="server" ForeColor="Green" Text="Les modifications ont bien été enregistrées!"
                Visible="false"></asp:Label>
    <br />
    <br />
    <br />

        <asp:ListView ID="lvGroupe" runat="server" DataSourceID="dsTarif" DataKeyNames="idTarif">
            <LayoutTemplate>
                <div class="infoAdmin" style="margin-left:5px;">
                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                </div>
            </LayoutTemplate>
            <InsertItemTemplate>
            </InsertItemTemplate>
            <ItemTemplate>
                <div class="sectionAdmin">
                    <div class="sectionTitreAdmin">
                        <asp:Label ID="lblTarifNouveauMembre" runat="server" Text="Tarif nouveau membre"></asp:Label>
                    </div>
                </div>
                <div style="margin-left:15px; margin-bottom:10px;">
                    <asp:Label ID="lblVeuillezEntreTarifNouveauMembre" runat="server" Text="Veuillez entrer le tarif d'un nouveau membre"></asp:Label>
                    <br />
                    <br />
                    <div style="margin-left:70px;">
                    <asp:TextBox ID="txtTarifNouveauMembre" SkinID="txtBoxYellowPerso" Width="40px" runat="server"
                    CssClass="search-query" Text='<%# Bind("tarifNouveauMembre") %>'></asp:TextBox>
                    <asp:RequiredFieldValidator ID="requiredTarifNouveauMembre" runat="server" ErrorMessage="*Le tarif des nouveaux membres est obligatoire"
                    ControlToValidate="txtTarifNouveauMembre" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="regExGroupeAgeMin" runat="server" ErrorMessage="*Veuillez entrer seulement des chiffres"
                    ValidationExpression="^[0-9]+$" Display="Dynamic" ControlToValidate="txtTarifNouveauMembre"
                    ForeColor="Red"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="sectionAdmin">
                    <div class="sectionTitreAdmin">
                        <asp:Label ID="lblRabaisEnfant" runat="server" Text="Rabais enfants"></asp:Label>
                    </div>
                </div>
                <div style="margin-left:15px;">
                    <div class="ligneRabaisEnfant">
                        <asp:Label ID="lblTarifChaqueEnfant" runat="server" Text="Veuillez entrer les rabais (%) attribué pour chaque enfants abonné"></asp:Label>
                    </div>
                    <div class="ligneRabaisEnfant">
                        <asp:Label ID="lbl1erEnfant" runat="server" Text="1er Enfant: "></asp:Label>
                        <asp:TextBox ID="txtRabais1erEnfant" SkinID="txtBoxYellowPerso" runat="server" Width="30px"
                        CssClass="search-query" Text='<%# Bind("rabais1Enfant") %>' MaxLength="3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredRabais1erEnfant" runat="server" ErrorMessage="*Le rabais du 1er enfant est obligatoire"
                        ControlToValidate="txtRabais1erEnfant" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExRabais1erEnfant" runat="server" ErrorMessage="*Veuillez entrer seulement des chiffres"
                        ValidationExpression="^[0-9]+$" Display="Dynamic" ControlToValidate="txtRabais1erEnfant"
                        ForeColor="Red"></asp:RegularExpressionValidator><br />
                    </div>
                    <div class="ligneRabaisEnfant">
                        <asp:Label ID="lbl2eEnfant" runat="server" Text="2e Enfant:  "></asp:Label>
                        &nbsp;
                        <asp:TextBox ID="txtRabais2eEnfant" SkinID="txtBoxYellowPerso" runat="server" Width="30px"
                        CssClass="search-query" Text='<%# Bind("rabais2Enfant") %>' MaxLength="3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredRabais2eEnfant" runat="server" ErrorMessage="*Le rabais du 2e enfant est obligatoire"
                        ControlToValidate="txtRabais2eEnfant" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExRabais2eEnfant" runat="server" ErrorMessage="*Veuillez entrer seulement des chiffres"
                        ValidationExpression="^[0-9]+$" Display="Dynamic" ControlToValidate="txtRabais2eEnfant"
                        ForeColor="Red"></asp:RegularExpressionValidator><br />
                    </div>
                    <div class="ligneRabaisEnfant">
                        <asp:Label ID="lbl3eEnfant" runat="server" Text="3e Enfant:  "></asp:Label>
                        &nbsp;
                        <asp:TextBox ID="txtRabais3eEnfant" SkinID="txtBoxYellowPerso" runat="server" Width="30px"
                        CssClass="search-query" Text='<%# Bind("rabais3Enfant") %>' MaxLength="3"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="requiredRabais3eEnfant" runat="server" ErrorMessage="*Le rabais du 3e enfant est obligatoire"
                        ControlToValidate="txtRabais3eEnfant" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="regExRabais3eEnfant" runat="server" ErrorMessage="*Veuillez entrer seulement des chiffres"
                        ValidationExpression="^[0-9]+$" Display="Dynamic" ControlToValidate="txtRabais3eEnfant"
                        ForeColor="Red"></asp:RegularExpressionValidator><br />
                    </div>
                </div>
                <div class="ligneRabaisEnfant" style="margin-left:50px; margin-top:20px;">
                    <asp:Button ID="btnUpdate" runat="server" CommandName="Update" Text="Modifier" CssClass="btn btn-primary"
                        Width="120px" OnClick="confirmation"/>
                </div>
            </ItemTemplate>
        </asp:ListView>

    <asp:EntityDataSource ID="dsTarif" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="TarifsJeu" EnableFlattening="False"
        EnableDelete="False" EnableInsert="True" EnableUpdate="True">
    </asp:EntityDataSource>
</asp:Content>
