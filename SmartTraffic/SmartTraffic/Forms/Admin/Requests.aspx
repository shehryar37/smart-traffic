<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="Requests.aspx.cs" Inherits="SmartTraffic.Forms.Admin.Requests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder" runat="server">
    <script type="text/javascript">
    	function PanelClick() {
    		__doPostBack('overlays', 'Click');
    	}
    </script>
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
            <asp:Panel runat="server" id="overlays" style="position: fixed; display: none; width: 100%; top: 0; left: 0; bottom: 0; top: 0; background-color: rgba(0,0,0,0.5); z-index: 2; cursor: pointer;" onclick="PanelClick()">
        <asp:Image runat="server" ID="image" Height="50%" Style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%)" />
    </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <div class="col-xs-12">
        <div class="page-title-box">
            <h4 class="page-title">User Requests</h4>
            <ol class="breadcrumb p-0 m-0">
                <li>
                    <a href="Index.aspx">Smart Traffic</a>
                </li>
                <li>Navigation
                </li>
                <li class="active">User Requests
                </li>
            </ol>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="row">
        <%--<asp:UpdatePanel ID="upRequests" runat="server" UpdateMode="Conditional">
            <ContentTemplate>--%>
        <div class="form-horizontal">
            <asp:Repeater runat="server" ID="rRequests" EnableViewState="true" OnItemDataBound="rRequests_ItemDataBound">
                <ItemTemplate>
                    <div class="col-md-4 col-lg-4 col-sm-12">
                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading">
                                <asp:Label runat="server" CssClass="h3 panel-title" Text='<%# Eval("UserFName").ToString() + " " + Eval("UserLName").ToString()%>'></asp:Label>
                                <br />
                                <asp:Label runat="server" ID="lblUserID" CssClass="panel-sub-title font-13 text-muted" Text='<%# Eval("UserID")%>'></asp:Label>
                            </div>
                            <div class="panel-body" style="text-align: justify; min-height: 220px;">
                                <table style="width: 100%">
                                    <tr style="height: 60px;">
                                        <td style="width: 20%"><i class="mdi mdi-home" style="font-size: 50px; position: relative; float: left; top: 50%; left: 50%; transform: translate(-80%, 0)"></i></td>
                                        <td><%# Eval("UserAddress") %></td>
                                    </tr>

                                    <tr style="height: 60px;">
                                        <td style="width: 20%"><i class="mdi mdi-phone" style="font-size: 50px; position: relative; float: left; top: 50%; left: 50%; transform: translate(-80%, 0)"></i></td>
                                        <td><%# Eval("UserEmail") + "</br>" + Eval("UserContact") %></td>
                                    </tr>

                                    <tr style="height: 60px;">
                                        <td style="width: 20%"><i class="mdi mdi-account" style="font-size: 50px; position: relative; float: left; top: 50%; left: 50%; transform: translate(-80%, 0)"></i></td>
                                        <td>

                                            <asp:DropDownList runat="server" ID="ddlUserType" CssClass="form-control">
                                            </asp:DropDownList>

                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="panel-footer" style="padding: 0; margin: 0">
                                <asp:Button runat="server" CssClass="btn-primary btn-block" Style="width: 100%; font-size: 20px; height: 50px" Text="View Proof" ID="btnProof" OnClick="btnProof_Click" CausesValidation="false" />
                                <div class="btn-group btn-group-justified m-b-12">
                                    <asp:LinkButton runat="server" CssClass="btn btn-danger waves-effect waves-light" ID="btnReject" OnClick="btnReject_Click" Style="width: 50%" CausesValidation="false"><i class="mdi mdi-close" style="font-size: 20px"></i></asp:LinkButton>
                                    <asp:LinkButton runat="server" CssClass="btn btn-success waves-effect waves-light" ID="btnAccept" OnClick="btnAccept_Click" Style="width: 50%" CausesValidation="false"><i class="mdi mdi-check" style="font-size: 20px"></i></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <%--            </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</asp:Content>
