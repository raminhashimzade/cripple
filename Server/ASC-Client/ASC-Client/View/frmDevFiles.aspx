<%@ Page Title="" Language="C#" MasterPageFile="~/View/MainMaster.Master" AutoEventWireup="true" CodeBehind="frmDevFiles.aspx.cs" Inherits="ASC_Client.View.frmDevFiles" %>
<%@ Register src="../Controller/ucDevFiles.ascx" tagname="ucDevFiles" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:ucDevFiles ID="ucDevFiles1" runat="server" />
</asp:Content>
