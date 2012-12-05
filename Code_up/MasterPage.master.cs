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

public partial class Admin_MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            pnlLinks.Visible = false;
            pnlLogI.Visible = true;

            if (Session["UserID"] != null && Session["type"] != null)
            {
                if (Session["type"].ToString() == "admin")
                {
                    pnlLinks.Visible = true;
                    ImageButton7.ImageUrl = "~\\Images\\Logout.jpg";
                }
                
            }
             if (Session["UserID"] != null && Session["type"]!= null)
            {
                if(Session["type"].ToString()=="agent")
                {
                pnlLinks.Visible = false;                
                ImageButton3.ImageUrl = "~\\Images\\reports1.jpg";
                ImageButton7.ImageUrl = "~\\Images\\Logout.jpg";
                }
            }
        }
    
    else
{

          if (Session["UserID"] != null && Session["type"] != null)
        {
            if (Session["type"].ToString() == "admin")
            {
                pnlLinks.Visible = true;
                pnlLogI.Visible = false;
            }
        }
         if (Session["UserID"] != null && Session["type"]!=null)
        {
            if (Session["type"].ToString() == "agent")
            {
                pnlLinks.Visible = false;
                pnlLogI.Visible = true;
                ImageButton3.ImageUrl = "~\\Images\\reports1.jpg";
               // ImageButton7.ImageUrl = "~\\Images\\Logout.jpg";
            }
        }
}



        
    }
    protected void ImageButton6_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("frmticketcancelation.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("frmContactUs.aspx");
    }
    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("frmcheckfare.aspx");
    }
    protected void ImageButton5_Click(object sender, ImageClickEventArgs e)
    {
        //Response.Redirect("Schedules.aspx");
    }
    protected void ImageButton3_Click(object sender, ImageClickEventArgs e)
    {
        
        //   if (Session["UserID"] != null && Session["type"] !=null)
        //    {
        //        if(Session["type"].ToString() == "agent")
        //        /*redirect to reports page*/
        //        Response.Redirect("~//frmreports.aspx");
        //        //else if(Session["type"].ToString() == "admin")
        //        //    Response.Redirect("~//frmreports.aspx");
        //        else
        //        {
        //            Response.Redirect("~/frmContactUs.aspx");
        //        }
        //    }
        //    else
        //    {
        //        Response.Redirect("~/frmContactUs.aspx");
        //    }
        ////Response.Redirect("frmContactUs.aspx");
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["usertype"] != null)
        {
            if (Session["usertype"].ToString() == "Admin")
                Response.Redirect("~/Admin/frmAdminHome.aspx");
        }
        else
            Response.Redirect("~/frmSearch.aspx");
    }
    protected void lnkLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("~/Admin/frmHome.aspx");
    }
    protected void ImageButton7_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["UserID"] != null)
        {
            Session.Clear();
            Response.Redirect("~//Admin//frmHome.aspx");
        }
        else {
            Response.Redirect("~//Admin//frmHome.aspx");
        }
    }
}
