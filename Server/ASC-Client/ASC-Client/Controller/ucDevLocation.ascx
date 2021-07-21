<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucDevLocation.ascx.cs" Inherits="ASC_Client.Controller.ucDevLocation" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<script type="text/javascript">
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_initializeRequest(prm_InitializeRequest);
    prm.add_endRequest(prm_EndRequest);

    function prm_InitializeRequest(sender, args) {
        LoadingPanel.Show();
    }
    function prm_EndRequest(sender, args) {
        LoadingPanel.Hide();
    }
</script>


<div style="position:absolute; height:82%; width:98%">
<div style="float: left">
    <dx:ASPxDateEdit ID="DateEditFrom" runat="server" DisplayFormatString="dd.MM.yyyy HH:mm:ss" EditFormat="DateTime" EditFormatString="dd.MM.yyyy HH:mm:ss">
    </dx:ASPxDateEdit>
</div>
<div style="float: left">
    <dx:ASPxDateEdit ID="DateEditTo" runat="server" DisplayFormatString="dd.MM.yyyy HH:mm:ss" EditFormat="Custom" EditFormatString="dd.MM.yyyy HH:mm:ss">
    </dx:ASPxDateEdit>
</div>
<div style="float: left">
    <dx:ASPxButton ID="ButtonOK" runat="server" Text="OK" OnClick="ButtonOK_Click" Theme="BlackGlass" Width="75px"></dx:ASPxButton>
</div>

    <map:GoogleMap ID="googleMap" runat="server" DefaultAddress="Baku" Zoom="5"
        Width="100%" Height="100%" FullscreenControl="true" MapType="Roadmap" ApiKey="AIzaSyDAtyk14V1gddmSzQnbykBqmJMJ4SzAYzk" EnableSearchBoxControl="True" Latitude="40.409264" Longitude="49.867092">
        <Center Latitude="40.409264" Longitude="49.867092" />
        <MapTypeControlOptions Position="TopRight" ViewStyle="Default"></MapTypeControlOptions>
        <OverviewMapControlOptions Opened="False"></OverviewMapControlOptions>
    </map:GoogleMap>
</div>

<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True" Theme="BlackGlass">
            <LoadingDivStyle Cursor="wait">
            </LoadingDivStyle>
        </dx:ASPxLoadingPanel>