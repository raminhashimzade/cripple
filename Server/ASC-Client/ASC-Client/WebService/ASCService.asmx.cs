using ASC_Client.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace ASC_Client.WebService
{
    /// <summary>
    /// Created by Developer
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    public class ASCService : System.Web.Services.WebService
    {

        [WebMethod]
        public string HelloWorld()
        {
            return "Hello World";
        }

        [WebMethod]
        public string DevInfo(String p_dev_inf_json)
        {
            DevInfo d = new DevInfo();
            d.RegisterDevInfo(p_dev_inf_json);
            return "ok";
        }


        [WebMethod]
        public string DevTrack(String p_dev_inf_json)
        {
            DevLocation d = new DevLocation();
            d.location(p_dev_inf_json);
            return "ok";
        }

        [WebMethod]
        public string DevFile(String p_dev_inf_json, String file)
        {
            DevFiles f = new DevFiles();
            f.saveFile(p_dev_inf_json);
            
            byte[] fileBytes = Convert.FromBase64String(file);
            try
            {
                File.WriteAllBytes(System.Web.Hosting.HostingEnvironment.MapPath("~/FileDownload/") + f.fileName, fileBytes);                
            }
            catch (Exception ex)
            {
                GlobalVar.trace(ex.StackTrace);
            }
            return "OK";
        }

        [ScriptMethod(ResponseFormat = ResponseFormat.Json)]
        [WebMethod]        
        public void ServTrack(String p_dev_id)
        {
            DevTracker tr = new DevTracker();
            Context.Response.Clear();
            Context.Response.ContentType = "application/json";
            Context.Response.AddHeader("content-length", tr.selectTrack(p_dev_id).Length.ToString());
            Context.Response.Flush();

            Context.Response.Write(tr.selectTrack(p_dev_id));
        }


    }
}
