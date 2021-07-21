using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ASC_Client.Models
{
    public class DevLocation
    {
        public class DevLoc
        {
            public string p_dev_id { get; set; }
            public string p_loc_type { get; set; }
            public string p_loc_x { get; set; }
            public string p_loc_y { get; set; }
        }


        public void location(String p_json)
        {
            DevLoc tr = JsonConvert.DeserializeObject<DevLoc>(p_json);
            MySqlConnection con = new MySqlConnection(GlobalVar.ConnectionString());
            con.Open();
            MySqlCommand cmd = new MySqlCommand("proc_dev_location", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@p_dev_id", tr.p_dev_id);
            cmd.Parameters.AddWithValue("@p_loc_type", tr.p_loc_type);
            cmd.Parameters.AddWithValue("@p_loc_x", tr.p_loc_x);
            cmd.Parameters.AddWithValue("@p_loc_y", tr.p_loc_y);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}