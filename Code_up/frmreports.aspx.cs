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
using System.Text;

public partial class frmreports : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            DataBind();
        }
    }
    public void DataBind()
    {
        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["conn"]);
        SqlDataAdapter da = new SqlDataAdapter("select pnrNo from hp_tblbooking where userId='" + Session["UserID"].ToString() + "'", con);
        DataSet ds = new DataSet();
        da.Fill(ds);
        ddlpnrno.DataSource = ds;
        ddlpnrno.DataTextField = "pnrno";
        ddlpnrno.DataValueField = "pnrNo";
        ddlpnrno.DataBind();
        ddlpnrno.Items.Insert(0, "-Select-");
    }
    protected void btngetdetails_Click(object sender, EventArgs e)
    {
        pnldetails.Visible = true;

        SqlConnection con = new SqlConnection(ConfigurationSettings.AppSettings["conn"]);
        SqlDataAdapter da1 = new SqlDataAdapter("select firstname,lastname,gender,age,seatno,address,phone,emailid,frm.cityName,dest.cityName from hp_tblBooking as hb,hp_tblCity as frm,hp_tblCity as dest where dest.cityid=hb.fromcityId and frm.cityId=hb.toCityId and hb.pnrNo='"+ddlpnrno.SelectedItem.Text+"'",con);
        DataSet ds1=new DataSet();
        da1.Fill(ds1);
        lblfirstnamevalue.Text=ds1.Tables[0].Rows[0]["firstName"].ToString();
        lbllastnamevalue.Text = ds1.Tables[0].Rows[0]["lastName"].ToString();
        lblfromcityvalue.Text = ds1.Tables[0].Rows[0][8].ToString();
        lbltocityvalue.Text = ds1.Tables[0].Rows[0][9].ToString();
       lblgendervalue.Text = ds1.Tables[0].Rows[0]["gender"].ToString();
        lblagevalue.Text = ds1.Tables[0].Rows[0]["age"].ToString();
        lblseatnovalue.Text = ds1.Tables[0].Rows[0]["seatno"].ToString();
        lbladdressvalue.Text = ds1.Tables[0].Rows[0]["address"].ToString();
        lblphonenovalue.Text = ds1.Tables[0].Rows[0]["phone"].ToString();
        lblemailidvalue.Text = ds1.Tables[0].Rows[0]["emailid"].ToString();
       
    }
    protected void btnprint_Click(object sender, EventArgs e)
    {
        StringBuilder sb = new StringBuilder();
     
        
    }
}
