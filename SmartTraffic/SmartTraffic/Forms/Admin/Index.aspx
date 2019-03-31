<%@ Page Title="" Language="C#" MasterPageFile="admin.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="SmartTraffic.Forms.Admin.Index" %>

<asp:Content ID="Content3" ContentPlaceHolderID="cpTitle" runat="server">
    Dashboard | Smart Traffic Management
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceholder" runat="server">
    <div class="col-xs-12">
        <div class="page-title-box">
            <h4 class="page-title">Emergencies</h4>
            <ol class="breadcrumb p-0 m-0">
                <li>SmartTraffic
                </li>
                <li class="active">Dashboard
                </li>
            </ol>
            <div class="clearfix"></div>
        </div>
    </div>
    <div class="row">
        <!-- Visitors today -->
        <div class="col-lg-3">
            <div class="card-box widget-box-one" style="background-color: blue; color: white">
                <i class="mdi mdi-chart-areaspline widget-one-icon"></i>
                <div class="wigdet-one-content">
                    <p title="Website Hits Today" class="m-0 text-uppercase font-600 font-secondary text-overflow">
                        Website Hits Today
                    </p>
                    <h2>
                        <asp:Label runat="server" ID="lblWebsiteHitsToday" ForeColor="White"></asp:Label>
                    </h2>
                    <p class="text-muted m-0">
                        <b style="color: white">Last:</b>
                        <asp:Label runat="server" ID="lblWebsiteHitsLast" ForeColor="White"></asp:Label><span style="color: white"> hits</span>
                    </p>
                </div>
            </div>
        </div>

        <!-- Feedbacks Today -->
        <div class="col-lg-3">
            <div class="card-box widget-box-one" style="background-color: orangered; color: white">
                <i class="mdi mdi-thumb-up-outline widget-one-icon"></i>
                <div class="wigdet-one-content">
                    <p title="Feedbacks Today" class="m-0 text-uppercase font-600 font-secondary text-overflow">
                        Feedbacks Today
                    </p>
                    <h2>
                        <asp:Label runat="server" ID="lblFeedbacksToday" style="color: white"></asp:Label>
                    </h2>
                    <p class="text-muted m-0" style="color: white">
                        <b style="color: white">Last:</b>
                        <asp:Label runat="server" ID="lblFeedbacksLast" style="color: white"></asp:Label>
                        <span style="color: white"> feedbacks</span>
                    </p>
                </div>
            </div>
        </div>

        <!-- Complaints Today -->
        <div class="col-lg-3">
            <div class="card-box widget-box-one" style="background-color: green; color: white">
                <i class="mdi mdi-clipboard-outline widget-one-icon"></i>
                <div class="wigdet-one-content">
                    <p title="Complaints Today" class="m-0 text-uppercase font-600 font-secondary text-overflow">
                        Complaints Today
                    </p>
                    <h2>
                        <asp:Label runat="server" ID="lblComplaintsToday" style="color: white"></asp:Label>
                    </h2>
                    <p class="text-muted m-0">
                        <b style="color: white">Last:</b>
                        <asp:Label runat="server" ID="lblComplaintsLast" style="color: white"></asp:Label>
                        <span style="color: white">complaints</span>
                    </p>
                </div>
            </div>
        </div>

        <!-- Emergencies Today -->
        <div class="col-lg-3">
            <div class="card-box widget-box-one" style="background-color: darkred; color: white">
                <i class="mdi mdi-chart-areaspline widget-one-icon"></i>
                <div class="wigdet-one-content">
                    <p title="Emergencies Today" class="m-0 text-uppercase font-600 font-secondary text-overflow">
                        Emergencies Today
                    </p>
                    <h2>
                        <asp:Label runat="server" ID="lblEmergenciesToday" style="color: white"></asp:Label>
                    </h2>
                    <p class="text-muted m-0">
                        <b style="color: white">Last:</b>
                        <asp:Label runat="server" ID="lblEmergenciesLast" style="color: white"></asp:Label>
                        <span style="color: white">emergencies</span>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <!-- Recent Feedback -->
        <div class="col-lg-6">
            <div class="card-box">
                <h4 class="header-title m-t-0 m-b-30">Recent Users</h4>
                <div class="table-responsive">
                    <table class="table table table-hover m-0">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Name</th>
                                <th>Contact</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody class=".table-striped">
                            <asp:Repeater runat="server" ID="rUsers" EnableViewState="true">
                                <ItemTemplate>
                                    <tr style="height: 2em; line-height: 2em;">
                                        <asp:TableCell runat="server" ID="tcIcon"><span class="avatar-sm-box bg-<%= SmartTraffic.Utilities.getRandomClass() %>"><%# Eval("UserFName").ToString().First() %></span></asp:TableCell>
                                        <asp:TableCell runat="server" ID="tcUserName" Text='<%# Eval("UserFName") + " " + Eval("UserLName") %>' Width="30%" Style="vertical-align: middle;"></asp:TableCell>
                                        <asp:TableCell runat="server" ID="tcContact" Text='<%# Eval("UserContact") %>' Width="30%" Style="vertical-align: middle;"></asp:TableCell>
                                        <asp:TableCell runat="server" ID="tcDate" Text='<%# Eval("UserRegDateTime") %>' Width="35%" Style="vertical-align: middle;"></asp:TableCell>

                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Complaints -->
        <div class="col-lg-6">
            <div class="card-box">
                <h4 class="header-title m-t-0 m-b-30">Recent Complaints</h4>
                <div class="table-responsive">
                    <table class="table table table-hover m-0">
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Category</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody class=".table-striped">
                            <asp:Repeater runat="server" ID="rComplaints" EnableViewState="true">
                                <ItemTemplate>
                                    <tr style="height: 3.5em; line-height: 3.5em;">
                                        <asp:TableCell runat="server" ID="tcTitle" Text='<%# Eval("ComplaintTitle") %>' Width="40%" Style="vertical-align: middle;"></asp:TableCell>
                                        <asp:TableCell runat="server" ID="tcCategory" Text='<%# Eval("CategoryName") %>' Width="30%" Style="vertical-align: middle;"></asp:TableCell>
                                        <asp:TableCell runat="server" ID="tcStatus" Text='<%# Eval("ComplaintStatus") %>' Width="30%" Style="vertical-align: middle;"></asp:TableCell>

                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <!-- Emergencies -->
        <!-- ? -->
    </div>
</asp:Content>
