using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ASC_Client.Models
{
    public class DevFiles
    {
        public string fileName = "";
        public class DevFile
        {
            public string p_dev_id { get; set; }
            public string p_file_name { get; set; }
            public string p_file_type { get; set; }
        }

        public void saveFile(String p_json)
        {
            DevFile f = JsonConvert.DeserializeObject<DevFile>(p_json);
            MySqlConnection con = new MySqlConnection(GlobalVar.ConnectionString());
            con.Open();
            MySqlCommand cmd = new MySqlCommand("proc_dev_files", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@p_file_id", 0);
            cmd.Parameters.AddWithValue("@p_dev_id", f.p_dev_id);
            cmd.Parameters.AddWithValue("@p_file_type", f.p_file_type);
            cmd.Parameters.AddWithValue("@p_file_name", f.p_file_name);
            cmd.Parameters.AddWithValue("@p_file_path", System.Web.Hosting.HostingEnvironment.MapPath("~/FileDownload/")+f.p_file_name);
            cmd.Parameters.AddWithValue("@p_dml", "insert");
            cmd.ExecuteNonQuery();

            fileName = f.p_file_name;
            con.Close();
        }

        public void deleteFile(String p_fileId)
        {            
            MySqlConnection con = new MySqlConnection(GlobalVar.ConnectionString());
            con.Open();
            MySqlCommand cmd = new MySqlCommand("proc_dev_files", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@p_file_id", p_fileId);
            cmd.Parameters.AddWithValue("@p_dev_id", "");
            cmd.Parameters.AddWithValue("@p_file_type", "");
            cmd.Parameters.AddWithValue("@p_file_name", "");
            cmd.Parameters.AddWithValue("@p_file_path", "");
            cmd.Parameters.AddWithValue("@p_dml", "delete");
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}