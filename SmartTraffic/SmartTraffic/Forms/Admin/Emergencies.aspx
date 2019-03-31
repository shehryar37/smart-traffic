<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="Emergencies.aspx.cs" Inherits="SmartTraffic.Forms.Admin.Emergencies" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpTitle" runat="server">
    Emergencies | Smart Traffic System
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder" runat="server">
    <script src="https://api-maps.yandex.ru/2.1/?apikey=9108b380-ff05-40ed-ae8c-2ba52a4ee075&lang=en_US" type="text/javascript"></script>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Panel runat="server" ID="overlays" Style="position: fixed; display: none; width: 100%; top: 0; left: 0; bottom: 0; top: 0; background-color: rgba(0,0,0,0.5); z-index: 2; cursor: pointer;" onclick="PanelClick()">
                <div id="map" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); height: 500px; width: 500px;"></div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:MultiView runat="server" ID="mvEmergencies">
        <asp:View runat="server" ID="vTable">
            <div class="col-xs-12">
                <div class="page-title-box">
                    <h4 class="page-title">Emergencies</h4>
                    <ol class="breadcrumb p-0 m-0">
                        <li>
                            <a href="Index.aspx">Smart Traffic</a>
                        </li>
                        <li>Navigation
                        </li>
                        <li class="active">Emergencies
                        </li>
                    </ol>
                    <div class="clearfix"></div>
                </div>
            </div>
            <table class="table m-0 table-colored table-primary">
                <thead>
                    <tr>
                        <th>Emergency ID</th>
                        <th>User ID</th>
                        <th>Title</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody class=".table-striped">
                    <asp:Repeater runat="server" ID="rEmergencies" EnableViewState="true">
                        <ItemTemplate>
                            <tr style="height: 2em; line-height: 2em;" class='<%# SmartTraffic.Utilities.isSeen(Convert.ToBoolean(Eval("isSeen"))) %>'>
                                <asp:TableCell runat="server" ID="tcEmergencyID" Text='<%# Eval("EmergencyID") %>' Width="20%" Style="vertical-align: middle;"></asp:TableCell>
                                <asp:TableCell runat="server" ID="tcUserID" Text='<%# Eval("UserID") %>' Width="20%" Style="vertical-align: middle;"></asp:TableCell>
                                <asp:TableCell runat="server" ID="tcTitle" Text='<%# Eval("EmergencyTitle") %>' Width="20%" Style="vertical-align: middle;"></asp:TableCell>
                                <asp:TableCell runat="server" ID="tcStatus" Text='<%# Eval("EmergencyStatus") %>' Width="20%" Style="vertical-align: middle;"></asp:TableCell>
                                <td style="width: 20%">
                                    <asp:LinkButton runat="server" CssClass="btn btn-warning" ID="btnDetails" OnClick="btnDetails_Click"><i class="mdi mdi-clipboard"></i> Details</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:View>
        <!--=================================================================-->
        <asp:View runat="server" ID="vDetails">
            <div class="col-xs-12">
                <div class="page-title-box">
                    <h4 class="page-title">Emergencies</h4>
                    <ol class="breadcrumb p-0 m-0">
                        <li>
                            <a href="Index.aspx">Smart Traffic</a>
                        </li>
                        <li>Navigation
                        </li>
                        <li>Emergencies
                        </li>
                        <li class="active">Emergency Details
                        </li>
                    </ol>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="col-sm-12">
                <div class="card-box">
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <table style="width: 100%" class="table m-0 table-colored table-primary">
                                <tr>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Emergency ID</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblEmergencyID"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%">
                                        
                                    </td>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">User ID</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblUserID"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%"></td>
                                </tr>
                                <tr>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Title</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblTitle"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%">
                                        
                                    </td>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Status</label>
                                            <asp:DropDownList runat="server" ID="ddlStatus" CssClass="form-control">
                                                <asp:ListItem>Pending</asp:ListItem>
                                                <asp:ListItem>In Progress</asp:ListItem>
                                                <asp:ListItem>Resolved</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </td>
                                    <td style="width: 15%"></td>
                                </tr>
                                <tr>
                                    <td style="width: 35%">
                                    </td>
                                    <td style="width: 15%"></td>
                                    <td style="width: 35%;">
                                        <div style="float: right">
                                            <asp:Button runat="server" CssClass="btn btn-primary" Text="Back" ID="btnBack" OnClick="btnBack_Click" />
                                            <asp:Button runat="server" CssClass="btn btn-warning" Text="View Map" ID="btnViewMap" OnClick="btnViewMap_Click"/>
                                        </div>
                                    </td>
                                    <td style="width: 15%"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                

                <%
        double longitude = SmartTraffic.LocationManager.getLongitude(Convert.ToInt32(lblEmergencyID.Text));
        double latitude = SmartTraffic.LocationManager.getLatitude(Convert.ToInt32(lblEmergencyID.Text));
    %>
                <%-- JAVASCRIPT --%>
                <script type="text/javascript">
    	function PanelClick() {
    		__doPostBack('overlays', 'Click');
        }

        ymaps.ready(init);
        var myMap, location, longitude, latitude;
        longitude = <%=longitude %>;
        latitude = <%=latitude %>;

        function init() {
            myMap = new ymaps.Map("map", {
                center: [latitude, longitude],
                zoom: 15
            });

            marker = new ymaps.Placemark(
                [latitude, longitude],
                { hintContent: 'Emergency Location', balloonContent: 'Send dispatch here' }
            );

            myMap.geoObjects.add(marker);
        }
    </script>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
