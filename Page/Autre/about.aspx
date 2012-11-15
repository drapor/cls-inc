<%@ Page Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="about.aspx.vb" Inherits="Page_Autre_about" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<div class="contenuPage" style="margin-top:10px; margin-left:30px;">
    <div class="entetePage">
        <div class="menuPageGauche" style="margin-top:10px; margin-left:10px;">
            <asp:Label ID="lblEntete" runat="server" text="À propos de nous" Font-Size="24px" Font-Bold="true"/>
        </div>   
    </div>

    <div class="contenuStandard" style="margin-left:30px;">
        <p>Les installations du service CSL (Culture Loisir Sport) sont sont mises à la disposition de la</p>
        <p>communauté. Un personnel reconnu pour sa compétence assure l'encadrement de près de</p>
        <p>50 activités disponibles pour tous.</p>
        <br />
        <p>Nous sommes là pour vous!</p>    
    </div>
</div>
</asp:Content>
