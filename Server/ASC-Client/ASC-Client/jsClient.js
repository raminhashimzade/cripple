/*-------PRINT POPUP-------------------------------------------------------------------------*/
function PrintDiv() {
    var divContents = document.getElementById("divContents").innerHTML;
    var printWindow = window.open('', '', 'height=200,width=400');
    printWindow.document.write('<html><head><title>DIV Contents</title>');
    printWindow.document.write('</head><body >');
    printWindow.document.write(divContents);
    printWindow.document.write('</body></html>');
    printWindow.document.close();
    printWindow.print();
}
/*-------/END PRINT POPUP-------------------------------------------------------------------------*/


/*-------CHECK VALIDATION OF CONTROLS IN PAGE-------------------------------------------------------------------------*/
function isValid() {  
    if (!ASPxClientEdit.ValidateEditorsInContainer(null))
        return false;
    else
        return true;
}
/*-------/END CHECK VALIDATION OF CONTROLS IN PAGE---------------------------------------------------------------------*/

/*-------AUTORESIZE GRIDVIEW HEIGHT------------------------------------------------------------------------------------*/
function OnInit(s, e, h) {
    AdjustSize(s,h);
}

function OnControlsInitialized(s, e, h) {
    ASPxClientUtils.AttachEventToElement(window, "resize", function (evt) {
        AdjustSize(s, h);
    });
}
function AdjustSize(s, h) {
    var height = Math.max(0, document.documentElement.clientHeight);    
    s.SetHeight(height - h);
}
/*---------------------------------------------------------------------------------------------------------------------*/
