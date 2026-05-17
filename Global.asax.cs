using System;
using System.Web;
using System.Web.UI;   // ✅ IMPORTANT
using System.Web.Security;
using System.Web.SessionState;

namespace NewGenProjectSession1ASPCRUD
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery",
                new ScriptResourceDefinition
                {
                    Path = "https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js",
                    DebugPath = "https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.js",
                    CdnSupportsSecureConnection = true
                });
        }
    }
}