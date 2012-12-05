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
using AjaxControlToolkit;

public partial class Admin_frmAddCoached : System.Web.UI.Page
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
            BindCoaches();
        }
    }

    private void BindCoaches()
    {
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

        DataSet ds = objBusinessLogic.getCoachesList();
        DataTable dt = new DataTable();

        dt = ds.Tables[0];
        pds.DataSource = dt.DefaultView;
        pds.AllowPaging = true;
        pds.PageSize = 15;
        dlCoaches.DataSource = pds;
        dlCoaches.DataBind();
    }
 
    
    protected void btnAddCity_Click(object sender, EventArgs e)
    {
        pnlAddCoach.Visible = true;
    }
    //protected void btnAdd_Click(object sender, EventArgs e)
    //{
    //    
    //}
    protected void dlCoaches_EditCommand(object source, DataListCommandEventArgs e)
    {
        dlCoaches.EditItemIndex = e.Item.ItemIndex;
        BindCoaches();
    }
    protected void dlCoaches_UpdateCommand(object source, DataListCommandEventArgs e)
    {
        TextBox txtCoachId = (TextBox)e.Item.FindControl("txtCoachId");
        TextBox txtCoachName = (TextBox)e.Item.FindControl("txtCoachName");
        TextBox txtPerAgent = (TextBox)e.Item.FindControl("txtPerAgent");
        TextBox txtTotalCoaches= (TextBox)e.Item.FindControl("txtTotalNoOnCoaches");

        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

        objDataModel._id =Convert.ToInt16( dlCoaches.DataKeys[e.Item.ItemIndex]);
        objDataModel._coachId = txtCoachId.Text;
        objDataModel._coachName = txtCoachName.Text;
        if (txtPerAgent.Text == "")
            objDataModel._perAgent = 0;
        else
        objDataModel._perAgent = Convert.ToInt16(txtPerAgent.Text);
        if (txtPerAgent.Text == "")
            objDataModel._totalCoaches = 0;
        else
        objDataModel._totalCoaches = Convert.ToInt16(txtTotalCoaches.Text);

        if (Convert.ToBoolean(objBusinessLogic.UpdateCoach(objDataModel)))
        {
            dlCoaches.EditItemIndex = -1;
            lblErrorMessage.Text = "Updated Succesfully";
            lblErrorMessage.ForeColor = System.Drawing.Color.Green;
            lblErrorMessage.Visible = true;
            BindCoaches();

        }
        else
        {
            lblErrorMessage.Text = "Cannot Update Coaches";
            lblErrorMessage.ForeColor = System.Drawing.Color.Red;
            lblErrorMessage.Visible = true;
        }


    }
    protected void dlCoaches_CancelCommand(object source, DataListCommandEventArgs e)
    {
        dlCoaches.EditItemIndex = -1;
        BindCoaches();
    }

    protected void btnAddCoach_Click(object sender, EventArgs e)
    {
        pnlAddCoach.Visible = true;
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

       

            objDataModel._coachId = txtCoachIDFooter.Text.Trim();
            objDataModel._coachName = txtCoachName.Text.Trim();
            objDataModel._perAgent = Convert.ToInt16(txtperAgentFooter.Text.Trim());
            objDataModel._totalCoaches = Convert.ToInt16(txtTotalCoachesFooter.Text.Trim());
            if (Convert.ToBoolean(objBusinessLogic.insertCoach(objDataModel)))
            {
                lblErrorMessage.Visible = true;
                lblErrorMessage.Text = "Inserted Succesfully";
                
                txtCoachIDFooter.Text = "" ;
                txtCoachName.Text="";
                txtperAgentFooter.Text = "";
                txtTotalCoachesFooter.Text = "";
                BindCoaches();

                
            }
            
        
       
    }
}
