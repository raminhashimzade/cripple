using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASC_Client.Models
{
    public partial class MainUserControl : System.Web.UI.UserControl
    {
        string imei = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            GlobalVar.User.userID = 0;

            RefreshDevInfo();
            var im = cmpGridDevInfo.GetRowValues(cmpGridDevInfo.FocusedRowIndex, "dev_imei");
            imei = im == null ? "" : im.ToString();
            MenuDevInfo1.Items[2].NavigateUrl = "~/View/frmDevLocation.aspx?pimei=" + imei;
            MenuDevInfo1.Items[3].NavigateUrl = "~/View/frmDevFiles.aspx?pimei=" + imei;
        }

        private void RefreshDevInfo()
        {
            MySqlConnection con = new MySqlConnection(GlobalVar.ConnectionString());
            MySqlCommand cmd = new MySqlCommand(ASCResource.SQL_DEVINFO, con);
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            MySqlDataAdapter sqladap = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sqladap.Fill(dt);
            cmpGridDevInfo.DataSource = dt;
            cmpGridDevInfo.DataBind();
            con.Close();
        }

        protected void MenuDevInfo2_ItemClick(object source, DevExpress.Web.MenuItemEventArgs e)
        {

        }

        protected void cmpGridDevInfo_HtmlDataCellPrepared(object sender, DevExpress.Web.ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName.Contains("track"))
            {
                var track = cmpGridDevInfo.GetRowValues(e.VisibleIndex, "track").ToString();
                if (track == "1")
                    e.Cell.BackColor = System.Drawing.Color.Red;
                else
                    e.Cell.BackColor = System.Drawing.Color.White;
            }
            if (e.DataColumn.FieldName.Contains("deaf"))
            {
                var deaf = cmpGridDevInfo.GetRowValues(e.VisibleIndex, "deaf").ToString();
                if (deaf == "1")
                    e.Cell.BackColor = System.Drawing.Color.Red;
                else
                    e.Cell.BackColor = System.Drawing.Color.White;
            }
            if (e.DataColumn.FieldName.Contains("lame"))
            {                
                var lame = cmpGridDevInfo.GetRowValues(e.VisibleIndex, "lame").ToString();
                if (lame == "1")
                    e.Cell.BackColor = System.Drawing.Color.Red;
                else
                    e.Cell.BackColor = System.Drawing.Color.White;
            }
        }

        protected void ButtonTrackOk_Click(object sender, EventArgs e)
        {
            DevTracker tracker = new DevTracker();

            if (CheckBoxListTrackDev.Items[0].Selected)
                tracker.devTrack(imei, "deaf", 1);
            else
                tracker.devTrack(imei, "deaf", -1);

            if (CheckBoxListTrackDev.Items[1].Selected)
                tracker.devTrack(imei, "track", 1);
            else
                tracker.devTrack(imei, "track", -1);

            if (CheckBoxListTrackDev.Items[2].Selected)
                tracker.devTrack(imei, "lame", 1);
            else
                tracker.devTrack(imei, "lame", -1);

            RefreshDevInfo();
        }
    }
}