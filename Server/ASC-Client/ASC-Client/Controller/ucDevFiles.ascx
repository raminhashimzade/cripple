<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucDevFiles.ascx.cs" Inherits="ASC_Client.Controller.ucDevFiles" %>
<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<script src="../../jsClient.js?20180204" type="text/javascript"></script>
<script src="../Controller/jsControllers.js?20180205" type="text/javascript"></script>
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

<style type="text/css">
    .style1 {
        width: 100%;
    }
</style>


<asp:UpdatePanel ID="UpdatePanel2" runat="server" EnableViewState="False">
    <ContentTemplate>

        <table class="style1">
            <tr>
                <td align="left" width="100%">
                    <div style='float: left;'>
                        <dx:ASPxMenu ID="MenuDevFiles1" runat="server" AutoSeparators="RootOnly" EnableTheming="True"
                            Font-Size="X-Small" Theme="BlackGlass">
                            <ClientSideEvents ItemClick="function(s, e) {
OnMenuDevFiles1(s,e);
}" />
                            <Items>
                                <dx:MenuItem Name="PLAY" Text="Oynat">
                                    <Image Height="16px" Url="~/Images/Movie Play 48 n i8.ico" Width="16px">
                                    </Image>
                                </dx:MenuItem>
                                <dx:MenuItem Name="DESC" Text="Qeyd">
                                </dx:MenuItem>
                                <dx:MenuItem Name="DELETE" Text="Sil">
                                    <Image Height="16px" Url="~/Images/data_delete.ico" Width="16px">
                                    </Image>
                                </dx:MenuItem>
                            </Items>
                        </dx:ASPxMenu>
                    </div>
                    <div style='float: left;'>
                        <dx:ASPxMenu ID="MenuDevFiles2" runat="server" AutoSeparators="RootOnly" EnableTheming="True"
                            Font-Size="X-Small" Theme="BlackGlass" AutoPostBack="True">
                            <Items>
                                <dx:MenuItem Name="REFRESH" Text="Yenilə">
                                    <Image Height="16px" Url="~/Images/data_refresh.ico" Width="16px">
                                    </Image>
                                </dx:MenuItem>
                                <dx:MenuItem Name="EXPORT" Text="Export">
                                    <Image Height="16px" Url="~/Images/data_up.ico" Width="16px">
                                    </Image>
                                </dx:MenuItem>
                            </Items>
                        </dx:ASPxMenu>
                    </div>
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Height="0px" Text="Button" Width="0px" />
                </td>
            </tr>
            <tr>
                <td colspan="2">

                    <div style="float: left">
                        <dx:ASPxDateEdit ID="DateEditFrom" runat="server" DisplayFormatString="dd.MM.yyyy HH:mm:ss" EditFormat="DateTime" EditFormatString="dd.MM.yyyy HH:mm:ss">
                        </dx:ASPxDateEdit>
                    </div>
                    <div style="float: left">
                        <dx:ASPxDateEdit ID="DateEditTo" runat="server" DisplayFormatString="dd.MM.yyyy HH:mm:ss" EditFormat="Custom" EditFormatString="dd.MM.yyyy HH:mm:ss">
                        </dx:ASPxDateEdit>
                    </div>
                    <div style="float: left">
                        <dx:ASPxButton ID="ButtonOK" runat="server" Text="OK" Theme="BlackGlass" Width="75px"></dx:ASPxButton>
                    </div>

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <dx:ASPxGridView runat="server" ClientInstanceName="cmpGridDevFiles" EnableCallBacks="False"
                        KeyFieldName="file_id" AutoGenerateColumns="False" Theme="BlackGlass" Width="100%"
                        Font-Size="X-Small" ID="cmpGridDevFiles" EnableTheming="True">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="file_id" Caption="FILE ID" VisibleIndex="0"
                                Width="100px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="IMEI ID" FieldName="dev_id" VisibleIndex="2" Width="150px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="FILE NAME" FieldName="file_name" VisibleIndex="3"
                                Width="200px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="file_type"
                                VisibleIndex="4" Caption="FILE TYPE" Width="100px">
                                <Settings HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="FILE PATH" FieldName="file_path" VisibleIndex="5"
                                Width="200px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="BOOKMARK" FieldName="bookmark" VisibleIndex="6"
                                Width="100px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="QEYD" FieldName="file_desc"
                                VisibleIndex="8" Width="200px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataDateColumn Caption="TARİX/SAAT" FieldName="date_time" VisibleIndex="1" Width="150px">
                                <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy HH:mm:ss" EditFormat="Custom" EditFormatString="dd.MM.yyyy HH:mm:ss">
                                </PropertiesDateEdit>
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataDateColumn>

                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" ColumnResizeMode="Control" ProcessSelectionChangedOnServer="True" ProcessFocusedRowChangedOnServer="True"></SettingsBehavior>
                        <ClientSideEvents EndCallback="function(s, e) {
