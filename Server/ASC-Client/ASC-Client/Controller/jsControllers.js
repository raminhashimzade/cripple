//--------ucDevInfo----------------------------------------------------------
function OnMenuDevInfo1(s, e) {
    var data = e.item.name;
    if (data == 'TRACK') OnDevTrackGetData();
}

function OnDevTrackGetData() {
    CheckBoxListTrackDev.UnselectAll();
    cmpGridDevInfo.GetRowValues(cmpGridDevInfo.GetFocusedRowIndex(), 'deaf;track;lame', OnDevTrackSetData);
    PopupControlTrack.Show();
}

function OnDevTrackSetData(values) {
    var v = [];
    if (values[0] == 1) {
        v = ['deaf'];
        CheckBoxListTrackDev.SelectValues(v);
    }
    if (values[1] == 1) {
        v = ['track'];
        CheckBoxListTrackDev.SelectValues(v);
    }
    if (values[2] == 1) {
        v = ['lame'];
        CheckBoxListTrackDev.SelectValues(v);
    }       
}
//-END-------ucDevInfo----------------------------------------------------------

//--------ucDevFiles----------------------------------------------------------
function OnMenuDevFiles1(s, e) {
    var data = e.item.name;
    if (data == 'PLAY') PopupControlPlay.Show();    
    //if (data == 'DESC')
    if (data == 'DELETE') cmpPopupControlConfirmation.Show();
}
//-END-------ucDevFiles----------------------------------------------------------