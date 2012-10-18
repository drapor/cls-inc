<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="employe_client_delete.aspx.vb" Inherits="Page_Employe_employe_client_delete" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="contenuPage">
        <div class="titleClient">
            <h3>Supprimer un membre</h3>
            </br>
        </div>
        <div class="partiGaucheCourrielEdit">
                    <div class="formatZone">
                        <asp:Label ID="lblCourriel" runat="server" Text="Entrez le courriel du membre:"></asp:Label>
                    </div>
                    <%--</br>
                    <div class="formatZone">
                        <asp:Label ID="lblNouveauCourriel" runat="server" Text="Voici le membre à supprimer:" ></asp:Label>
                    </div>--%>
                </div>
                <div class="partiDroiteCourrielEdit">
                    <div class="formatZone">
                        <asp:TextBox ID="txtCourriel" runat="server" SkinID="txtBoxYellow" CssClass="search-query" Text=""></asp:TextBox>
                    </div>
                    <%--</br>
                    <div class="formatZone">
                        <asp:Label ID="lblMembre" runat="server" Text='<%# Eval("prenomMembre" + " " + "nomMembre") %>'></asp:Label>
                    </div>--%>
                </div>
        <div class="bouton">
                        <asp:Button ID="btnAccepter" runat="server" Text="Supprimer" onClick="actionDelete" CssClass="btn btn-primary btn-small" />
                        <asp:Button ID="btnCancel" runat="server" Text="Annuler" CssClass="btn btn-primary btn-small" PostBackUrl="~/Page/Employe/home_employe.aspx" />
                    </div>

        <asp:ListView ID="lvMembre" runat="server" DataSourceID="dsListView" DataKeyNames="idMembre">
            <LayoutTemplate>
                <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
            </LayoutTemplate>
            <ItemTemplate>  
            </ItemTemplate>
        </asp:ListView>
   </div>

   <asp:EntityDataSource ID="dsListView" runat="server" ConnectionString="name=modelCLSContainer"
    DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
    EnableDelete="True" EnableInsert="false" EnableUpdate="True"
    EntityTypeFilter="MembresJeu" 
    where="(@courriel = it.courriel)">
    <WhereParameters>
        <asp:Parameter Name="courriel" Type="String" defaultValue=""/>
    </WhereParameters>
    </asp:EntityDataSource>

</asp:Content>