OnInit(s, e,130);
}"
                            Init="function(s, e) {
OnInit(s, e,130);
}" />
                        <SettingsPager PageSize="15" Position="Top" AlwaysShowPager="True">
                            <PageSizeItemSettings Visible="True">
                            </PageSizeItemSettings>
                        </SettingsPager>
                        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="3"></SettingsEditing>
                        <Settings ShowFilterRow="True" ShowFilterRowMenu="True" ShowGroupPanel="True" ShowFooter="True"
                            ShowHorizontalScrollBar="True" ShowGroupedColumns="True" ShowHeaderFilterButton="true" ShowFilterBar="Auto" HorizontalScrollBarMode="Visible" VerticalScrollBarMode="Visible"></Settings>
                        <SettingsText CommandEdit="G&#246;stər"></SettingsText>
                        <SettingsPopup>
                            <EditForm Width="75%" Height="100%" HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter"
                                AllowResize="True" Modal="True"></EditForm>
                        </SettingsPopup>
                        <Styles>
                            <Header Font-Bold="True">
                            </Header>
                        </Styles>
                    </dx:ASPxGridView>
                </td>
            </tr>
        </table>
        <dx:ASPxPopupControl ID="PopupControlPlay" runat="server" Theme="BlackGlass" ClientInstanceName="PopupControlPlay" CloseAction="CloseButton" CloseAnimationType="Slide" CloseOnEscape="True" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <dx:ASPxObjectContainer ID="ObjectContainer" runat="server"
                        ObjectType="Audio" Height="100px" Width="500px" ClientInstanceName="ObjectContainer">
                        <ObjectProperties AutoStart="False" />
                    </dx:ASPxObjectContainer>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

        <dx:ASPxGridViewExporter ID="cmpGridViewExporter" runat="server"
            GridViewID="cmpGridAddress">
        </dx:ASPxGridViewExporter>


        <dx:ASPxGlobalEvents ID="ge" runat="server">
            <ClientSideEvents ControlsInitialized="function(s, e) {
OnControlsInitialized(s, e,130);
}" />
        </dx:ASPxGlobalEvents>

<dx:ASPxPopupControl ID="cmpPopupControlConfirmation" runat="server" AutoUpdatePosition="True"
    ClientInstanceName="cmpPopupControlConfirmation" 
    EnableViewState="False" HeaderText="Diqqət File Silinsin?!!"
    Modal="True" PopupAction="None" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
    ShowCloseButton="False" ShowPageScrollbarWhenModal="True" Theme="BlackGlass" 
    Width="222px" CloseOnEscape="True">
    <HeaderStyle Font-Bold="True" />
    <ContentCollection>
        <dx:PopupControlContentControl ID="PopupControlContentControl4" runat="server" 
            SupportsDisabledAttribute="True">
            <table class="style1">
                <tr>
                    <td>
                        <dx:ASPxButton ID="cmpButtonConfOK" runat="server"
                            Text="OK" Theme="BlackGlass" Width="75px" OnClick="cmpButtonConfOK_Click">
                            <ClientSideEvents Click="function(s, e) {
cmpPopupControlConfirmation.Hide();
}" />
                        </dx:ASPxButton>
                    </td>
                    <td width="10">
                        &nbsp;
                    </td>
                    <td align="right">
                        <dx:ASPxButton ID="cmpButtonConfCancel" runat="server" Text="Imtina" Theme="BlackGlass" 
                            Width="75px">
                            <ClientSideEvents Click="function(s, e) {cmpPopupControlConfirmation.Hide();}" />
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>
        </dx:PopupControlContentControl>
    </ContentCollection>
</dx:ASPxPopupControl>

<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True" Theme="BlackGlass">
            <LoadingDivStyle Cursor="wait">
            </LoadingDivStyle>
        </dx:ASPxLoadingPanel>

    </ContentTemplate>
</asp:UpdatePanel>