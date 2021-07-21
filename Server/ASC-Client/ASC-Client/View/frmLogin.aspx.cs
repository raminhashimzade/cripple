using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;




namespace AileMedia.UserPages
{
    public class session_user
    {
        public int user_id;
        public string user_name;
        public string user_login;
        public int user_group_id;
    }

    public partial class frm_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session.Clear();
                cmp_Text_Login.Focus();
            }
        }


        protected void cmp_Button_Login_Click(object sender, EventArgs e)
        {
            Response.Redirect("frmDevInfo.aspx", false);

            /*
            var apc = new AppClass();

            if ((cmp_Text_Login.Text == string.Empty) || (cmp_Text_Pass.Text == string.Empty))
            {
                return;
            }

            cmp_Text_Login.Text = cmp_Text_Login.Text.ToUpper();
            var appConn = new OracleConnection(apc.OraConnStr());

            try
            {
                appConn.Open();

                var cmd = new OracleCommand();
                cmd.BindByName = true;
                cmd.CommandText = "rr_app_resource.app_system.checklogon";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Connection = appConn;

                cmd.Parameters.Add("p_userlogin", OracleDbType.Varchar2, 64);
                cmd.Parameters["p_userlogin"].Direction = ParameterDirection.Input;
                cmd.Parameters["p_userlogin"].Value = cmp_Text_Login.Text;

                cmd.Parameters.Add("p_password", OracleDbType.Varchar2, 64);
                cmd.Parameters["p_password"].Direction = ParameterDirection.Input;
                cmd.Parameters["p_password"].Value = cmp_Text_Pass.Text;

                cmd.Parameters.Add("retval", OracleDbType.Varchar2, 30);
                cmd.Parameters["retval"].Direction = ParameterDirection.ReturnValue;

                cmd.ExecuteNonQuery();

                var logon = cmd.Parameters["retval"].Value.ToString();

                if (logon == "true")
                {
                    var oraAdap = new OracleDataAdapter();
                    oraAdap.SelectCommand = new OracleCommand();
                    oraAdap.SelectCommand.Connection = appConn;
                    oraAdap.SelectCommand.CommandText = "select * from rr_app_resource.app_user where app_login=:login";
                    oraAdap.SelectCommand.Parameters.Add("login", OracleDbType.Varchar2, 10).Value = cmp_Text_Login.Text;


                    var oraRead = oraAdap.SelectCommand.ExecuteReader();
                    while (oraRead.Read())
                    {
                        Session["vrb_user_id"] = Convert.ToInt32(oraRead["APP_ID"]);
                        Session["vrb_user_login"] = (string)oraRead["APP_LOGIN"];
                        Session["vrb_user_name"] = (string)oraRead["APP_NAME"];
                        Session["vrb_user_group_id"] = Convert.ToInt32(oraRead["APP_USER_GROUP_ID"]);
                        Session["vrb_user_branch"] = Convert.ToInt32(oraRead["APP_FILIAL_ID"]);
                    }
                    oraRead.Close();
                    oraAdap.SelectCommand.Dispose();
                    oraAdap.Dispose();
                }
                else
                {
                    cmp_Cust_Validator.IsValid = false;
                    cmp_Cust_Validator.Text = "Login vəya Parol Səhvdir...!";
                    return;
                }

                appConn.Close();

                if (apc.CheckEodStatus() == "START" & cmp_Text_Login.Text != "RR_ADMIN" & Convert.ToInt32(Session["vrb_user_group_id"]) != 10046 & Convert.ToInt32(Session["vrb_user_group_id"]) != 10047)
                {
                    cmp_Cust_Validator.IsValid = false;
                    cmp_Cust_Validator.Text = "Əməliyyat günü bağlanır. Xahiş olunur bir az sonra təkrar dənəyin...";
                    return;
                }

                
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Pooled connection request timed out"))
                {
                    AppSystemClass.RecycleAppPool();

                    cmp_Cust_Validator.IsValid = false;
                    cmp_Cust_Validator.Text = "Bir Daha Dənəyin...!";
                    apc.trace(cmp_Cust_Validator.Text + ex.Message);
                    return;
                }
                apc.appRaiseError(ex.Message);
            }
            finally
            {
                appConn.Dispose();
            }
            */
        }
        
    }
}
