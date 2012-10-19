<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="employe_client_modify.aspx.vb" Inherits="Page_Employe_employe_client_modify" Theme="Original"%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="contenuPage">
        <div class="titleClient">
            <h3>Modifier un membre</h3>
            </br>
        </div>
        <div class="infoClient">
            <div class="partiGaucheCourrielEdit">
                    <div class="formatZone">
                        <asp:Label ID="lblCourriel" runat="server" Text="Entrez le courriel du membre:"></asp:Label>
                    </div>
                </div>
                <div class="partiDroiteCourrielEdit">
                    <div class="formatZone">
                        <asp:ToolkitScriptManager id="toolKitScriptManager1" runat="server"></asp:ToolkitScriptManager>

                        <asp:TextBox ID="txtCourriel" runat="server" SkinID="txtBoxYellow" CssClass="search-query" Text=""></asp:TextBox>

                        <asp:AutoCompleteExtender ID="AutoCompleteExtender1" 
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
            <div class="infoClient">
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
                        <asp:Button ID="btnAccepter" runat="server" Text="Modifier" commandName="modifier" CssClass="btn btn-primary btn-small" />
                    </div> 
                </div>
             </div>    
            </ItemTemplate>
        </asp:ListView>
                
   </div>

   <asp:EntityDataSource ID="dsListView" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="false" EnableUpdate="True"
    EntityTypeFilter="MembresJeu" 
    where="(@courriel = it.courriel and it.RoleJeu_idRole = 3)">
    <WhereParameters>
        <asp:Parameter Name="courriel" Type="String" defaultValue=""/>
    </WhereParameters>
    </asp:EntityDataSource>

</asp:Content>
