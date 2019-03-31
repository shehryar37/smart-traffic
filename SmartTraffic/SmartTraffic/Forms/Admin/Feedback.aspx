<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="SmartTraffic.Forms.Admin.Feedback" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpTitle" runat="server">
    Feedback | Smart Traffic System
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder" runat="server">
    <asp:MultiView runat="server" ID="mvFeedback">
        <asp:View runat="server" ID="vTable">
            <div class="col-xs-12">
                <div class="page-title-box">
                    <h4 class="page-title">Feedback</h4>
                    <ol class="breadcrumb p-0 m-0">
                        <li>
                            <a href="Index.aspx">Smart Traffic</a>
                        </li>
                        <li>Navigation
                        </li>
                        <li class="active">Feedback
                        </li>
                    </ol>
                    <div class="clearfix"></div>
                </div>
            </div>
            <table class="table m-0 table-colored table-primary">
                <thead>
                    <tr>
                        <th>Feedback ID</th>
                        <th>User ID</th>
                        <th>Date</th>
                        <th>Description</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody class=".table-striped">
                    <asp:Repeater runat="server" ID="rFeedback" EnableViewState="true" OnItemDataBound="rSessionHistories_ItemDataBound">
                        <ItemTemplate>
                            <tr style="height: 2em; line-height: 2em;" class='<%# SmartTraffic.Utilities.isSeen(Convert.ToBoolean(Eval("isSeen"))) %>'>
                                <asp:TableCell runat="server" ID="tcFeedbackID" Text='<%# Eval("FeedbackID") %>' Width="15%" Style="vertical-align: middle;"></asp:TableCell>
                                <asp:TableCell runat="server" ID="tcUserID" Text='<%# Eval("UserID") %>' Width="20%" Style="vertical-align: middle;"></asp:TableCell>
                                <asp:TableCell runat="server" ID="tcDate" Text='<%# Eval("FeedbackDate") %>' Width="15%" Style="vertical-align: middle;"></asp:TableCell>
                                <asp:TableCell runat="server" ID="tcDescription" Text='<%# SmartTraffic.Utilities.shortenDescription(Eval("FeedbackDescription").ToString()) %>' Width="30%" Style="vertical-align: middle;"></asp:TableCell>
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
                    <h4 class="page-title">Feedback</h4>
                    <ol class="breadcrumb p-0 m-0">
                        <li>
                            <a href="Index.aspx">Smart Traffic</a>
                        </li>
                        <li>Navigation
                        </li>
                        <li>Feedback
                        </li>
                        <li class="active">Feedback Details
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
                                            <label class="col-md-4 control-label">Feedback ID</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblFeedbackID"></asp:Label>
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
                                            <label class="col-md-4 control-label">Date</label>
                                            <asp:Label runat="server" CssClass="col-md-8 control-label" ID="lblFeedbackDate"></asp:Label>
                                        </div>
                                    </td>
                                    <td style="width: 15%">
                                        
                                    </td>
                                    <td style="width: 35%">
                                        <div class="form-group">
                                            <label class="col-md-4 control-label">Description</label>
                                            <asp:TextBox runat="server" CssClass="col-md-8 control-label" ID="txtFeedbackDescription" disabled="true" TextMode="MultiLine" Height="10em" Style="text-align: justify; background-color: white; border: none"></asp:TextBox>
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
