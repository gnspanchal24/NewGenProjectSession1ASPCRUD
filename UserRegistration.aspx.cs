using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace NewGenProjectSession1ASPCRUD
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        string conStr = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con;
        SqlCommand cmd;

        protected void Page_Load(object sender, EventArgs e)
        {
            // 🔥 Prevent unnecessary reload
            if (!IsPostBack)
            {
                GetUserDetails();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            // 🔥 Prevent empty insert
            if (string.IsNullOrWhiteSpace(txtUserName.Text) ||
                string.IsNullOrWhiteSpace(txtAge.Text) ||
                string.IsNullOrWhiteSpace(rblGender.SelectedValue) ||
                string.IsNullOrWhiteSpace(txtMobile.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMessage.Text = "Please fill all fields!";
                lblMessage.CssClass = "error";
                return;
            }

            // 🔥 Get RadioButton value
            string gender = rblGender.SelectedValue;

            using (con = new SqlConnection(conStr))
            {
                con.Open();

                // 🔥 Parameterized query (secure)
                cmd = new SqlCommand("INSERT INTO UserInfo(UserName,Age,Gender,Mobile,Email) VALUES(@UserName,@Age,@Gender,@Mobile,@Email)", con);

                cmd.Parameters.AddWithValue("@UserName", txtUserName.Text);
                cmd.Parameters.AddWithValue("@Age", txtAge.Text);
                cmd.Parameters.AddWithValue("@Gender", gender);
                cmd.Parameters.AddWithValue("@Mobile", txtMobile.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);

                int rowCount = cmd.ExecuteNonQuery();

                if (rowCount > 0)
                {
                    // 🔥 Success message
                    lblMessage.Text = "User Registration Successfully Completed.";
                    lblMessage.CssClass = "success";

                    // 🔥 Prevent duplicate insert on refresh
                    Response.Redirect(Request.RawUrl);
                }
                else
                {
                    lblMessage.Text = "User Registration Failed.";
                    lblMessage.CssClass = "error";
                }
            }
        }

        protected void GetUserDetails()
        {
            using (con = new SqlConnection(conStr))
            {
                con.Open();

                SqlDataAdapter adapter = new SqlDataAdapter(
                    "SELECT ID,UserName,Age,Gender,Mobile,Email FROM UserInfo", con);

                DataTable dt = new DataTable();
                adapter.Fill(dt);

                gvUserInfo.DataSource = dt;
                gvUserInfo.DataBind();
            }
        }

        // 🔥 Reset Button
        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtUserName.Text = "";
            txtAge.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            rblGender.ClearSelection();
            lblMessage.Text = "";
        }
    }
}