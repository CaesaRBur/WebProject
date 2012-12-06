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
using BussinessLogic;
using DataModel;
using DataAccess;
using System.Data.SqlClient;

public partial class frmcheckfare : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            SqlConnection cn = new SqlConnection(ConfigurationSettings.AppSettings["conn"]);

            SqlDataAdapter da = new SqlDataAdapter("select id,cityId,cityName from hp_tblCity where cityId in( select distinct fromCityId from hp_tblServices where status='True')", cn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            ddlSource.DataSource = ds.Tables[0];
            ddlSource.DataTextField = "cityName";
            ddlSource.DataValueField = "cityId";
            ddlSource.DataBind();
            ddlSource.Items.Insert(0, "-Select-");

            

            SqlDataAdapter da2 = new SqlDataAdapter("select distinct coachName, hp_tblCoach.coachId from hp_tblCoach, hp_tblServices where hp_tblServices.coachId=hp_tblCoach.coachId", cn);
            DataSet ds2 = new DataSet();
            da2.Fill(ds2);
            ddlcoach.DataSource = ds2.Tables[0];
            ddlcoach.DataTextField = "coachName";
            ddlcoach.DataValueField = "coachId";
            ddlcoach.DataBind();
            ddlcoach.Items.Insert(0, "-Select-");

        }
    }
    protected void btnSearch_Click1(object sender, EventArgs e)
    {
        panelCheckfaredetails.Visible = true;
        lblSource.Text = ddlSource.SelectedItem.Text;
        lblDestination.Text = ddlDestination.SelectedItem.Text;
        checkfareDM objcheckfareDM = new checkfareDM();
        checkfareBL objcheckfareBL = new checkfareBL();
        objcheckfareDM.Fromcityname = ddlSource.SelectedItem.Text;
        objcheckfareDM.Tocityname = ddlDestination.SelectedItem.Text;
        objcheckfareDM.Coachid =Convert.ToInt16(ddlcoach.SelectedValue);
        DataSet ds = new DataSet();
              ds = objcheckfareBL.CheckFare(objcheckfareDM);
              if (ds.Tables[0].Rows.Count > 0)
              {
                  gvCheckfaredetails.DataSource = ds;
                  gvCheckfaredetails.DataBind();
              }
              else
              {
                  gvCheckfaredetails.Visible = false;
                  lblErrorMsg.Visible = true;
                  lblErrorMsg.Text = "No Data Found";
              }
        ////lblJourneydate.Text = txtJourneydate.Text;
        //if (txtJourneydate.Text != null)
        //{
        //    DateTime dt = DateTime.Now;
        //    DateTime dt1 = Convert.ToDateTime(txtJourneydate.Text);

        //    if (dt1 < dt)
        //    {
        //        lblDatenotvalid.Visible = true;
        //        panelCheckfaredetails.Visible = false;
        //    }
        //    else
        //    {
        //        lblDatenotvalid.Visible = false;
        //        panelCheckfaredetails.Visible = true;
        //        checkfareDM objcheckfareDM = new checkfareDM();
        //        objcheckfareDM.Fromcityname = ddlSource.SelectedItem.Text;
        //        objcheckfareDM.Tocityname = ddlDestination.SelectedItem.Text;
        //        checkfareBL objcheckfareBL = new checkfareBL();
        //        DataSet ds = new DataSet();
        //        ds = objcheckfareBL.CheckFare(objcheckfareDM);
        //        gvCheckfaredetails.DataSource = ds;
        //        gvCheckfaredetails.DataBind();

        //    }
        
    }
    protected void ddlSource_SelectedIndexChanged(object sender, EventArgs e)
    {
        SqlConnection cn = new SqlConnection(ConfigurationSettings.AppSettings["conn"]);
        SqlDataAdapter da1 = new SqlDataAdapter("select id,cityId,cityName from hp_tblCity where cityId in( select distinct toCityId from hp_tblServices where fromCityId='" + ddlSource.SelectedValue.ToString() + "' and status='True')", cn);
        DataSet ds1 = new DataSet();
        da1.Fill(ds1);
        ddlDestination.DataSource = ds1.Tables[0];
        ddlDestination.DataTextField = "cityName";
        ddlDestination.DataValueField = "cityId";
        ddlDestination.DataBind();
        ddlDestination.Items.Insert(0, "-Select-");
    }
}

