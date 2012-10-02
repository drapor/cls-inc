<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="member_email.aspx.vb" Inherits="Page_Client_member_email" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">

    <div class="titleClient">
        Changement du courriel
        <br />
        <div class="ligneFormulaire">
            <div class="elementFormulaireTexte"><asp:Label ID="lblMembreID" runat="server" Text="Sexe"></asp:Label></div>
            <div class="elementFormulaire">
                <asp:DropDownList ID="dropDownMembre" runat="server" Width="55px" SkinID="ddlBlue" DataSourceId="dsMember" DataValueField="idMembre" AppendDataBoundItems="False" AutoPostBack="True" />
            </div>
        </div>
    </div>

    <asp:ListView ID="lvCourriel" runat="server" DataSourceID="EntityDataSource1" DataKeyNames="idMembre">
        <LayoutTemplate>
            <div class="infoClient">
                <%--<div class="partiGaucheCourriel">
                    <div class="formatZone">
                        <asp:Label ID="lblCourriel" runat="server" Text="Votre présent courriel:"></asp:Label>
                    </div>
                    </br>
                </div>
                
                <div class="partiDroiteCourriel">
                    <div class="formatZone">
                        <asp:Label ID="lblCourrielPresent" runat="server" Text='<%# Eval("courriel") %>'></asp:Label>
                    </div>
                    </br>
                </div>--%>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
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
                        <asp:RequiredFieldValidator ID="requiredCourriel" runat="server" ErrorMessage="*Le Courriel est obligatoire" ControlToValidate="txtNouveauCourriel" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:CompareValidator Display="Dynamic" ID="compareCourriel" runat="server" ErrorMessage="*Votre courriel ne correspond pas" ForeColor="Red" ControlToCompare="txtNouveauCourriel" ControlToValidate="txtNouveauCourrielEncore"></asp:CompareValidator>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="requiredCourrielConfirm" runat="server" ErrorMessage="*Veuillez confirmez votre nouveau courriel" ControlToValidate="txtNouveauCourrielEncore" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="boutonCourriel">
                    <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter" SkinID="btnYellow" CssClass="btn btn-primary btn-small" />
                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Canceler" SkinID="btnYellow" CssClass="btn btn-primary btn-small" />
                </div>
        </ItemTemplate>
    </asp:ListView>
</div>

<asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
    EnableDelete="true" EnableInsert="false" EnableUpdate="true" orderBy="it.idMembre" 
    where="(@MembreID = it.idMembre)">
    <WhereParameters>
        <asp:ControlParameter Name="MembreID" ControlID="dropDownMembre" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsMember" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
    EnableDelete="true" EnableInsert="false" EnableUpdate="true" orderBy="it.idMembre">
    </asp:EntityDataSource>

</asp:Content>
