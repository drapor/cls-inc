<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false"
    CodeFile="Default.aspx.vb" Inherits="Page_Default" Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <div class="containerAccueil">
        <div class="containerZoneTexte">
        <br />
            <div id="slideshow">
                <ul class="slides">
                    <li>
                        <img src="../App_Themes/Original/img/photos/1.jpg" width="450" height="300" alt="Baseball" /></li>
                    <li>
                        <img src="../App_Themes/Original/img/photos/2.jpg" width="450" height="300" alt="Echec" /></li>
                    <li>
                        <img src="../App_Themes/Original/img/photos/3.jpg" width="450" height="300" alt="Gymnastic" /></li>
                    <li>
                        <img src="../App_Themes/Original/img/photos/4.jpg" width="450" height="300" alt="Peinture" /></li>
                    <li>
                        <img src="../App_Themes/Original/img/photos/5.jpg" width="450" height="300" alt="Soccer" /></li>
                    <li>
                        <img src="../App_Themes/Original/img/photos/6.jpg" width="450" height="300" alt="Theatre" /></li>
                </ul>
                <span class="arrow previous"></span><span class="arrow next"></span>
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
                <script src="../App_Themes/Original/js/script.js"></script>
            </div>
            <br />
            <div class="zoneTexteAccueil">
                <strong>
                    <asp:Label ID="lblMotBienvenu" runat="server" Text="Mot de bienvenue"></asp:Label></strong>
                <br />
                <br />
                <asp:Label ID="lblTextAccueil" runat="server" Text="Chez CLS inc, nous avons vos intérêts à coeur. Ici, vous trouverez plusieurs activités qui vous intéresse pour toutes la familles. 
Profitez de nos nombreux tarifs familiales qui vous avantageront. Notre nouveau site vous donnera l’opportunité de vous inscrire vous et vos enfants de façon rapide et simple."></asp:Label>
            </div>
            <br />
            <br />
        </div>
        <div class="containerZoneMenu">
            <div class="bgZoneMenu" style="margin-bottom:10px;">
                <div class="menuZoneMenu">
                    <div class="textZoneMenu">
                        Dates importantes</div>
                    <ul>
                        <li style="color: Black;">
                            <asp:Label ID="Label1" ForeColor="Black" Font-Size="12px" runat="server" Text="Grande ouverture 24 décembre"></asp:Label></li>
                        <li style="color: Black;">
                            <asp:Label ID="Label2" ForeColor="Black" Font-Size="12px" runat="server" Text="Grande fermeture 25 décembre"></asp:Label></li>
                        <li style="color: Black;">
                            <asp:Label ID="Label3" ForeColor="Black" Font-Size="12px" runat="server" Text="Grande réouverture 26 décembre"></asp:Label></li>
                        <li style="color: Black;">
                            <asp:Label ID="Label4" ForeColor="Black" Font-Size="12px" runat="server" Text="Fin du monde 32 décembre"></asp:Label></li>
                    </ul>
                </div>
            </div>
            <div class="bgZoneMenu">
                <div class="menuZoneMenu">
                    <div class="textZoneMenu">
                        Nouvelles</div>
                        <ul>
                        <li style="color: Black;">
                            <asp:Label ID="Label5" ForeColor="Black" Font-Size="12px" runat="server" Text="Le directeur de CLS inc. M. Richard Trudel touche une somme de 3,5 millions de dollars"></asp:Label></li>
                        <li style="color: Black;">
                            <asp:Label ID="Label6" ForeColor="Black" Font-Size="12px" runat="server" Text="M. Richard Trudel prévoit ouvrir d'autres centre dans plus de 200 pays à travers le monde d'ici janvier 2013"></asp:Label></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
