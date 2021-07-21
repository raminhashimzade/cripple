<%@ Page Title="" Language="C#" MasterPageFile="~/View/MainMaster.Master" AutoEventWireup="true" CodeBehind="frmDevInfo.aspx.cs" Inherits="ASC_Client.View.frmDevInfo" %>
<%@ Register src="../Controller/ucDevInfo.ascx" tagname="ucDevInfo" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucDevInfo ID="ucDevInfo1" runat="server" />
</asp:Content>
