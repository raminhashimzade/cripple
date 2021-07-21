using ASC_Client;
using System;
using System.Collections.Generic;
using System.Linq;

namespace AileMedia.MasterPages
{
    public partial class frm_Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {                
                cmp_Label_UserName.Text = "İstifadəçi:  " + Convert.ToString(Session["vrb_user_name"]);
                cmp_Label_Build.Text = "Build : " + ASCResource.vBuild;
            }
        }
    }
}
