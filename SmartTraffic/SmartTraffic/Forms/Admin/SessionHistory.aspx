<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="SessionHistory.aspx.cs" Inherits="SmartTraffic.Forms.Admin.SessionHistory" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpTitle" runat="server">
    Session History | Smart Traffic System
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder" runat="server">
    <asp:MultiView runat="server" ID="mvSessionHistory">
        <asp:View runat="server" ID="vTable">
            <div class="col-xs-12">
                <div class="page-title-box">
                    <h4 class="page-title">Session History</h4>
                    <ol class="breadcrumb p-0 m-0">
                        <li>
                            <a href="Index.aspx">Smart Traffic</a>
                        </li>
                        <li>Navigation
                        </li>
                        <li class="active">Session History
                        </li>
                    </ol>
                    <div class="clearfix"></div>
                </div>
            </div>
            <%--<div class="row">
                <div class="col-md-12">
                    <!-- TODO -->
                    <asp:Button runat="server" CssClass="btn btn-primary" Text="Manage Categories" style="float: right; left: 0" ID="btnCategories" OnClick="btnCategories_Click" />
                </div>
            </div>--%>
            <table class="table m-0 table-colored table-primary">
                <thead>
                    <tr>
                        <th>Session ID</th>
                        <th>User ID</th>
                        <th>Begin</th>
                        <th>End</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody class=".table-striped">
                    <asp:Repeater runat="server" ID="rSessionHistories" EnableViewState="true" OnItemDataBound="rComplaints_ItemDataBound">
                        <ItemTemplate>
                            <tr style="height: 2em; line-height: 2em;">
                                <asp:TableCell runat="server" ID="tcSessionID" Text='<%# Eval("SessionID") %>' Width="20%" Style="vertical-align: middle;"></asp:TableCell>
                                <asp:TableCell runat="server" ID="tcUserID" Text='<%# Eval("UserID") %>' Width="20%" Style="vertical-align: middle;"></asp:TableCell>
                                <asp:TableCell runat="server" ID="tcSessionBegin" Text='<%# Eval("SessionBegin") %>' Width="20%" Style="vertical-align: middle;"></asp:TableCell>
                                <asp:TableCell runat="server" ID="tcSessionEnd" Text='<%# Eval("SessionEnd") %>' Width="20%" Style="vertical-align: middle;"></asp:TableCell>
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
                    <h4 class="page-title">Session History</h4>
                    <ol class="breadcrumb p-0 m-0">
                        <li>
                            <a href="Index.aspx">Smart Traffic</a>
                        </li>
                        <li>Navigation
                        </li>
                        <li>Complaints
                        </li>
                        <li class="active">Session History Details
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
                                            <label class="col-md-4 control-label">Session ID</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblSessionID"></asp:Label>
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
                                            <label class="col-md-4 control-label">Start</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblSessionStart"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%">
                                        
                                    </td>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">End</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblSessionEnd"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%"></td>
                                </tr>
                                <tr>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Latitude</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblSessionLatitude"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%">
                                        
                                    </td>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Longitude</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblSessionLongitude"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%"></td>
                                </tr>
                                <tr>
                                    <td style="width: 35%"></td>
                                    <td style="width: 15%"></td>
                                    <td style="width: 35%">
                                        <asp:Button runat="server" CssClass="btn btn-primary" Style="float: right" Text="Back" ID="btnBack" OnClick="btnBack_Click" />
                                    </td>
                                    <td style="width: 15%"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
