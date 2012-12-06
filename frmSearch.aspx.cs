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
using BusinessLogic;

public partial class frmSearch : System.Web.UI.Page
{
    SearchBL bl = new SearchBL();
    DateTime dt1;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillFromCities();
            ddlTo.Items.Insert(0, "Select City");
            fillCoach();
            fillNoOfPassengers();
            txtOnwardDate.Text = DateTime.Today.ToString("yyyy.MM.dd");
            txtReturnDate.Text = DateTime.Today.AddDays(1).ToString("yyyy.MM.dd");
            



        }
    }

    private void fillNoOfPassengers()
    {
        ddlNoOfPassengers.Items.Clear();
        ddlNoOfPassengers.Items.Insert(0, "1");
        ddlNoOfPassengers.Items.Insert(1, "2");
        ddlNoOfPassengers.Items.Insert(2, "3");
        ddlNoOfPassengers.Items.Insert(3, "4");
    }

    private void fillCoach()
    {
        ddlCoachType.Items.Clear();
        DataSet dsCat = new DataSet();
        dsCat = bl.GetCoachDataSet();

        ddlCoachType.DataSource = dsCat;
        ddlCoachType.DataTextField = "coachName";
        ddlCoachType.DataValueField = "coachId";
        ddlCoachType.DataBind();
        ddlCoachType.Items.Insert(0, "--Any--");
    }

    private void fillFromCities()
    {
        ddlFrom.Items.Clear();
        DataSet dsCat = new DataSet();
        dsCat = bl.GetCitiesDataSet();

        ddlFrom.DataSource = dsCat;
        ddlFrom.DataTextField = "cityName";
        ddlFrom.DataValueField = "cityId";
        ddlFrom.DataBind();
        ddlFrom.Items.Insert(0, "Select City");
    }

    private void fillToCities()
    {
        ddlTo.Items.Clear();
        DataSet dsSubCat = new DataSet();
        dsSubCat = bl.GetCitiesDataSet();//ddlFrom.SelectedValue.ToString());

        ddlTo.DataSource = dsSubCat;
        ddlTo.DataTextField = "cityName";
        ddlTo.DataValueField = "cityId";
        ddlTo.DataBind();
        ddlTo.Items.Insert(0, "Select City");
        //int count = ds1.Tables[0].Rows.Count;
        //if (ddlCategories.SelectedItem.ToString() == "Mobiles")
        //{
        //    Accordion3.Visible = true;
        //}
        //else
        //{
        //    Accordion3.Visible = false;
        //}
    }
    protected void ddlFrom_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlFrom.SelectedItem.ToString() != "Select City")
        {
            fillToCities();
        }
    }
    protected void rbtnSingle_CheckedChanged(object sender, EventArgs e)
    {
        if (rbtnSingle.Checked == true)
        {
            txtReturnDate.Enabled = false;
        }
        else
        {
            txtReturnDate.Enabled = true;
        }
    }
    protected void rbtnRound_CheckedChanged(object sender, EventArgs e)
    {
        if (rbtnRound.Checked == true)
        {
            txtReturnDate.Enabled = true;
        }
        else
        {
            txtReturnDate.Enabled = false;
        }
    }
    protected void txtOnwardDate_TextChanged(object sender, EventArgs e)
    {
        try
        {
            if (txtOnwardDate.Text != "")
            {
                DateTime dt = DateTime.Now;
                DateTime dt1 = Convert.ToDateTime(txtOnwardDate.Text);
                if (dt1 <= dt)
                {
                    lblOnward.Text = "Date not valid";
                    lblOnward.Visible = true;
                    txtOnwardDate.Text = "";
                    return;
                }
                else
                {
                    lblOnward.Visible = false;
                }
            }
        }
        catch (Exception ex)
        {
            lblOnward.Text = ex.Message.ToString();
            lblOnward.Visible = true;
            txtOnwardDate.Text = "";
            return;
        }
    }
    protected void txtReturnDate_TextChanged(object sender, EventArgs e)
    {
       /* try
        {
            if (txtReturnDate.Text != "")
            {
                DateTime dt = DateTime.Now;
                DateTime dt1 = Convert.ToDateTime(txtReturnDate.Text);
                if (dt1 <= dt)
                {
                    lblReturn.Text = "Date not valid";
                    lblReturn.Visible = true;
                    txtReturnDate.Text = "";
                    return;
                }
                else
                {
                    lblReturn.Visible = false;
                }
            }
        }
        catch (Exception ex)
        {
            lblReturn.Text = ex.Message.ToString();
            lblReturn.Visible = true;
            txtReturnDate.Text = "";
            return;
        }*/
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        try
        {
            if (ddlFrom.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('Please select the source city');", true);
                ddlFrom.Focus();
                return;
            }
            if (ddlTo.SelectedIndex == 0)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('Please select the destination city');", true);
                ddlTo.Focus();
                return;
            }
            if (txtReturnDate.Enabled == false)
            {
                SearchBL BL = new SearchBL();
                DataSet ds = new DataSet();
                if (ddlCoachType.SelectedIndex == 0)
                {
                    ds = bl.GetServiceDataSet(ddlFrom.SelectedValue.ToString(), ddlTo.SelectedValue.ToString(), Convert.ToDateTime(txtOnwardDate.Text));
                }
                else
                {
                    ds = bl.GetServiceDataSet(ddlFrom.SelectedValue.ToString(), ddlTo.SelectedValue.ToString(), Convert.ToDateTime(txtOnwardDate.Text), Convert.ToInt16(ddlCoachType.SelectedValue.ToString()));
                }
                Session["Service"] = ds;
                //DateTime dd =  Convert.ToDateTime(txtOnwardDate.Text);
                Response.Redirect("~/frmSelectCoach.aspx?from=" + ddlFrom.SelectedItem.Value + "&to=" + ddlTo.SelectedItem.Value + "&date=" + txtOnwardDate.Text + "&seats=" + ddlNoOfPassengers.SelectedValue.ToString());
            }
            else
            {
                SearchBL BL = new SearchBL();
                DataSet ds = new DataSet();
                DataSet dsReturn = new DataSet();
                if (ddlCoachType.SelectedIndex == 0)
                {
                    ds = bl.GetServiceDataSet(ddlFrom.SelectedValue.ToString(), ddlTo.SelectedValue.ToString(), Convert.ToDateTime(txtOnwardDate.Text));
                    dsReturn = bl.GetServiceDataSet(ddlTo.SelectedValue.ToString(), ddlFrom.SelectedValue.ToString(), Convert.ToDateTime(txtReturnDate.Text));
                }
                else
                {
                    ds = bl.GetServiceDataSet(ddlFrom.SelectedValue.ToString(), ddlTo.SelectedValue.ToString(), Convert.ToDateTime(txtOnwardDate.Text), Convert.ToInt16(ddlCoachType.SelectedValue.ToString()));
                    dsReturn = bl.GetServiceDataSet(ddlTo.SelectedValue.ToString(), ddlFrom.SelectedValue.ToString(), Convert.ToDateTime(txtReturnDate.Text), Convert.ToInt16(ddlCoachType.SelectedValue.ToString()));
                }
                Session["Service"] = ds;
                Session["ReturnService"] = dsReturn;
                //DateTime dd =  Convert.ToDateTime(txtOnwardDate.Text);
                Response.Redirect("~/frmSelectCoach.aspx?from=" + ddlFrom.SelectedItem.Value + "&to=" + ddlTo.SelectedItem.Value + "&date=" + txtOnwardDate.Text + "&Returndate=" + txtReturnDate.Text + "&seats=" + ddlNoOfPassengers.SelectedValue.ToString());
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('"+ex.Message.ToString()+"');", true);
        }
    }
    protected void ddlCoachType_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
