<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Public/public.Master" AutoEventWireup="true" CodeBehind="Complaints.aspx.cs" Inherits="SmartTraffic.Complaints" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpTitle" runat="server">
    Complaints | Smart Traffic Management
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcumb-area bg-img bg-gradient-overlay" style="background-image: url(img/bg-img/12.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12" style="text-align: center;">
                    <h2 class="title">Complaints</h2>
                </div>
            </div>
        </div>
    </div>
    <section class="dento-contact-area mt-50 mb-100">
        <div class="container">
            <asp:MultiView ID="mvComplaint" runat="server">
                <asp:View ID="viewComplaints" runat="server">
                    <!-- Start Complaint Form -->
                    <div class="row">
                        <!-- Information -->
                        <div class="col-12 col-md-4">
                            <div class="contact-information">
                                <h5>Let your voice be heard</h5>
                                <p>
                                    If you have any comments or concerns regarding our services, please fill in the form and we
                            will do our utmost best to resolve them. 
                                </p>
                                <h5>Log-In required</h5>
                                <p>
                                    No Account? Please&nbsp;
                            <asp:LinkButton runat="server" Text="Click here" PostBackUrl="~/Forms/Public/LoginRegister.aspx" ID="lbClickRegister"></asp:LinkButton>
                                    to go to the Login / Registration page.
                                </p>

                                <hr />
                                <h5>Complaint Tracker</h5>
                                <p>
                                    <asp:LinkButton Text="Click here" ID="lbOpComplaintTrack" runat="server" OnClick="lbOpComplaintTrack_Click"></asp:LinkButton>
                                    to open the complaint tracker.
                                </p>
                            </div>
                        </div>

                        <div class="col-12 col-md-8">
                            <div class="contact-form">
                                <!--Heading-->
                                <div class="section-heading">
                                    <h2>Complaints</h2>
                                    <div class="line"></div>
                                </div>

                                <!--Main Form-->
                                <!-- for Category -->

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

                                <div class="row">

                                    <div class="col-lg-6">
                                        <asp:Label ID="lblTitle" runat="server" Text="Title" Font-Bold="true"></asp:Label>
                                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control mb-30" placeholder="Title"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-6">
                                        <asp:Label ID="lblcategory" runat="server" Text="Category" Font-Bold="true"></asp:Label>
                                        <asp:DropDownList ID="ddlcategory" runat="server" CssClass="form-control mb-30"></asp:DropDownList>
                                    </div>
                                    <div class="col-12">
                                        <asp:Label ID="lbldescription" runat="server" Text="Description" Font-Bold="true"></asp:Label>
                                        <asp:TextBox ID="txtdescription" runat="server" CssClass="form-control mb-30" TextMode="MultiLine" placeholder="Description"></asp:TextBox>
                                    </div>
                                    <!-- reCAPTCHA -->
                                    <div class="col-lg-12">
                                        <hr />
                                        <div class="g-recaptcha" data-sitekey="6Lf-WJoUAAAAAALd3uqhPkzdr7meNALEOB1Ukjwn"></div>
                                        <hr />
                                    </div>
                                    <div class="col-12">
                                        <asp:Button ID="btnsubmit" runat="server" Text="Send" CssClass="btn dento-btn" OnClick="btnsubmit_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Complaint form -->
                </asp:View>
                <asp:View ID="viewTracker" runat="server">
                    <!-- Start Complaint Form -->
                    <div class="row">
                        <!-- Information -->
                        <div class="col-12 col-md-4">
                            <div class="contact-information">
                                <h5>Tracker</h5>
                                <p>
                                    Track the status of any previous complaints you had with our services.
                                </p>
                                <h5>Log-In required</h5>
                                <p>
                                    No Account? Please&nbsp;
                            <asp:LinkButton runat="server" Text="Click here" PostBackUrl="~/Forms/Public/LoginRegister.aspx" ID="LinkButton1"></asp:LinkButton>
                                    to go to the Login / Registration page.
                                </p>
                            </div>
                        </div>

                        <div class="col-12 col-md-8">
                            <div class="contact-form">
                                <!--Heading-->
                                <div class="section-heading">
                                    <h2>Complaints Tracker</h2>
                                    <div class="line"></div>
                                </div>

                                <!--Main Form-->
                                <!-- for Category -->

                                <div class="mb-30">
                                    <!-- Success Placeholder -->
                                    <asp:PlaceHolder ID="successPlaceholder_Tracker" runat="server" Visible="False">
                                        <div class="alert bg-success alert-dismissible col-12" role="alert" style="color: white;">
                                            <button class="close" aria-label="Close" type="button" data-dismiss="alert"><span aria-hidden="true">×</span></button>
                                            <asp:Label runat="server" ID="lblSuccess_Tracker"></asp:Label>
                                        </div>
                                    </asp:PlaceHolder>
                                    <!-- #END#Success Placeholder -->
                                    <!-- Error Placeholder -->
                                    <asp:PlaceHolder ID="errorPlaceholder_Tracker" runat="server" Visible="False">
                                        <div class="alert bg-danger alert-dismissible col-12" role="alert" style="color: white;">
                                            <button class="close" aria-label="Close" type="button" data-dismiss="alert"><span aria-hidden="true">×</span></button>
                                            <asp:Label runat="server" ID="lblError_Tracker"></asp:Label>
                                        </div>
                                    </asp:PlaceHolder>
                                    <!-- #END#Error Placeholder -->
                                </div>

                                <div class="row">
                                    <div class="col-lg-12">
                                        <asp:Label ID="Label3" runat="server" Text="Complaint ID" Font-Bold="true"></asp:Label>
                                        <asp:RegularExpressionValidator runat="server" 
                                            ErrorMessage="Numbers only"
                                            ForeColor="Red"
                                            Display="Dynamic"
                                            style="float: right;"
                                            ValidationExpression="^([0-9]\d*)$"
                                            ControlToValidate="txtCheckComplaintID"></asp:RegularExpressionValidator>
                                        <asp:TextBox ID="txtCheckComplaintID" runat="server" CssClass="form-control mb-30" 
                                            placeholder="ID"></asp:TextBox>
                                    </div>

                                    <div class="col-12">
                                        <asp:Button ID="btnCheck" runat="server" Text="Check" CssClass="btn dento-btn" OnClick="btnCheck_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Complaint form -->
                </asp:View>

                <asp:View ID="viewComplaintDetails" runat="server">
                    <div class="row">
                        <div class="col-lg-3">
                            <asp:Label runat="server" Text="Title" Font-Bold="true"></asp:Label>
                            <asp:TextBox BackColor="White" ID="txtDetTitle" runat="server" CssClass="form-control mb-30" disabled="true"></asp:TextBox>
                        </div>
                        <div class="col-lg-3">
                            <asp:Label runat="server" Text="Category" Font-Bold="true"></asp:Label>    
                            <asp:TextBox BackColor="White" ID="txtDetCategory" runat="server" CssClass="form-control mb-30" disabled="true"></asp:TextBox>
                        </div>
                        <div class="col-lg-3">
                            <asp:Label runat="server" Text="Date" Font-Bold="true"></asp:Label>    
                            <asp:TextBox BackColor="White" ID="txtDetDate" runat="server" CssClass="form-control mb-30" disabled="true"></asp:TextBox>
                        </div>
                        <div class="col-lg-3">
                            <asp:Label runat="server" Text="Status" Font-Bold="true"></asp:Label>    
                            <asp:TextBox BackColor="White" ID="txtDetStatus" runat="server" CssClass="form-control mb-30" disabled="true"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <asp:Label runat="server" Text="Description" Font-Bold="true"></asp:Label>
                            <asp:TextBox BackColor="White" ID="txtDetDescription" runat="server" CssClass="form-control mb-30" disabled="true" TextMode="MultiLine" placeholder="Description"></asp:TextBox>
                        </div>
                        <div class="col-12">
                            <asp:Button ID="btnGoBack" runat="server" Text="Go Back" CssClass="btn dento-btn" OnClick="btnGoBack_Click" />
                        </div>
                    </div>
                </asp:View>
            </asp:MultiView>
        </div>
    </section>
</asp:Content>
