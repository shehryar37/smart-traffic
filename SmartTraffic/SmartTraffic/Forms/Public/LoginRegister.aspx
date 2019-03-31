<%@ Page Title="" Language="C#" MasterPageFile="~/Forms/Public/public.Master" AutoEventWireup="true" CodeBehind="LoginRegister.aspx.cs" Inherits="SmartTraffic.LoginRegister" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpTitle" runat="server">
    Login / Register | Smart Traffic Management
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Script manager for Ajax -->
    <%--<asp:ScriptManager runat="server" ID="smMainScript"></asp:ScriptManager>

    <asp:UpdatePanel runat="server" ID="upMain">
        <ContentTemplate>--%>
    <asp:MultiView runat="server" ID="mvMain">
        <!-- Login View -->
        <asp:View runat="server" ID="viewLogin">
            <!-- Login Banner -->
            <div class="breadcumb-area bg-img bg-gradient-overlay" style="background-image: url(img/bg-img/12.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <h2 class="title">Login</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Login Banner -->

            <!-- Login Info and Main input area -->
            <section class="dento-contact-area mt-50 mb-100">
                <div class="container">
                    <div class="row">
                        <!-- Information -->
                        <div class="col-12 col-md-4">
                            <div class="contact-information">
                                <h5>No Account?</h5>
                                <p>
                                    <asp:LinkButton runat="server" Text="Click here" ID="lbClickRegister" 
                                        OnClick="lbClickRegister_Click"></asp:LinkButton>
                                    to go to the registration page.
                                </p>

                                <hr />
                                <h5>Help</h5>
                                <p>
                                    If you are having any trouble, feel free to contact us at <b>+84&nbsp;2252&nbsp;2250&nbsp;122</b>
                                    for any further queries.
                                </p>
                            </div>
                        </div>

                        <!-- Login Form -->
                        <div class="col-12 col-md-8">
                            <div class="contact-form">
                                <div class="section-heading">
                                    <h2>Login</h2>
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

                                <!-- Student Register Page -->
                                <div class="row">
                                    <!-- Email -->
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="txtLoginEmail" CssClass="form-control mb-30" 
                                            TextMode="Email" placeholder="Email"></asp:TextBox>
                                    </div>

                                    <!-- Password -->
                                    <div class="col-lg-12">
                                        <asp:TextBox runat="server" ID="txtLoginPassword" CssClass="form-control mb-30" 
                                            TextMode="Password" placeholder="Password"></asp:TextBox>
                                    </div>

                                    <!-- Login button -->
                                    <div class="col-lg-2 col-md-4 col-sm-6 col-xs-12">
                                        <asp:Button runat="server" ID="btnLogin" Text="Login" OnClick="btnLogin_Click" 
                                            CssClass="btn dento-btn" />
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- #END# Login Info and Main input area -->
        </asp:View>
        <!-- #END# Login View -->

        <!-- Register View -->
        <asp:View runat="server" ID="viewRegister">
            <!-- Register Banner -->
            <div class="breadcumb-area bg-img bg-gradient-overlay" style="background-image: url(img/bg-img/12.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12">
                            <h2 class="title">Register</h2>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Register Banner -->

            <!-- Register info and main input area -->
            <section class="dento-contact-area mt-50 mb-100">
                <div class="container">
                    <div class="row">
                        <!-- Information -->
                        <div class="col-12 col-md-4">
                            <div class="contact-information">
                                <h5>Register</h5>
                                <p>Select a user type to register yourself as.</p>

                                <h5>Waiting Period</h5>
                                <p>
                                    After submission, there will be a short waiting period as our staff processes your application.
                                </p>

                                <h5>Password</h5>
                                <p>
                                    Choose a strong password to ensure your account is safe. We require that you use at least one Uppercase character, one lowercase character, one special character, and one number as part of your strong password.
                                </p>

                                <h5>Proof?</h5>
                                <p>
                                    Any document that proves your identity is a proof. As a vehicle owner,
                                            your license card is your proof. Similarly, an NIC is your proof as a pedestrian.
                                </p>

                                <h5>Already registered?</h5>
                                <p>
                                    <asp:LinkButton runat="server" ID="lbClickLogin" Text="Click here" 
                                        OnClick="lbClickLogin_Click"></asp:LinkButton>
                                    to go to the Login page.
                                </p>

                            </div>
                        </div>

                        <!-- Registration Form -->
                        <div class="col-12 col-md-8">
                            <div class="contact-form">
                                <!-- Heading -->
                                <div class="section-heading">
                                    <h2>Register</h2>
                                    <div class="line"></div>
                                </div>

                                <div class="mb-30">
                                    <!-- Success Placeholder -->
                                    <asp:PlaceHolder ID="regSuccessPlaceholder" runat="server" Visible="False">
                                        <div class="alert bg-success alert-dismissible col-12" role="alert" style="color: white;">
                                            <button class="close" aria-label="Close" type="button" data-dismiss="alert"><span aria-hidden="true">×</span></button>
                                            <asp:Label runat="server" ID="reglblSuccess"></asp:Label>
                                        </div>
                                    </asp:PlaceHolder>
                                    <!-- #END#Success Placeholder -->
                                    <!-- Error Placeholder -->
                                    <asp:PlaceHolder ID="regErrorPlaceholder" runat="server" Visible="False">
                                        <div class="alert bg-danger alert-dismissible col-12" role="alert" style="color: white;">
                                            <button class="close" aria-label="Close" type="button" data-dismiss="alert"><span aria-hidden="true">×</span></button>
                                            <asp:Label runat="server" ID="reglblError"></asp:Label>
                                        </div>
                                    </asp:PlaceHolder>
                                    <!-- #END#Error Placeholder -->
                                </div>

                                <div class="row">
                                    <!-- User Type -->
                                    <div class="col-lg-12">
                                        <label>User Type</label>
                                        <asp:DropDownList runat="server" ID="ddlUserType" 
                                            CssClass="form-control mb-30"></asp:DropDownList>
                                    </div>
                                </div>

                                <hr />
                                <!-- Student Register Page -->
                                <div class="row">
                                    <!-- First Name -->
                                    <div class="col-lg-4">
                                        <label>First Name</label>
                                        <asp:TextBox runat="server" ID="txtFName" CssClass="form-control mb-30" 
                                            placeholder="First Name"></asp:TextBox>
                                    </div>

                                    <!-- Last Name -->
                                    <div class="col-lg-4">
                                        <label>Last Name</label>
                                        <asp:TextBox runat="server" ID="txtLName" CssClass="form-control mb-30" 
                                            placeholder="Last Name"></asp:TextBox>
                                    </div>

                                    <!-- Contact -->
                                    <div class="col-lg-4">
                                        <label>Contact</label>&nbsp;&nbsp;&nbsp;&nbsp;<asp:RegularExpressionValidator runat="server" 
                                            ErrorMessage="Numbers only"
                                            ForeColor="Red"
                                            Display="Dynamic"
                                            style="float: right;"
                                            ValidationExpression="^([0-9]\d*)$"
                                            ControlToValidate="txtContact"></asp:RegularExpressionValidator>
                                        <asp:TextBox runat="server" ID="txtContact" CssClass="form-control mb-30"
                                             placeholder="Contact"></asp:TextBox>
                                    </div>

                                    <!-- Email -->
                                    <div class="col-lg-6">
                                        <label>Email</label>
                                        <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control mb-30" 
                                            TextMode="Email" placeholder="Email"></asp:TextBox>
                                    </div>

                                    <!-- Password -->
                                    <div class="col-lg-6">
                                        <label>Password</label>
                                        <asp:RegularExpressionValidator                 ControlToValidate="txtPassword" 
                        ValidationExpression="^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$" runat="server" ErrorMessage="Weak password" Display="Dynamic" ForeColor="Red" style="float: right"></asp:RegularExpressionValidator>
                                        <asp:TextBox runat="server" ID="txtPassword" CssClass="form-control mb-30" 
                                            TextMode="Password" placeholder="Password"></asp:TextBox>
                                    </div>

                                    <!-- Address -->
                                    <div class="col-lg-12">
                                        <label>Address</label>
                                        <asp:TextBox runat="server" ID="txtAddress" CssClass="form-control mb-30" 
                                            placeholder="Address"></asp:TextBox>
                                    </div>

                                    <!-- Proof -->
                                    <div class="col-lg-12">
                                        <label>Proof</label>
                                        <br />
                                        <asp:FileUpload runat="server" ID="imgProof" />
                                        <hr />
                                    </div>

                                    <!-- reCAPTCHA -->
                                    <div class="col-lg-12">
                                        <div class="g-recaptcha" data-sitekey="6Lf-WJoUAAAAAALd3uqhPkzdr7meNALEOB1Ukjwn"></div>
                                        <hr />
                                    </div>

                                    <!-- Register Button -->
                                    <div class="col-lg-12">
                                        <asp:Button runat="server" ID="btnRegister" Text="Register" 
                                            CssClass="btn dento-btn" OnClick="btnRegister_Click" />

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- #END# Register info and main input area -->
        </asp:View>
        <!-- #END# Register View -->
    </asp:MultiView>
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
