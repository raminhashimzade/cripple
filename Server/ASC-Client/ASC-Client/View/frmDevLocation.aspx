<%@ Page Title="" Language="C#" MasterPageFile="~/View/MainMaster.Master" AutoEventWireup="true" CodeBehind="frmDevLocation.aspx.cs" Inherits="ASC_Client.View.frmDevLocation" %>
<%@ Register src="../Controller/ucDevLocation.ascx" tagname="ucDevLocation" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucDevLocation ID="ucDevLocation1" runat="server" />
</asp:Content>
