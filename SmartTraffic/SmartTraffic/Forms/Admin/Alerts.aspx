<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Admin/admin.Master" AutoEventWireup="true" CodeBehind="Alerts.aspx.cs" Inherits="SmartTraffic.Forms.Admin.Alerts" %>
<asp:Content ID="Content2" ContentPlaceHolderID="cpTitle" runat="server">
    Alerts | Smart Traffic System
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceholder" runat="server">
            <div class="col-xs-12">
                <div class="page-title-box">
                    <h4 class="page-title">Feedback</h4>
                    <ol class="breadcrumb p-0 m-0">
                        <li>
                            <a href="Index.aspx">Smart Traffic</a>
                        </li>
                        <li>Navigation
                        </li>
                        <li class="active">Send Alert
                        </li>
                    </ol>
                    <div class="clearfix"></div>
                </div>
            </div>
    <div class="col-sm-12">
        <div class="card-box">
            <div class="form-horizontal" role="form">
                <div class="form-group">
                    <div class="col-md-3">
                        <asp:Label CssClass="form-control" runat="server" Text="Description" style="border: none">                            
                        </asp:Label>
                    </div>
                    <div class="col-md-9">
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtDescription" placeholder="Description" TextMode="MultiLine" Height="10em"></asp:TextBox>
                    </div>
                </div>
                
                <div style="float: right">
                    <asp:Button runat="server" CssClass="btn btn-danger" Text="Send Alert" ID="btnSendAlert" OnClick="btnSendAlert_Click" />
                </div>
            </div>
            <div style="height: 2em"></div>
        </div>
    </div>
</asp:Content>
