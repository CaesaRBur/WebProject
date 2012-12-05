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

public partial class frmBooking : System.Web.UI.Page
{
   DataTable dtblOnward;
    DataTable dtblReturn;
    protected void Page_Load(object sender, EventArgs e)
    {
        bindOnwardGrid();
        lblTo.Text = Request.QueryString["to"].ToString();
        lblFrom.Text = Request.QueryString["from"].ToString();
        if (Request.QueryString.Count > 3)
        {
            bindReturnGrid();
            lblTo1.Text = Request.QueryString["to"].ToString();
            lblFrom1.Text = Request.QueryString["from"].ToString();
            lblJourneyDate1.Text = Request.QueryString["date"].ToString();
            pnlReturn.Visible = true;
        }
    }
    private void bindOnwardGrid()
    {
        dtblOnward = (DataTable)Session["Seats"];
        dgdSeats.DataSource = dtblOnward;
        dgdSeats.DataBind();
        lblCoachName.Text = dtblOnward.Rows[0]["CoachType"].ToString();
        lblSvcNo.Text = dtblOnward.Rows[0]["Service"].ToString();
        lblMobileNo.Text = dtblOnward.Rows[0]["ContactNumber"].ToString();
        lblEmailId.Text = dtblOnward.Rows[0]["EmailId"].ToString();
        lblDate.Text = dtblOnward.Rows[0]["JourneyDate"].ToString();
    }

    private void bindReturnGrid()
    {
        dtblReturn = (DataTable)Session["SeatsReturn"];
        dgbSeatsReturn.DataSource = dtblReturn;
        dgbSeatsReturn.DataBind();
        lblCoachType1.Text = dtblReturn.Rows[0]["CoachType"].ToString();
        lblSvcNo1.Text = dtblReturn.Rows[0]["Service"].ToString();
        lblMobileNo1.Text = dtblReturn.Rows[0]["ContactNumber"].ToString();
        lblEmailId1.Text = dtblReturn.Rows[0]["EmailId"].ToString();
    }
    protected void btnPrint_Click(object sender, EventArgs e)
    {
        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "window.print();", true);
    }
}

