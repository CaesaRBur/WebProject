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

public partial class Admin_Default : System.Web.UI.Page
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
           
            Bindcities();
        }

     }

    private void Bindcities()
    {
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

        DataSet ds = objBusinessLogic.getCityList();
        DataTable dt = new DataTable();

        dt = ds.Tables[0];
        pds.DataSource = dt.DefaultView;
        pds.AllowPaging = true;
        pds.PageSize = 15;
        dlCities.DataSource = pds;
        dlCities.DataBind();
    }



    protected void dlCities_UpdateCommand(object source, DataListCommandEventArgs e)
    {

        BusinessLogic.AdminBL objBusinesslogic = new BusinessLogic.AdminBL();
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();

        TextBox txtCityId = (TextBox)e.Item.FindControl("txtCityId");
        TextBox txtCityName = (TextBox)e.Item.FindControl("txtCityName");

        objDataModel._id =Convert.ToInt16( dlCities.DataKeys[e.Item.ItemIndex]);
        objDataModel._cityId = txtCityId.Text.Trim();
        objDataModel._cityName = txtCityName.Text.Trim();

        if (Convert.ToBoolean(objBusinesslogic.UpdateCity(objDataModel)))
        {
            dlCities.EditItemIndex = -1;
            lblErrorMessage.Text = "Updated Succesfully";
            lblErrorMessage.ForeColor = System.Drawing.Color.Green;
            Bindcities();
        }
        else
        {
            lblErrorMessage.Text = "cannot update city";
            lblErrorMessage.ForeColor = System.Drawing.Color.Green;
        }


    }
    protected void dlCities_EditCommand(object source, DataListCommandEventArgs e)
    {
        dlCities.EditItemIndex = e.Item.ItemIndex;
        Bindcities();
    }
    protected void dlCities_CancelCommand(object source, DataListCommandEventArgs e)
    {
        dlCities.EditItemIndex = -1;
        Bindcities();
    }
    protected void btnAddCity_Click(object sender, EventArgs e)
    {
        pnlInsert.Visible = true;
    }
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();

        objDataModel._cityId = txtCityId.Text.Trim();
        objDataModel._cityName = txtCityName.Text.Trim();

        if (Convert.ToBoolean(objBusinessLogic.insertCity(objDataModel)))
        {
            Bindcities();
            lblErrorMessage.Text = "Inserted Succesfully";
            lblErrorMessage.ForeColor = System.Drawing.Color.Green;
            lblErrorMessage.Visible = true;
            txtCityId.Text = "";
            txtCityName.Text = "";
        }
        else
        {
            lblErrorMessage.Text = "Cannot Insert";
            lblErrorMessage.ForeColor = System.Drawing.Color.Red;
            lblErrorMessage.Visible = true;
        }
    }
}
