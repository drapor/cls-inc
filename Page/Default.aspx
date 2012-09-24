<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="Page_Default" Theme="Original" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="containerZoneTexte">

<div id="slideshow">


    <ul class="slides">
        <li><img src="../App_Themes/Original/img/photos/1.jpg" width="450" height="300" alt="Baseball" /></li>
        <li><img src="../App_Themes/Original/img/photos/2.jpg" width="450" height="300" alt="Echec" /></li>
        <li><img src="../App_Themes/Original/img/photos/3.jpg" width="450" height="300" alt="Gymnastic" /></li>
        <li><img src="../App_Themes/Original/img/photos/4.jpg" width="450" height="300" alt="Peinture" /></li>
        <li><img src="../App_Themes/Original/img/photos/5.jpg" width="450" height="300" alt="Soccer" /></li>
        <li><img src="../App_Themes/Original/img/photos/6.jpg" width="450" height="300" alt="Theatre" /></li>
    </ul>
    <span class="arrow previous"></span>
    <span class="arrow next"></span>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
<script src="../App_Themes/Original/js/script.js"></script>

</div>
    
    <div class="zoneTexteAccueil">
    <strong><asp:Label ID="lblMotBienvenu" runat="server" Text="Mot de bienvenue"></asp:Label></strong>
    </br>
    <asp:Label ID="lblTextAccueil" runat="server" Text="Chez CLS inc, nous avons vos intérêts à coeur. Ici, vous trouverez plusieurs activités qui vous intéresse pour toutes la familles. 
Profitez de nos nombreux tarifs familiales qui vous avantageront. Notre nouveau site vous donnera l’opportunité de vous inscrire vous et vos enfants de façon rapide et simple."></asp:Label>
    </div>

</div>
<div class="containerZoneMenu">

        <div class="bgZoneMenu">
        <div class="menuZoneMenu"><div class="textZoneMenu">Dates importantes</div></div>
        </div>

        <div class="bgZoneMenu">
        <div class="menuZoneMenu"><div class="textZoneMenu">Nouvelles</div></div>
        </div>


</div>





</asp:Content>

