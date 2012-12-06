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

public partial class Admin_frmCancellationDetails : System.Web.UI.Page
{
    PagedDataSource pds = new PagedDataSource();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"].ToString() == "")
        {
            Response.Redirect("~\\Admin\\frmHome.aspx");
        }
        if (!IsPostBack)
        {
            BindDDLCoaches();
        }
    }

    private void BindDDLCoaches()
    {
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();


        DataSet ds1 = new DataSet();

        ds1 = objBusinessLogic.ddlCoachList();

        ddlCoaches.DataSource = ds1.Tables[0];
        ddlCoaches.DataTextField = "coachName";
        ddlCoaches.DataValueField = "coachId";
        ddlCoaches.DataBind();
    }
    protected void ddlCoaches_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindCancellationDetails();
    }
    protected void dlCancellationDetails_EditCommand(object source, DataListCommandEventArgs e)
    {
        dlCancellationDetails.EditItemIndex = e.Item.ItemIndex;
        dlCancellationDetails.DataBind();
        bindCancellationDetails();
        

    }
    protected void dlCancellationDetails_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if(e.CommandName.Equals(""))
        {
            
        }
    }
    

    private void bindCancellationDetails()
    {
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

        objDataModel._coachId = ddlCoaches.SelectedValue;

        DataSet ds = objBusinessLogic.getCoachDetails(objDataModel);
       
        dlCancellationDetails.DataSource = ds.Tables[0];
        dlCancellationDetails.DataBind();
    }
    protected void dlCancellationDetails_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

      
        TextBox txtCancel = (TextBox)e.Item.FindControl("txtCancellationPercentage");

        objDataModel._id=Convert.ToInt16( dlCancellationDetails.DataKeys[e.Item.ItemIndex]);
        objDataModel._cancellationPercent =Convert.ToInt16( txtCancel.Text.Trim());

        if (Convert.ToBoolean(objBusinessLogic.updateCancellationDetails(objDataModel)))
        {
            dlCancellationDetails.EditItemIndex = -1;
            dlCancellationDetails.DataBind();
            bindCancellationDetails();
            lblMessage.Text = "Updated Succesfully";
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Visible = true;
        }
        else
        {
            lblMessage.Text = "cannot update cancellation Percent";
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Visible = true;
        }

        

    }
    protected void dlCancellationDetails_CancelCommand(object source, DataListCommandEventArgs e)
    {
        dlCancellationDetails.EditItemIndex = -1;
        dlCancellationDetails.DataBind();
        bindCancellationDetails();
    }
}
