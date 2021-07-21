using ASC_Client.Models;
using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.IO;

namespace ASC_Client.Controller
{
    public partial class ucDevFiles : System.Web.UI.UserControl
    {
        private string fileId = "";
        private string filePath = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DateEditFrom.Date = DateTime.Now;
                DateEditTo.Date = DateTime.Now;
            }
            RefreshFiles();
            var fileName = cmpGridDevFiles.GetRowValues(cmpGridDevFiles.FocusedRowIndex, "file_name");
            ObjectContainer.ObjectUrl = "~/FileDownload/" + fileName;

            var fileID = cmpGridDevFiles.GetRowValues(cmpGridDevFiles.FocusedRowIndex, "file_id");
            fileId = fileID == null ? "" : fileID.ToString();

            var fileP = cmpGridDevFiles.GetRowValues(cmpGridDevFiles.FocusedRowIndex, "file_path");
            filePath = fileP == null ? "" : fileP.ToString();
        }

        private void RefreshFiles()
        {
            MySqlConnection con = new MySqlConnection(GlobalVar.ConnectionString());
            MySqlCommand cmd = new MySqlCommand(ASCResource.SQL_DEVFILES, con);
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@p_date_from", DateEditFrom.Date);
            cmd.Parameters.AddWithValue("@p_date_to", DateEditTo.Date);
            cmd.Parameters.AddWithValue("@p_imei", Request.QueryString["pimei"]);
            MySqlDataAdapter sqladap = new MySqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sqladap.Fill(dt);
            cmpGridDevFiles.DataSource = dt;
            cmpGridDevFiles.DataBind();
            con.Close();
        }

        protected void cmpButtonConfOK_Click(object sender, EventArgs e)
        {
            if (File.Exists(filePath))
                File.Delete(filePath);

            DevFiles f = new DevFiles();
            f.deleteFile(fileId);
            RefreshFiles();
        }
    }
}