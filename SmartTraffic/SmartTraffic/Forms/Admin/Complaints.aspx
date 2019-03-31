<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="Complaints.aspx.cs" Inherits="SmartTraffic.Forms.Admin.Complaints" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder" runat="server">
    <asp:MultiView runat="server" ID="mvComplaints">
        <asp:View runat="server" ID="vTable">
            <div class="col-xs-12">
                <div class="page-title-box">
                    <h4 class="page-title">User Requests</h4>
                    <ol class="breadcrumb p-0 m-0">
                        <li>
                            <a href="Index.aspx">Smart Traffic</a>
                        </li>
                        <li>Navigation
                        </li>
                        <li class="active">Complaints
                        </li>
                    </ol>
                    <div class="clearfix"></div>
                </div>
            </div>
            <table class="table m-0 table-colored table-primary">
                <thead>
                    <tr>
                        <th>Complaint ID</th>
                        <th>Title</th>
                        <th>Category</th>
                        <th>Status</th>
                        <th>Actions</th>

                    </tr>
                </thead>
                <tbody class=".table-striped">
                    <asp:Repeater runat="server" ID="rComplaints" EnableViewState="true" OnItemDataBound="rComplaints_ItemDataBound">
                        <ItemTemplate>
                            <tr style="height: 2em; line-height: 2em;" class='<%# SmartTraffic.Utilities.isSeen(Convert.ToBoolean(Eval("isSeen"))) %>'>

                                <asp:TableCell runat="server" ID="tcComplaintID" Text='<%# Eval("ComplaintID") %>' Width="20%" Style="vertical-align: middle;"></asp:TableCell>
                                <asp:TableCell runat="server" ID="tcComplaintTitle" Text='<%# Eval("ComplaintTitle") %>' Width="20%" Style="vertical-align: middle;"></asp:TableCell>
                                <asp:TableCell runat="server" ID="tcCategory" Width="20%" Style="vertical-align: middle;"></asp:TableCell>
                                <asp:TableCell runat="server" ID="tcComplaintStatus" Text='<%# Eval("ComplaintStatus") %>' Width="20%" Style="vertical-align: middle;"></asp:TableCell>
                                <td style="width: 20%">
                                    <asp:LinkButton runat="server" CssClass="btn btn-warning" ID="btnDetails" OnClick="btnDetails_Click"><i class="mdi mdi-clipboard"></i> Details</asp:LinkButton>
                                </td>
                            </tr>
                            <hr />
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </asp:View>
        <asp:View runat="server" ID="vDetails">
            <div class="col-xs-12">
                <div class="page-title-box">
                    <h4 class="page-title">User Requests</h4>
                    <ol class="breadcrumb p-0 m-0">
                        <li>
                            <a href="Index.aspx">Smart Traffic</a>
                        </li>
                        <li>Navigation
                        </li>
                        <li>Complaints
                        </li>
                        <li class="active">Complaint Details
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
                                            <label class="col-md-4 control-label">Complaint ID</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblComplaintID"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%"></td>
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
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblComplaintTitle"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%"></td>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Name</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblUserName"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%"></td>
                                </tr>
                                <tr>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Description</label>
                                            <asp:TextBox runat="server" CssClass="col-md-8 control-label" ID="txtComplaintDescription" disabled="true" TextMode="MultiLine" Height="10em" Style="text-align: justify; background-color: white; border: none"></asp:TextBox>
                                        </div>
                                    </td>
                                    <td style="width: 15%"></td>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Address</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblUserAddress"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%"></td>
                                </tr>
                                <tr>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Category</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblComplaintCategory"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%"></td>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Contact</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblUserContact"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%"></td>
                                </tr>
                                <tr>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Status</label>
                                            <div class="col-md-8">
                                                <asp:DropDownList runat="server" ID="ddlStatus" CssClass="form-control">
                                                    <asp:ListItem>Unresolved</asp:ListItem>
                                                    <asp:ListItem>In Progress</asp:ListItem>
                                                    <asp:ListItem>Resolved</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>

                                        </div>
                                    </td>
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
