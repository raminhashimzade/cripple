<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucDevInfo.ascx.cs" Inherits="ASC_Client.Models.MainUserControl" %>
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




<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>

        <table class="style1">
            <tr>
                <td align="left" width="100%">
                    <div style='float: left;'>
                        <dx:ASPxMenu ID="MenuDevInfo1" runat="server" AutoSeparators="RootOnly" EnableTheming="True"
                            Font-Size="X-Small" Theme="BlackGlass">
                            <ClientSideEvents ItemClick="function(s, e) {
OnMenuDevInfo1(s, e);	
}" />
                            <Items>
                                <dx:MenuItem Name="EDIT" Text="Qeydlər">
                                    <Image Height="16px" Url="~/Images/data_edit.ico" Width="16px">
                                    </Image>
                                </dx:MenuItem>
                                <dx:MenuItem Name="TRACK" Text="İzləmə">
                                    <Image Height="16px" Url="~/Images/give_to_dealr.ico" Width="16px">
                                    </Image>
                                </dx:MenuItem>
                                <dx:MenuItem Name="LOCATION" Target="_blank" Text="GPS-Izləmə">
                                    <Image Height="16px" Url="~/Images/net.jpg" Width="16px">
                                    </Image>
                                </dx:MenuItem>
                                <dx:MenuItem Name="FILE" Target="_blank" Text="Fayllar">
                                    <Image Height="16px" Url="~/Images/Send Mail 48 n g.gif" Width="16px">
                                    </Image>
                                </dx:MenuItem>
                            </Items>
                        </dx:ASPxMenu>
                    </div>
                    <div style='float: left;'>
                        <dx:ASPxMenu ID="MenuDevInfo2" runat="server" AutoSeparators="RootOnly" EnableTheming="True"
                            Font-Size="X-Small" Theme="BlackGlass" AutoPostBack="True" OnItemClick="MenuDevInfo2_ItemClick">
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
                    <dx:ASPxGridView runat="server" ClientInstanceName="cmpGridDevInfo" EnableCallBacks="False"
                        KeyFieldName="dev_id" AutoGenerateColumns="False" Theme="BlackGlass" Width="100%"
                        Font-Size="X-Small" ID="cmpGridDevInfo" EnableTheming="True" OnHtmlDataCellPrepared="cmpGridDevInfo_HtmlDataCellPrepared">
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="dev_id" Caption="DEV ID" VisibleIndex="4"
                                Width="100px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="IMEI ID" FieldName="dev_imei" VisibleIndex="6" Width="100px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="DEVICE NAME" FieldName="dev_name" VisibleIndex="7"
                                Width="100px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="soft_info"
                                VisibleIndex="8" Caption="SOFT VERSION" Width="100px">
                                <Settings HeaderFilterMode="CheckedList" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="OPERATOR" FieldName="operator" VisibleIndex="9"
                                Width="100px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="LINE NUMBER" FieldName="line_number" VisibleIndex="10"
                                Width="100px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="CHARGE PERCENT" FieldName="charge_percent"
                                VisibleIndex="11" Width="100px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="QEYD" FieldName="desc" VisibleIndex="12"
                                Width="200px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="criminal_n"
                                VisibleIndex="15" Caption="CRIMINAL N" Width="100px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="person_desc"
                                VisibleIndex="16" Caption="PERSON DESC" Width="200px" ShowInCustomizationForm="False">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="person_id" Caption="PERSON ID" VisibleIndex="13" Width="100px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="PERSON NAME" FieldName="person_name" VisibleIndex="14" ShowInCustomizationForm="True" Width="150px">
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataDateColumn Caption="TARİX/SAAT" FieldName="date_time" VisibleIndex="5" Width="100px">
                                <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy HH:mm:ss" EditFormat="Custom" EditFormatString="dd.MM.yyyy HH:mm:ss">
                                </PropertiesDateEdit>
                                <Settings HeaderFilterMode="CheckedList" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                            </dx:GridViewDataDateColumn>

                            <dx:GridViewDataTextColumn Caption="MICROPHONE" FieldName="deaf" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="LOCATION" FieldName="track" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="POST FILE" FieldName="lame" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataDateColumn Caption="LAST SIGNAL" FieldName="last_heartbeat" VisibleIndex="0" Width="100px">
                                <PropertiesDateEdit DisplayFormatString="dd.MM.yyyy HH:mm:ss" EditFormat="Custom" EditFormatString="dd.MM.yyyy HH:mm:ss">
                                </PropertiesDateEdit>
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

        <dx:ASPxPopupControl ID="PopupControlTrack" runat="server" Theme="BlackGlass" ClientInstanceName="PopupControlTrack" CloseAction="CloseButton" CloseAnimationType="Slide" CloseOnEscape="True" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" HeaderText="İzləmə">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <table class="style1">
                        <tr>
                            <td colspan="2">
                                <dx:ASPxCheckBoxList ID="CheckBoxListTrackDev" runat="server" Font-Size="Medium" Width="200px" ClientInstanceName="CheckBoxListTrackDev">
                                    <Items>
                                        <dx:ListEditItem Text="Mikrofonu Yandır" Value="deaf" />
                                        <dx:ListEditItem Text="Yeri Öyrən" Value="track" />
                                        <dx:ListEditItem Text="Faylları Al" Value="lame" />
                                    </Items>
                                </dx:ASPxCheckBoxList>
                            </td>
                        </tr>

                        <tr>
                            <td align="left">
                                <dx:ASPxButton ID="ButtonTrackOk" runat="server" Text="OK" Theme="Aqua"
                                    Width="75px" OnClick="ButtonTrackOk_Click">
                                    <ClientSideEvents Click="function(s, e) {
