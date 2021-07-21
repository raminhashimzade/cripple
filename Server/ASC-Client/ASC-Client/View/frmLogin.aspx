<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmLogin.aspx.cs" Inherits="AileMedia.UserPages.frm_Login" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Özəl Sistemə Giriş</title>
    <style type="text/css">
        .style1 {
            width: 100%;
        }
        .style8 {
            height: 3px;
            width: 157px;
        }
        .backgroundStyle {
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-image: url('/Images/background_login2.jpg');
            background-color: black;
            font-size: x-large;
        }
        .center {
            position: absolute;
            width: 325px;
            height: 200px;
            z-index: 15;
            top: 60%;
            left: 50%;
            margin: -100px 0 0 -150px;
        }
        .dxbButton_BlackGlass
        {
            background-image: none !important;
        }
    </style>
</head>
<body class="backgroundStyle">
    <form id="form_Login" runat="server" autocomplete="off">
        <div class="center">

            <table class="style1" align="center">
                <tr>
                    <td colspan="2" align="center">
                        <asp:CustomValidator ID="cmp_Cust_Validator" runat="server"
                            ControlToValidate="cmp_Text_Login" Font-Bold="True" Font-Size="Small"
                            ForeColor="Red"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:TextBox ID="cmp_Text_Login" runat="server" Width="300px" Style="text-transform: uppercase" Font-Size="X-Large" AutoCompleteType="Disabled" BackColor="#153250" ForeColor="#EBF4FB" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:TextBox ID="cmp_Text_Pass" runat="server" Width="300px"
                            TextMode="Password" AutoCompleteType="Disabled" Font-Size="X-Large" BackColor="#153250" ForeColor="#EBF4FB"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <dx:ASPxButton ID="cmp_Button_Login" runat="server" BackColor="Black" OnClick="cmp_Button_Login_Click" EnableTheming="False" ForeColor="Black" CssClass="dxbButton_BlackGlass">
                            <Image Height="70px" Url="~/Images/lock-41168_640.png" Width="70px">
                            </Image>
                            <PressedStyle BackColor="Black">
                            </PressedStyle>
                            <HoverStyle BackColor="Black">
                            </HoverStyle>
                            <BackgroundImage HorizontalPosition="left" VerticalPosition="top" />
                            <Border BorderColor="Black" />
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
