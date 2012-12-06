<%@ Page Title="" Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master" AutoEventWireup="false" CodeFile="admin_rapport_cours.aspx.vb" Inherits="Page_Admin_admin_rapport_cours" Theme="Original"%>

<asp:Content ID="Content1" ContentPlaceHolderID="menu" Runat="Server">
<asp:Label ID="lblTitrePage" runat="server" Text="Rapports" Font-Size="24px" Font-Bold="true" />
    <br />
    <br />
    <br />
    <asp:Label ID="lblType" runat="server" Text="Trier selon:"></asp:Label>
    <asp:DropDownList ID="dropDownType" runat="server" Width="250px" SkinID="ddlBlue"
        AutoPostBack="True">
        <asp:ListItem Value="0" Text="Ordre Alphabétique A-Z" Selected="True"></asp:ListItem>
        <asp:ListItem Value="1" Text="Ordre Alphabétique Z-A"></asp:ListItem>
        <asp:ListItem Value="2" Text="Catégorie"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    
    <div id="contentStart">
        <asp:MultiView ID="MVPrincipal" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewAlpha" runat="server">
            <asp:Label ID="lblCoursAlpha" runat="server" Text="Liste des Cours triés par ordre alphabétique" Font-Size="20px"
        Font-Bold="true" />
    <br />
    <br />
                <asp:ListView ID="lvCoursAlpha" runat="server" DataSourceID="dsCours" DataKeyNames="idCours">
                    <LayoutTemplate>
                        <table align="center" style="width: 100%; border: 1px solid #000000; font-weight: bolder;">
                            <tr style="background-color: #1800B8; color: White; font-size: 14px;">
                                <th style="border: 1px solid #000000; width: 30%;">
                                    <asp:Label ID="lblNom" runat="server" Text="Nom du cours"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 30%; padding: 5px;">
                                    <asp:Label ID="lblCatégorie" runat="server" Text="Catégorie"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 40%;">
                                    <asp:Label ID="lblTarif" runat="server" Text="Tarif"></asp:Label>
                                </th>
                            </tr>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr align="center" class="<%# GetCssName(Container) %>" style="font-size: 10px;">
                            <th style="border: 1px solid #000000; width: 30%;">
                                <asp:Label ID="txtNom" runat="server" Text='<%# eval("nomCours") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 30%; padding: 5px;">
                                <asp:Label ID="txtCategorie" runat="server" Text='<%# eval("categorie") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 40%;">
                                <asp:Label ID="txtTarif" runat="server" Text='<%# eval("tarif") %>'></asp:Label>
                            </th>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </asp:View>
            <asp:View ID="viewcategorie" runat="server">
            <asp:Label ID="lblCoursCategorie" runat="server" Text="Liste des Cours triés par catégorie" Font-Size="20px"
        Font-Bold="true" />
    <br />
    <br />
                <asp:ListView ID="lvCoursCategorie" runat="server" DataSourceID="dsCours" DataKeyNames="idCours">
                    <LayoutTemplate>
                        <table align="center" style="width: 100%; border: 1px solid #000000; font-weight: bolder;">
                            <tr style="background-color: #1800B8; color: White; font-size: 14px;">
                               <th style="border: 1px solid #000000; width: 30%; padding: 5px;">
                                    <asp:Label ID="lblCatégorie" runat="server" Text="Catégorie"></asp:Label>
                                </th>
                               <th style="border: 1px solid #000000; width: 30%;">
                                    <asp:Label ID="lblNom" runat="server" Text="Nom du cours"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 40%;">
                                    <asp:Label ID="lblTarif" runat="server" Text="Tarif"></asp:Label>
                                </th>
                            </tr>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr align="center" class="<%# GetCssName(Container) %>" style="font-size: 10px;">
                            <th style="border: 1px solid #000000; width: 30%; padding: 5px;">
                                <asp:Label ID="txtCategorie" runat="server" Text='<%# eval("categorie") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 30%;">
                                <asp:Label ID="txtNom" runat="server" Text='<%# eval("nomCours") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 40%;">
                                <asp:Label ID="txtTarif" runat="server" Text='<%# eval("tarif") %>'></asp:Label>
                            </th>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </asp:View>
        </asp:MultiView>
    </div>
    <br />
    <a href="javascript:PrintThisPage();">Aperçu du rapport lors de l'impression</a>
    <script language="javascript">

        function PrintThisPage() {
            var sOption = "toolbar=yes,location=no,directories=yes,menubar=yes,";
            sOption += "scrollbars=yes,width=750,height=600,left=100,top=25";

            var winprint = window.open("print.aspx", "Print", sOption);

            winprint.focus();
        }

</script>
    <asp:EntityDataSource ID="dsCours" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="CoursJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True">
    </asp:EntityDataSource>
</asp:Content>