if (isValid()) PopupControlTrack.Hide();
}" />
                                </dx:ASPxButton>
                            </td>
                            <td align="left">
                                <dx:ASPxButton ID="ButtonTrackCancel" runat="server" Text="Imtina" Theme="Aqua" Width="75px">
                                    <ClientSideEvents Click="function(s, e) { PopupControlTrack.Hide(); }" />
                                </dx:ASPxButton>
                            </td>
                            <td width="100%">&nbsp;
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

        <dx:ASPxPopupControl ID="cmpPopupControlAdressEdit" runat="server" Width="300px"
            HeaderText="ÜNVAN" Theme="Office2003Blue" AutoUpdatePosition="True" Modal="True"
            PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter"
            ClientInstanceName="cmpPopupControlAdressEdit">
            <HeaderStyle Font-Bold="True" />
            <ContentCollection>
                <dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
                    <table class="style1">
                        <tr>
                            <td colspan="2" align="right">
                                <dx:ASPxLabel ID="ASPxLabel6" runat="server" Font-Bold="True" Font-Size="Small" Text="Id :"
                                    Theme="iOS" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="cmpTextBoxAddressId" runat="server" ClientInstanceName="cmpTextBoxAddressId"
                                    Width="250px" ReadOnly="True">
                                    <ClientSideEvents TextChanged="function(s, e) {
	s.SetText(s.GetText().toUpperCase());
}" />
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <dx:ASPxLabel ID="ASPxLabel40" runat="server" Font-Bold="True" Font-Size="Small"
                                    Text="Filial :" Theme="iOS" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cmpComboboxBranch" runat="server" ClientInstanceName="cmpComboboxBranch"
                                    Theme="Aqua" ValueField="AM_ID" ValueType="System.Int32" Width="250px" AutoPostBack="True">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="AM_BRANCH_NAME" />
                                    </Columns>
                                    <ValidationSettings CausesValidation="True">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Bold="True" Font-Size="Small" Text="Rayon :"
                                    Theme="iOS" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cmpComboboxRegion" runat="server" Theme="Aqua" ValueField="AM_ID"
                                    ValueType="System.Int32" Width="250px" ClientInstanceName="cmpComboboxRegion">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="am_region_name" />
                                    </Columns>
                                    <Items>
                                        <dx:ListEditItem Text="CLOSE" Value="0" />
                                        <dx:ListEditItem Text="OPEN" Value="0" />
                                    </Items>
                                    <ValidationSettings CausesValidation="True">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <dx:ASPxLabel ID="ASPxLabel3" runat="server" Font-Bold="True" Font-Size="Small" Text="Ünvan :"
                                    Theme="iOS" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="cmpTextBoxAddressEdit" runat="server" ClientInstanceName="cmpTextBoxAddressEdit"
                                    Width="299px">
                                    <ClientSideEvents TextChanged="function(s, e) {
	s.SetText(s.GetText().toUpperCase());
}" />
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="True" Font-Size="Small" Text="Ev :"
                                    Theme="iOS" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="cmpTextBoxHomeEdit" runat="server" ClientInstanceName="cmpTextBoxHomeEdit"
                                    Width="299px">
                                    <ClientSideEvents TextChanged="function(s, e) {
	s.SetText(s.GetText().toUpperCase());
}" />
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="right">
                                <dx:ASPxLabel ID="ASPxLabel41" runat="server" Font-Bold="True"
                                    Font-Size="Small" Text="Klaster :" Theme="iOS" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="cmpTextBoxKlaster" runat="server"
                                    ClientInstanceName="cmpTextBoxKlaster" Width="299px">
                                    <ClientSideEvents TextChanged="function(s, e) {
	s.SetText(s.GetText().toUpperCase());
}" />
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <dx:ASPxLabel ID="ASPxLabel5" runat="server" Font-Bold="True" Font-Size="Small"
                                    Text="Növü :" Theme="iOS" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cmpComboboxType" runat="server"
                                    ClientInstanceName="cmpComboboxType" SelectedIndex="0" Theme="Aqua"
                                    ValueField="AM_ID" ValueType="System.Int32" Width="100px">
                                    <Items>
                                        <dx:ListEditItem Selected="True" />
                                        <dx:ListEditItem Text="TV" Value="0" />
                                        <dx:ListEditItem Text="NET" Value="1" />
                                        <dx:ListEditItem Text="TV-NET" Value="2" />
                                        <dx:ListEditItem Text="OTT" Value="3" />
                                        <dx:ListEditItem Text="OTT-NET" Value="4" />
                                    </Items>
                                    <ValidationSettings CausesValidation="True">
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>

                        <tr>
                            <td align="right" colspan="2">
                                <dx:ASPxLabel ID="ASPxLabel7" runat="server" Font-Bold="True" Font-Size="Small"
                                    Text="Real Tarif :" Theme="iOS" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="cmpTextBoxStRealTarif" runat="server"
                                    ClientInstanceName="cmpTextBoxStRealTarif" Width="100px">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>

                        <tr>
                            <td align="right" colspan="2">
                                <dx:ASPxLabel ID="ASPxLabel11" runat="server" Font-Bold="True" Font-Size="Small"
                                    Text="Abunəçi Tarifi :" Theme="iOS" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="cmpTextBoxStAbonTarif" runat="server"
                                    ClientInstanceName="cmpTextBoxStAbonTarif" Width="100px">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>

                        <tr>
                            <td align="right" colspan="2">
                                <dx:ASPxLabel ID="ASPxLabel8" runat="server" Font-Bold="True" Font-Size="Small"
                                    Text="Qoşulma Haqqı:" Theme="iOS" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="cmpTextBoxStConnTarif" runat="server"
                                    ClientInstanceName="cmpTextBoxStConnTarif" Width="100px">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="True" />
                                    </ValidationSettings>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>

                        <tr>
                            <td align="right" colspan="2">
                                <dx:ASPxLabel ID="ASPxLabel10" runat="server" Font-Bold="True" Font-Size="Small"
                                    Text="Inkassator:" Theme="iOS" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxComboBox ID="cmpComboboxCollector" runat="server" Theme="Aqua" ValueField="AM_ID"
                                    ValueType="System.Int32" Width="250px" ClientInstanceName="cmpComboboxCollector">
                                    <Columns>
                                        <dx:ListBoxColumn FieldName="AM_COLLECTOR_NAME" />
                                    </Columns>
                                    <Items>
                                        <dx:ListEditItem Text="CLOSE" Value="0" />
                                        <dx:ListEditItem Text="OPEN" Value="0" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>



                        <tr>
                            <td style="vertical-align: top; text-align: right" colspan="2">
                                <dx:ASPxLabel ID="ASPxLabel9" runat="server" Font-Bold="True" Font-Size="Small"
                                    Text="Qeyd :" Theme="iOS" Wrap="False">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxMemo ID="cmpMemoDesc" runat="server" Height="71px" Theme="Aqua" Width="299px" ClientInstanceName="cmpMemoDesc">
                                </dx:ASPxMemo>
                            </td>
                        </tr>

                        <tr>
                            <td align="left">
                                <dx:ASPxButton ID="cmpButtonOK" runat="server" Text="OK" Theme="Aqua"
                                    Width="75px">
                                    <ClientSideEvents Click="function(s, e) {
if (isValid()) cmpPopupControlAdressEdit.Hide();
}" />
                                </dx:ASPxButton>
                            </td>
                            <td align="left">
                                <dx:ASPxButton ID="cmpButtonCancel0" runat="server" Text="Imtina" Theme="Aqua" Width="75px">
                                    <ClientSideEvents Click="function(s, e) { cmpPopupControlAdressEdit.Hide(); }" />
                                </dx:ASPxButton>
                            </td>
                            <td width="100%">&nbsp;
                            </td>
                        </tr>
                    </table>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

        <dx:ASPxGridViewExporter ID="cmpGridViewExporter" runat="server"
            GridViewID="cmpGridAddress">
        </dx:ASPxGridViewExporter>

        <dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="LoadingPanel" Modal="True" Theme="BlackGlass">
            <LoadingDivStyle Cursor="wait">
            </LoadingDivStyle>
        </dx:ASPxLoadingPanel>
    </ContentTemplate>
</asp:UpdatePanel>
