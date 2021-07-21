using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace ASC_Client
{
    public static class GlobalVar
    {
        public static class User
        {
            public static int userID { get; set; }
            public static string userNAME { get; set; }
            public static string userPSW { get; set; }
        }

        public static string ConnectionString ()
        {
            if (System.Environment.MachineName == "RAMINPC")
                return "server=192.168.2.100;user=admin;database=asc;port=3306;password=123456;Max Pool Size=1000";
            else
                return "server=localhost;user=admin;database=asc;port=3306;password=123456;Max Pool Size=1000";
        }        

        public static void trace(string logMessage)
        {
            var strLogMessage = string.Empty;
            var strLogFile = string.Format("{0}{1}.log", HttpContext.Current.Server.MapPath("~/App_Data/"), "applog");
            StreamWriter swLog;

            strLogMessage = string.Format("{0}--> {1}--> {2}...... {3}", DateTime.Now, "trace", HttpContext.Current.Request.RawUrl, logMessage);

            if (!File.Exists(strLogFile))
                swLog = new StreamWriter(strLogFile);
            else
                swLog = File.AppendText(strLogFile);
            swLog.WriteLine(strLogMessage);
            swLog.WriteLine();

            swLog.Close();
        }

    }
}