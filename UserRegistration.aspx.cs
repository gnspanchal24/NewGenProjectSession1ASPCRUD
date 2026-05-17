using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace NewGenProjectSession1ASPCRUD
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;
        protected void Page_Load(object sender, EventArgs e)
        {
            GetUserDetails();
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using(con=new SqlConnection(conStr))
            {
                con.Open();                
                cmd = new SqlCommand("INSERT INTO UserInfo(UserName,Age,Gender,Mobile,Email) VALUES('" + txtUserName.Text + "','" + txtAge.Text + "','" + txtGender.Text + "','" + txtMobile.Text + "','" + txtEmail.Text + "')",con);                
                int rodwCount=cmd.ExecuteNonQuery();
                if (rodwCount > 0) {
                    lblMessage.Text = "User Registration Successfully Completed.";
                    lblMessage.ForeColor=System.Drawing.Color.Green;
                }
                else
                {
                    lblMessage.Text = "User Registration Failed.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void GetUserDetails()
        {
            using (con = new SqlConnection(conStr))
            {
                con.Open();
                SqlDataAdapter adapter = new SqlDataAdapter("SELECT ID,UserName,Age,Gender,Mobile,Email FROM UserInfo", con);
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                gvUserInfo.DataSource = dt;
                gvUserInfo.DataBind();
            }
        }
    }
}