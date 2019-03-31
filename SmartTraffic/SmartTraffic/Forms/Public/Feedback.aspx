<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Public/public.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="SmartTraffic.Feedback" %>

<asp:Content ID="contentTitle" ContentPlaceHolderID="cpTitle" runat="server">
    Feedback | Smart Traffic Management
</asp:Content>

<asp:Content ID="contentMain" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:MultiView runat="server" ActiveViewIndex="0">
        <asp:View runat="server" ID="viewMain">
            <div class="breadcumb-area bg-img bg-gradient-overlay" style="background-image: url(img/bg-img/12.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <h2 class="title">Feedback</h2>
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
                        <h5>Feedback</h5>
                        <p>
                            If you have any tips that may help us improve our services in the future, please 
                            share them with us. We'll gladly take note!
                        </p>
                        <h5>Log-In required</h5>
                        <p>
                            A registered account is required to use this feature. Please&nbsp;
                            <asp:LinkButton runat="server" Text="Click here" PostBackUrl="~/Forms/Public/LoginRegister.aspx" ID="lbClickRegister"></asp:LinkButton>
                            to go to the Login / Registration page.
                        </p>
                    </div>
                </div>

                <div class="col-12 col-md-8">
                    <div class="contact-form">
                        <!--Heading-->
                        <div class="section-heading">
                            <h2>Feedback</h2>
                            <div class="line"></div>
                        </div>

                        <div class="mb-30">
                            <!-- Success Placeholder -->
                            <asp:PlaceHolder ID="SuccessPlaceholder" runat="server" Visible="False">
                                <div class="alert bg-success alert-dismissible col-12" role="alert" style="color: white;">
                                    <button class="close" aria-label="Close" type="button" data-dismiss="alert"><span aria-hidden="true">×</span></button>
                                    <asp:Label runat="server" ID="lblSuccess"></asp:Label>
                                </div>
                            </asp:PlaceHolder>
                            <!-- #END#Success Placeholder -->
                            <!-- Error Placeholder -->
                            <asp:PlaceHolder ID="ErrorPlaceholder" runat="server" Visible="False">
                                <div class="alert bg-danger alert-dismissible col-12" role="alert" style="color: white;">
                                    <button class="close" aria-label="Close" type="button" data-dismiss="alert"><span aria-hidden="true">×</span></button>
                                    <asp:Label runat="server" ID="lblError"></asp:Label>
                                </div>
                            </asp:PlaceHolder>
                            <!-- #END#Error Placeholder -->
                        </div>

                        <!--Main Form-->
                        <!-- for Category -->
                        <div class="row">
                            <div class="col-12">
                                <asp:Label ID="lblFeeddescription" runat="server" Text="Description" Font-Bold="true"></asp:Label>
                                <asp:TextBox ID="txtFeeddescription" runat="server" CssClass="form-control mb-30" TextMode="MultiLine" placeholder="Feedback Description"></asp:TextBox>
                            </div>
                            <!-- reCAPTCHA -->
                            <div class="col-lg-12">
                                <hr />
                                <div class="g-recaptcha" data-sitekey="6Lf-WJoUAAAAAALd3uqhPkzdr7meNALEOB1Ukjwn"></div>
                                <hr />
                            </div>
                            <div class="col-12">
                                <asp:Button ID="btnSubmit" runat="server" Text="Send" CssClass="btn dento-btn" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                        <!-- Form -->
                    </div>
                </div>
            </div>
            <!-- End Feedback form -->
        </div>
    </section>
        </asp:View>
    </asp:MultiView>
</asp:Content>
