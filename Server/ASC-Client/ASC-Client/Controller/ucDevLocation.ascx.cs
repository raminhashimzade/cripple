using GoogleMaps;
using GoogleMaps.Markers;
using GoogleMaps.Overlays;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ASC_Client.Controller
{
    public partial class ucDevLocation : System.Web.UI.UserControl
    {
        GoogleMarkers markers;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateEditFrom.Date = DateTime.Now;
                DateEditTo.Date = DateTime.Now;
            }
            RefreshMarkers();
            googleMap.Markers.Add(markers);
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            
        }

        protected void ButtonOK_Click(object sender, EventArgs e)
        {

        }

        private void RefreshMarkers()
        {
            MarkerImage mg = new MarkerImage();
            mg.Url = "http://maps.google.com/mapfiles/ms/icons/red.png";


            markers = new GoogleMarkers();
            MySqlConnection con = new MySqlConnection(GlobalVar.ConnectionString());
            MySqlCommand cmd = new MySqlCommand(ASCResource.SQL_DEVLOCATION, con);
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;            
            cmd.Parameters.AddWithValue("@p_date_from", DateEditFrom.Date);
            cmd.Parameters.AddWithValue("@p_date_to", DateEditTo.Date);
            cmd.Parameters.AddWithValue("@p_imei", Request.QueryString["pimei"]);
            MySqlDataAdapter sqladap = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sqladap.Fill(dt);

            foreach (DataRow row in dt.Rows)
            {
                markers.Markers.Add(new Marker
                {
                    Position = new LatLng(Convert.ToDouble(row["loc_x"]), Convert.ToDouble(row["loc_y"])),
                    Title = row["dev_id"].ToString(),
                    Info = row["loc_datetime"].ToString(),
                    Icon = mg
                });
            }
            con.Close();
        }
    }
}