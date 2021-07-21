using Newtonsoft.Json;
using System;
using MySql.Data.MySqlClient;
using System.Data;

namespace ASC_Client.Models
{
    public class DevInfo
    {
        public class DevInf
        {
            public string p_dev_id { get; set; }
            public string p_dev_imei { get; set; }
            public string p_dev_name { get; set; }
            public string p_dev_model { get; set; }
            public string p_soft_info { get; set; }
            public string p_operator { get; set; }
            public string p_line_number { get; set; }
            public string p_charge_percent { get; set; }
        }

        public void RegisterDevInfo(String p_json)
        {
            DevInf inf = JsonConvert.DeserializeObject<DevInf>(p_json);

            MySqlConnection con = new MySqlConnection(GlobalVar.ConnectionString());
            con.Open();

            MySqlCommand cmd = new MySqlCommand("proc_dev_info", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@p_dev_imei", inf.p_dev_imei);
            cmd.Parameters.AddWithValue("@p_dev_name", inf.p_dev_name);
            cmd.Parameters.AddWithValue("@p_dev_model", inf.p_dev_model);
            cmd.Parameters.AddWithValue("@p_soft_info", inf.p_soft_info);
            cmd.Parameters.AddWithValue("@p_operator", inf.p_operator);
            cmd.Parameters.AddWithValue("@p_line_number", inf.p_line_number);
            cmd.Parameters.AddWithValue("@p_charge_percent", inf.p_charge_percent);
            cmd.Parameters.AddWithValue("@p_desc", "");
            cmd.Parameters.AddWithValue("@p_dml", "insert");
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}