using MySql.Data.MySqlClient;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace ASC_Client.Models
{
    public class DevTracker
    {

        public class DevTrack
        {
            public IList<string> p_type = new List<string>();
        }


        public string selectTrack(string p_dev_id)
        {
            MySqlConnection con = new MySqlConnection(GlobalVar.ConnectionString());
            con.Open();
            MySqlDataAdapter sqlAdap = new MySqlDataAdapter();
            MySqlDataReader sqlRead;
            sqlAdap.SelectCommand = new MySqlCommand();
            sqlAdap.SelectCommand.Connection = con;
            sqlAdap.SelectCommand.CommandText = "select track_type from asc.dev_tracker where dev_id = @p_dev_id AND track_status = 1";
            sqlAdap.SelectCommand.Parameters.AddWithValue("@p_dev_id", p_dev_id);
            sqlRead = sqlAdap.SelectCommand.ExecuteReader();
            
            DevTrack tr = new DevTrack();
            while (sqlRead.Read())
                tr.p_type.Add(sqlRead["track_type"].ToString());

            string json = JsonConvert.SerializeObject(tr, Formatting.Indented);            
            con.Close();

            heartBeat(p_dev_id);

            return json;
        }

        public void devTrack(string p_dev_id, string p_track_type, int p_status)
        {
            MySqlConnection con = new MySqlConnection(GlobalVar.ConnectionString());
            con.Open();
            MySqlCommand cmd = new MySqlCommand("proc_dev_track", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@p_dev_id", p_dev_id);
            cmd.Parameters.AddWithValue("@p_user_id", GlobalVar.User.userID);
            cmd.Parameters.AddWithValue("@p_track_type", p_track_type);
            cmd.Parameters.AddWithValue("@p_dml", p_status == 1 ? "insert" : "delete");
            cmd.ExecuteNonQuery();            
            con.Close();
        }

        public void heartBeat(string p_dev_id)
        {
            MySqlConnection con = new MySqlConnection(GlobalVar.ConnectionString());
            con.Open();
            MySqlCommand cmd = new MySqlCommand("proc_dev_heartBeat", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@p_dev_id", p_dev_id);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}