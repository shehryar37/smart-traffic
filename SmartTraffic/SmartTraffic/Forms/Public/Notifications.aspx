<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Public/public.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="SmartTraffic.Forms.Public.Notifications" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cpTitle" runat="server">
    Notifications | Smart Traffic Management
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcumb-area bg-img bg-gradient-overlay" style="background-image: url(img/bg-img/12.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <h2 class="title">Notifications</h2>
                </div>
            </div>
        </div>
    </div>
    <section class="dento-contact-area mt-50 mb-100">
        <div class="container">
            <!-- Start Feedback Form -->
            <div class="row">
                <!-- Information -->
                <div class="col-12 col-md-4">
                    <div class="contact-information">
                        <h5>Notifications</h5>
                        <p>
                            Recent notifications regarding emergencies can be found here. 
                        </p>
                        <hr />
                        <h5>Help</h5>
                        <p>
                            If you are having any trouble, feel free to contact us at <b>+84&nbsp;2252&nbsp;2250&nbsp;122</b>
                            for any further queries.
                        </p>
                    </div>
                </div>

                <div class="col-12 col-md-8">
                    <div class="contact-form">
                        <!--Heading-->
                        <div class="section-heading">
                            <h2>Notifications</h2>
                            <div class="line"></div>
                        </div>

                        <!--Main Form-->
                        <!-- for Category -->
                        <asp:Repeater runat="server" ID="rNotifications">
                            <ItemTemplate>
                                <div class="row">
                                    <div class="single-blog-item d-flex flex-wrap" style="width: 100%;">
                                        <div class="blog-content">
                                            <a href="#" class="post-title">
                                                <i class="mdi mdi-<%# SmartTraffic.NotificationManager.notificationType(Eval("NotificationType").ToString()) %>"></i>
                                            </a>
                                            <p class="name"><%# Eval("NotificationMessage") %></p>
                                            <div class="post-meta">
                                                <a href="#">
                                                    <i class="icon_clock_alt"></i>
                                                    <span class="time"><%# SmartTraffic.NotificationManager.notificationTimeElapsed((DateTime)Eval("NotificationDateTime"))%></span>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br />
                            </ItemTemplate>
                        </asp:Repeater>
                        
                        <!-- Form -->
                    </div>
                </div>
            </div>
            <!-- End Feedback form -->
        </div>
    </section>
</asp:Content>
