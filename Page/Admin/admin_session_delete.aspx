﻿<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="admin_session_delete.aspx.vb" Inherits="Page_Admin_admin_session_delete" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage">
<div class="title">
<h3>Ajouter une session</h3>
<br />
</div>

<div class="partiSession">
    <div class="sessionGauche">   
                <div class="formatZone">
                    <asp:Label ID="lblNomSession" runat="server" Text="Choisir la session:"></asp:Label>
                </div>
            </div>

            <div class="sessionDroite">           
                <div class="formatZone">
                    <asp:DropDownList ID="ddlNomSession" SkinID="ddlBlue"  runat="server" CssClass="search-query" DataSourceID="dsSessionSelection" DataTextField="nomSession" DataValueField="idSession" appendDataBoundItems="False"  MaxLength="16" Width="170px" AutoPostBack="True"></asp:DropDownList>
                </div>
            </div>
</div>

<div class="contenuStandard">

    <asp:ListView ID="lvSession" runat="server" DataSourceID="dsSession" DataKeyNames="idSession">
        <LayoutTemplate>
            <div class="partiSession">
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </div>
        </LayoutTemplate>

        <ItemTemplate> 
            <div class="groupeBouton">
                <div class="boutonGroupeRetour">
                        <asp:Button ID="btnRetour" runat="server" Text="Retour" CssClass="btn btn-primary" Width="120px" CausesValidation="false" PostBackUrl="~/Page/Admin/home_admin.aspx"/>
                    </div>
                <div class="boutonGroupeAjout">
                    <asp:Button ID="btnSupprime" runat="server" commandName="Delete" Text="Supprimer" CssClass="btn btn-primary" Width="120px" OnClientClick="return confirm('Veuillez confirmer la modification');"/>
                </div>            
            </div>          
        </ItemTemplate>
    </asp:ListView>
</div>
</div>

    <asp:EntityDataSource ID="dsSessionSelection" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="SessionJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="False" EnableUpdate="False">
    </asp:EntityDataSource>

    <asp:EntityDataSource ID="dsSession" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="SessionJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="False" EnableUpdate="False"
    where="(@sessionID = it.idSession)">
    <WhereParameters>
        <asp:ControlParameter Name="sessionID" ControlID="ddlNomSession" PropertyName="SelectedValue" Type="Int32" />
    </WhereParameters>
    </asp:EntityDataSource>

</asp:Content>
