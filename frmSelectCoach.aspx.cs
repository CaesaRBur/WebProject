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

public partial class frmSelectCoach : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            try
            {
                lblFrom.Text = Request.QueryString["from"].ToString();
                lblTo.Text = Request.QueryString["to"].ToString();
                lblJourneyDate.Text = Request.QueryString["date"].ToString();
                DataSet ds = new DataSet();
                ds = (DataSet)Session["Service"];
                if (ds.Tables[0].Rows.Count != 0)
                {
                    gvSelectCoach.DataSource = ds.Tables[0];
                    gvSelectCoach.DataBind();
                }
                else
                {
                    pnlNo1.Visible = true;
                    btnContinue.Visible = false;
                }
                if (Request.QueryString.Count == 5)
                {
                    pnlReturn.Visible = true;
                    lblReturnFrom.Text = Request.QueryString["to"].ToString();
                    lblReturnTo.Text = Request.QueryString["from"].ToString();
                    lblReturnJourneyDate.Text = Request.QueryString["Returndate"].ToString();
                    DataSet dsReturn = new DataSet();
                    dsReturn = (DataSet)Session["ReturnService"];
                    if (dsReturn.Tables[0].Rows.Count != 0)
                    {
                        gvSelectReturnCoach.DataSource = dsReturn.Tables[0];
                        gvSelectReturnCoach.DataBind();
                    }
                    else
                    {
                        pnlNo.Visible = true;
                        btnContinue.Visible = false;
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('" + ex.Message.ToString() + "');", true);
            }
        }

    }
    protected void btnContinue_Click(object sender, EventArgs e)
    {
        string strServiceNo = Convert.ToString(Request.Form["optCategoryID"]);
        string strReturnServiceNo = Convert.ToString(Request.Form["optReturnCategoryID"]);
        if (strServiceNo != null && strReturnServiceNo != null)
        {
            Response.Redirect("~/frmSelectSeat.aspx?sno=" + strServiceNo + "&returnsno=" + strReturnServiceNo + "&date=" + Request.QueryString["date"].ToString() + "&returndate=" + Request.QueryString["Returndate"].ToString() + "&from=" + Request.QueryString["from"].ToString() + "&to=" + Request.QueryString["to"].ToString() + "&seats=" + Request.QueryString["seats"].ToString());
        }
        if (strServiceNo != null)
        {
            Response.Redirect("~/frmSelectSeat.aspx?sno=" + strServiceNo + "&date=" + Request.QueryString["date"].ToString() + "&from=" + Request.QueryString["from"].ToString() + "&to=" + Request.QueryString["to"].ToString() + "&seats=" + Request.QueryString["seats"].ToString());
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('Please select one service');", true);
        }
    }
}
