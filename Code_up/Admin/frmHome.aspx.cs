using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
public partial class frmHome : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    BusinessLogic.BusinessLogic bal = new BusinessLogic.BusinessLogic();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtUserName.Focus();
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //this.LoginCheckAuthorization(txtUserName.Text, txtPassword.Text);
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["conn"]);
        SqlDataAdapter da = new SqlDataAdapter("Select admin,userId from hp_tblUsers where userName='" + txtUserName.Text + "'and password='" + txtPassword.Text + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            if (Convert.ToBoolean(ds.Tables[0].Rows[0]["admin"].ToString()))
            {                
                Session["type"] = "admin";
                Session["UserID"] = ds.Tables[0].Rows[0]["userId"].ToString();
                Response.Redirect("~\\Admin\\frmAdminHome.aspx");
            }
            else
            {                
                Session["type"] = "agent";
                Session["UserID"] = ds.Tables[0].Rows[0]["userId"].ToString();
                Response.Redirect("~\\frmSearch.aspx");
            }
        }
        else
        {
            Label1.Visible = true;
            Label1.Text = "Invalid Username/password";
        }
    }

    public void LoginCheckAuthorization(string loginId, string password)
    {
        //if (login2(loginId, password))
        //{
        //    string str;
        //    //  Session["member"] = loginId;
        //    ds = bal.Get_Usertype(loginId);
        //    str = ds.Tables[0].Rows[0]["UserType"].ToString();
        //    Session["usertype"] = str;
        //    //Session["CustomerName"] = ds.Tables[0].Rows[0]["FName"].ToString() + ds.Tables[0].Rows[0]["Lname"].ToString();

        //        Session["member"] = ds.Tables[0].Rows[0]["UserName"].ToString();
        //        Session["UserID"] = ds.Tables[0].Rows[0]["userId"].ToString();
        //        //Session["UserName"] = ds.Tables[0].Rows[0]["FirstName"].ToString() + " " + ds.Tables[0].Rows[0]["LastName"].ToString();
        //        Response.Redirect("~/Admin/frmAdminHome.aspx");
        //}
        //else
        //{
        //    //FailureText.Text = "Invalid Memberid / Password";
        //}
        if (txtPassword.Text == "Admin" && txtUserName.Text == "Admin")
        {
            Session["usertype"] = "Admin";
            Session["userId"] = 1;
            Response.Redirect("~/Admin/frmAdminHome.aspx");
        }
        else
        {
            Label1.Text = "Invalid login Id and Password";
            //ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('Invalid LoginId and Password');", true);
        }

    }



    //protected void linklogout_Click(object sender, EventArgs e)
    //{
    //    Session.Clear();
    //    linklogout.Visible = false;

    //}
    public static bool login2(string memberid, string password)
    {
        //string pwd = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "MD5");
        BusinessLogic.BusinessLogic bal = new BusinessLogic.BusinessLogic();
        if (bal.Login_Check_Member(memberid, password))
        {
            return true;
        }
        else
            return false;
    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        
    }
}
