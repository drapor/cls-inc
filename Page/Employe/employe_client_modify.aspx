<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="employe_client_modify.aspx.vb" Inherits="Page_Employe_employe_client_modify" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <div class="contenuPage">
        <div class="titleClient">
            <h3>Modifier un membre</h3>
            </br>
        </div>
                <div class="partiGaucheCourriel">
                    <div class="formatZone">
                        <asp:Label ID="lblCourriel" runat="server" Text="Entrez le courriel du membre:"></asp:Label>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:Label ID="lblNouveauCourriel" runat="server" Text="Voici le membre à modifier:" ></asp:Label>
                    </div>
                </div>
                <div class="partiDroiteCourriel">
                    <div class="formatZone">
                        <asp:TextBox ID="txtCourriel" runat="server" SkinID="txtBoxYellow" CssClass="search-query" Text='<%# Bind("courriel") %>'></asp:TextBox>
                    </div>
                    </br>
                    <div class="formatZone">
                        <asp:Label ID="lblMembre" runat="server" Text='<%# Eval("prenomMembre" + " " + "nomMembre") %>'></asp:Label>
                    </div>
                    <div class="bouton">
                        <asp:Button ID="btnAccepter" runat="server" Text="Accepter" CssClass="btn btn-primary btn-small" PostBackUrl="~/Page/Client/home_member.aspx" />
                        <asp:Button ID="btnCancel" runat="server" Text="Canceler" CssClass="btn btn-primary btn-small" PostBackUrl="~/Page/Employe/home_employe.aspx" />
                    </div>
                </div>
                
   </div>
</asp:Content>
