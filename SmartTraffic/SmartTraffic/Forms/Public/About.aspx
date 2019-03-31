<%@ Page Title="About" Language="C#" MasterPageFile="~/Forms/Public/public.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SmartTraffic.About" %>

<asp:Content ID="Content2" ContentPlaceHolderID="cpTitle" runat="server">
    About | Smart Traffic Management
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcumb-area bg-img bg-gradient-overlay" style="background-image: url(img/bg-img/12.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12" style="text-align: center;">
                    <h2 class="title">About</h2>
                </div>
            </div>
        </div>
    </div>

    <section class="dento-about-us-area mt-70">
        <div class="container">
            <div class="row align-items-center">
                <!-- About Us Thumbnail -->
                <div class="col-12 col-md-6">
                    <div class="about-us-thumbnail mb-50">
                        <img src="./img/bg-img/3.jpg" alt="">
                    </div>
                </div>
                <!-- About Content -->
                <div class="col-12 col-md-6">
                    <div class="about-us-content mb-50">
                        <!-- Section Heading -->
                        <div class="section-heading">
                            <h2>About Us</h2>
                            <div class="line"></div>
                        </div>
                        <p>
                            Vestibulum condimentum, risus sedones honcus rutrum, salah lacus mollis zurna,
                            nec finibusmi velit advertisis. Proin vitae odin quis magna aliquet laciniae. 
                            Etiam auctor, nisi vel. Pellentesque ultrices nisl quam iaculis, nec pulvinar augue.
                            <br /><br />
                            Proin vitae odin quis magna aliquet laciniae. 
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
