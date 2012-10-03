<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="member_password.aspx.vb" Inherits="Page_member_password" Theme="Original"%>

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

    <asp:ListView ID="lvMP" runat="server" DataSourceID="EntityDataSource1" DataKeyNames="idMembre">
        <LayoutTemplate>
            <div class="infoClient">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>
        <ItemTemplate>
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
                        <asp:TextBox ID="txtPresentMP" runat="server" SkinID="txtBoxYellow" Text='<%# Eval("motPasse") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="txtNouveauMP" runat="server" SkinID="txtBoxYellow" Text='<%# Bind("MotPasse") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:TextBox ID="txtNouveauMPEncore" runat="server" SkinID="txtBoxYellow" Text=""></asp:TextBox>
                    </div>
                </div>

                <div class="validation">
                    <div class="formatZone">
                        <asp:RequiredFieldValidator ID="requiredMP" runat="server" ErrorMessage="*Le mot de passe est obligatoire" ControlToValidate="txtNouveauMP" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:CompareValidator Display="Dynamic" ID="compareMP" runat="server" ErrorMessage="*Votre courriel ne correspond pas" ForeColor="Red" ControlToCompare="txtNouveauMP" ControlToValidate="txtNouveauMPEncore"></asp:CompareValidator>
                        <asp:RequiredFieldValidator Display="Dynamic" ID="requiredMPConfirm" runat="server" ErrorMessage="*Veuillez confirmez votre nouveau mot de passe" ControlToValidate="txtNouveauMPEncore" ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="boutonCourriel">
                    <asp:Button ID="btnAccepter" runat="server" CommandName="Update" Text="Accepter" CssClass="btn btn-primary btn-small" />
                    <asp:Button ID="btnCancel" runat="server" CommandName="Cancel" Text="Canceler" CssClass="btn btn-primary btn-small" />
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
