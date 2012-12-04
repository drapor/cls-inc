<%@ Page Title="" Language="VB" MasterPageFile="~/Page/Admin/MasterPageAdmin.master"
    AutoEventWireup="false" CodeFile="admin_rapport_animateur.aspx.vb" Inherits="Page_Admin_admin_rapport_animateur"
    Theme="Original" %>

<asp:Content ID="Content1" ContentPlaceHolderID="menu" runat="Server">
    <asp:Label ID="lblTitrePage" runat="server" Text="Rapports" Font-Size="24px" Font-Bold="true" />
    <br />
    <br />
    <br />
    <asp:Label ID="lblType" runat="server" Text="Trier selon:"></asp:Label>
    <asp:DropDownList ID="dropDownType" runat="server" Width="250px" SkinID="ddlBlue"
        AutoPostBack="True">
        <asp:ListItem Value="0" Text="Nom de  famille" Selected="True"></asp:ListItem>
        <asp:ListItem Value="1" Text="Courriel"></asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    <div id="contentStart">
        <asp:MultiView ID="MVPrincipal" runat="server" ActiveViewIndex="0">
            <asp:View ID="viewNom" runat="server">
                <asp:Label ID="lblEmployeNom" runat="server" Text="Liste des Animateurs triés par nom de famille"
                    Font-Size="20px" Font-Bold="true" />
                <br />
                <br />
                <asp:ListView ID="lvEmployeNom" runat="server" DataSourceID="dsAnimateur" DataKeyNames="idMembre">
                    <LayoutTemplate>
                        <table align="center" style="width: 100%; border: 1px solid #000000; font-weight: bolder;">
                            <tr style="background-color: #1800B8; color: White; font-size: 16px;">
                                <th style="border: 1px solid #000000; width: 10%;">
                                    <asp:Label ID="lblNom" runat="server" Text="Nom"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 10%; padding: 5px;">
                                    <asp:Label ID="lblPrenom" runat="server" Text="Prénom"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 25%;">
                                    <asp:Label ID="lblCourriel" runat="server" Text="Courriel"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 20%;">
                                    <asp:Label ID="lblAdresse" runat="server" Text="Adresse"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 15%;">
                                    <asp:Label ID="lvlVille" runat="server" Text="Ville"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 20%;">
                                    <asp:Label ID="lblTelephone" runat="server" Text="Téléphone"></asp:Label>
                                </th>
                            </tr>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr align="center" class="<%# GetCssName(Container) %>" style="font-size: 10px;">
                            <th style="border: 1px solid #000000; width: 10%;">
                                <asp:Label ID="txtNom" runat="server" Text='<%# eval("nomMembre") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 10%; padding: 5px;">
                                <asp:Label ID="txtPrenom" runat="server" Text='<%# eval("prenomMembre") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 25%;">
                                <asp:Label ID="txtCourriel" runat="server" Text='<%# eval("courriel") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 20%;">
                                <asp:Label ID="txtAdresse" runat="server" Text='<%# eval("adresse") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 15%;">
                                <asp:Label ID="txtVille" runat="server" Text='<%# eval("ville") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 20%;">
                                <asp:Label ID="txtTelephone" runat="server" Text='<%# eval("telephoneMembre") %>'></asp:Label>
                            </th>
                        </tr>
                    </ItemTemplate>
                </asp:ListView>
            </asp:View>
            <asp:View ID="viewCourriel" runat="server">
                <asp:Label ID="lblEmployeCourriel" runat="server" Text="Liste des Animateurs triés par courriel"
                    Font-Size="20px" Font-Bold="true" />
                <br />
                <br />
                <asp:ListView ID="lvEmployeCourriel" runat="server" DataSourceID="dsAnimateur" DataKeyNames="idMembre">
                    <LayoutTemplate>
                        <table align="center" style="width: 100%; border: 1px solid #000000; font-weight: bolder;">
                            <tr style="background-color: #1800B8; color: White; font-size: 16px;">
                                <th style="border: 1px solid #000000; width: 25%;">
                                    <asp:Label ID="lblCourriel" runat="server" Text="Courriel"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 10%;">
                                    <asp:Label ID="lblNom" runat="server" Text="Nom"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 10%; padding: 5px;">
                                    <asp:Label ID="lblPrenom" runat="server" Text="Prénom"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 20%;">
                                    <asp:Label ID="lblAdresse" runat="server" Text="Adresse"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 15%;">
                                    <asp:Label ID="lvlVille" runat="server" Text="Ville"></asp:Label>
                                </th>
                                <th style="border: 1px solid #000000; width: 20%;">
                                    <asp:Label ID="lblTelephone" runat="server" Text="Téléphone"></asp:Label>
                                </th>
                            </tr>
                            <asp:PlaceHolder runat="server" ID="itemPlaceHolder" />
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr align="center" class="<%# GetCssName(Container) %>" style="font-size: 10px;">
                            <th style="border: 1px solid #000000; width: 25%;">
                                <asp:Label ID="txtCourriel" runat="server" Text='<%# eval("courriel") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 10%;">
                                <asp:Label ID="txtNom" runat="server" Text='<%# eval("nomMembre") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 10%; padding: 5px;">
                                <asp:Label ID="txtPrenom" runat="server" Text='<%# eval("prenomMembre") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 20%;">
                                <asp:Label ID="txtAdresse" runat="server" Text='<%# eval("adresse") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 15%;">
                                <asp:Label ID="txtVille" runat="server" Text='<%# eval("ville") %>'></asp:Label>
                            </th>
                            <th style="border: 1px solid #000000; width: 20%;">
                                <asp:Label ID="txtTelephone" runat="server" Text='<%# eval("telephoneMembre") %>'></asp:Label>
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
    <asp:EntityDataSource ID="dsAnimateur" runat="server" ConnectionString="name=modelCLSContainer"
        DefaultContainerName="modelCLSContainer" EntitySetName="MembresJeu" EnableFlattening="False"
        EnableDelete="True" EnableInsert="True" EnableUpdate="True" OrderBy="it.nomMembre"
        Where="it.RoleJeu_idRole = 6">
    </asp:EntityDataSource>
</asp:Content>
