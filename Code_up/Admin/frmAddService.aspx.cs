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

public partial class Admin_frmAddService : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"].ToString() == "")
        {
            Response.Redirect("~\\Admin\\frmHome.aspx");
        }
       if (!IsPostBack)
        {
            bindDDL();
        }
    }

    private void bindDDL()
    {
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

        DataSet ds = new DataSet();
        DataSet ds1 = new DataSet();
        
        ds = objBusinessLogic.ddlCityList();
        ds1 = objBusinessLogic.ddlCoachList();

        ddlFromCity.DataSource = ds.Tables[0];
        ddlFromCity.DataTextField = "cityName";
        ddlFromCity.DataValueField = "cityId";
        ddlFromCity.DataBind();
        ddlToCity.DataSource = ds.Tables[0];
        ddlToCity.DataTextField = "cityName";
        ddlToCity.DataValueField = "cityId";
        ddlToCity.DataBind();
        ddlCoachType.DataSource = ds1.Tables[0];
        ddlCoachType.DataTextField = "coachName";
        ddlCoachType.DataValueField = "coachId";
        ddlCoachType.DataBind();
        ddlBorStop.DataSource = ds.Tables[0];
        ddlBorStop.DataTextField = "cityName";
        ddlBorStop.DataValueField = "cityId";
        ddlBorStop.DataBind();
        ddlAddServiceStop.DataSource = ds.Tables[0];
        ddlAddServiceStop.DataTextField = "cityName";
        ddlAddServiceStop.DataValueField = "cityId";
        ddlAddServiceStop.DataBind();

    }


    protected void btnBasicInfoSubmit_Click(object sender, EventArgs e)
    {

        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

        objDataModel._serviceNumber = txtServiceNumber.Text.Trim();
        objDataModel._coachId = ddlCoachType.SelectedValue.ToString();
        objDataModel._fromCityId = ddlFromCity.SelectedValue.ToString();
        objDataModel._toCityId = ddlToCity.SelectedValue.ToString();
        objDataModel._departureTime = txtDepartureTime.Text;
        objDataModel._approxJourneyTime = txtApproxJourneyTime.Text;
        objDataModel._numberOfSeats = Convert.ToInt16(txtNumberOfSeats.Text.Trim());
        objDataModel._fare = Convert.ToInt16(txtFare.Text.Trim());

        if (Convert.ToBoolean(objBusinessLogic.insertBasicServiceInfo(objDataModel)))
        {
            //inserted succesfully
            lblBasicInfoMessage.Text = "Inserted Succesfully fill the Boarding Stop info below";
            lblBasicInfoMessage.ForeColor = System.Drawing.Color.Green;

        }
        else
        {
            lblBasicInfoMessage.Text = "cannot Inserted try again";
            lblBasicInfoMessage.ForeColor = System.Drawing.Color.Red;
        }


    }
    protected void btnCheck_Click(object sender, EventArgs e)
    {
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

        objDataModel._serviceNumber = txtServiceNumber.Text.Trim();

        if (Convert.ToInt16(objBusinessLogic.CheckServiceNumber(objDataModel))==1)
        {
            lblSvcNoMessage.Text = "available";
            lblSvcNoMessage.ForeColor = System.Drawing.Color.Green;
        }
        else
        {
            lblSvcNoMessage.Text = "This Service number is in use";
            lblSvcNoMessage.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void btnBoardingStopsInsert_Click(object sender, EventArgs e)
    {
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();


        objDataModel._serviceNumber = txtServiceNumber.Text.Trim();
        objDataModel._fromCityId = ddlBorStop.SelectedValue.ToString();
        objDataModel._boardingStopName = txtBoardingStopName.Text.Trim();
        objDataModel._ArrivalTime = txtArrivalTime.Text.Trim();
       

        if (Convert.ToBoolean(objBusinessLogic.InsertBoardingStopsInfo(objDataModel)))
        {
            lblBordingMessage.Text = "Successful";
            lblBordingMessage.ForeColor = System.Drawing.Color.Green;
            dlBoardingStops.Visible = true;

            BindBordingStopsInfo();
            ClearBordingStopsTextboxes();


        }
        else
        {
            lblBordingMessage.Text = "Failed";
            lblBordingMessage.ForeColor = System.Drawing.Color.Red;
        }




    }
    protected void btnServiceStopInsert_Click(object sender, EventArgs e)
    {

        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

        objDataModel._serviceNumber = txtServiceNumber.Text.Trim();
        objDataModel._fromCityId = ddlAddServiceStop.SelectedValue.ToString();
        objDataModel._departureTime = txtServiceDep.Text.Trim();
        //objDataModel._AppJourneyTimehh = Convert.ToInt16(txtApproxServiceTimehh.Text.Trim());
        //objDataModel._AppJourneyTimemm =Convert.ToInt16(txtApproxServiceTimemm.Text.Trim());
        //objDataModel._fare = Convert.ToInt16(txtSerFare.Text.Trim());

        if (Convert.ToBoolean(objBusinessLogic.InsertServiceStopsInfo(objDataModel)))
        {
            ClearServiceStopsTextboxes();
            lblSerStopMessage.Text = "Succesful";
            lblSerStopMessage.ForeColor = System.Drawing.Color.Red;
            BindServiceStopsInfo();

            dlServiceInfo.Visible = true;


        }
        else
        {
            lblSerStopMessage.Text = "Failed";
            lblSerStopMessage.ForeColor = System.Drawing.Color.Red;
        }


    }

    
   

    private void ClearBordingStopsTextboxes()
    {
        ddlBorStop.SelectedIndex = 0;
        txtBoardingStopName.Text = "";
        txtArrivalTime.Text = "";
        //txtBordingDepTime.Text = "";

    }

    private void ClearServiceStopsTextboxes()
    {
        ddlAddServiceStop.SelectedIndex = 0;
        txtServiceDep.Text = "";
        

    }

    private void BindBordingStopsInfo()
    {
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

        objDataModel._serviceNumber = txtServiceNumber.Text.Trim();


        DataSet ds = objBusinessLogic.getBordingStopInfo(objDataModel);
       
        dlBoardingStops.DataSource = ds.Tables[0];
        dlBoardingStops.DataBind();
    }

    private void BindServiceStopsInfo()
    {
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

        objDataModel._serviceNumber = txtServiceNumber.Text.Trim();


        DataSet ds = objBusinessLogic.getServiceStopInfo(objDataModel);
        //DataTable dt = new DataTable();

        //dt = ds.Tables[0];
        //pds.DataSource = dt.DefaultView;
        //ds.PageSize = 15;
        dlServiceInfo.DataSource = ds.Tables[0];
        dlServiceInfo.DataBind();
    }



    protected void dlBoardingStops_EditCommand(object source, DataListCommandEventArgs e)
    {
        dlBoardingStops.EditItemIndex = e.Item.ItemIndex;
        dlBoardingStops.DataBind();

        BindBordingStopsInfo();

    }
    protected void dlBoardingStops_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if(e.CommandName.Equals("lbtnUpdateBording_click"))
        {
            int id =Convert.ToInt16(dlBoardingStops.DataKeys[e.Item.ItemIndex]);

            DropDownList ddlBorStopEdit = (DropDownList)e.Item.FindControl("ddlBorStopEdit");
            TextBox txtBoardingStop = (TextBox)e.Item.FindControl("txtBoardingStopNameEdit");
            TextBox txtArrival = (TextBox)e.Item.FindControl("txtArrivalTimeEdit");
            


            DataModel.AdminDM objDataModel = new DataModel.AdminDM();
            BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

            objDataModel._id = id;
            objDataModel._fromCityId = ddlBorStopEdit.SelectedValue.ToString();
            objDataModel._boardingStopName = txtBoardingStop.Text.Trim();
            objDataModel._ArrivalTime = txtArrival.Text.Trim();
            

            if (Convert.ToBoolean(objBusinessLogic.UpdateBoardingStopsInfo(objDataModel)))
            {
                dlBoardingStops.EditItemIndex = -1;
                BindBordingStopsInfo();

            }
            

        }
        if (e.CommandName.Equals("lbtnDeleteBording_click"))
        {
            int id = Convert.ToInt16(dlBoardingStops.DataKeys[e.Item.ItemIndex]);
            DataModel.AdminDM objDataModel = new DataModel.AdminDM();
            BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

            objDataModel._id = id;
            if (Convert.ToBoolean(objBusinessLogic.DeleteBoardingStopsInfo(objDataModel)))
            {
                dlBoardingStops.EditItemIndex = -1;
                BindBordingStopsInfo();

            }

        }

        if (e.CommandName.Equals("lbtnCancel_click"))
        {
            dlBoardingStops.EditItemIndex = -1;
            BindBordingStopsInfo();
        }
    }


   

    public DataSet cityDataSet()
    {
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();
        return (objBusinessLogic.ddlCityList());
    }
    protected void dlServiceInfo_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName.Equals("lbtnUpdateService_click"))
        {
           
            DropDownList ddlAddServiceStop = (DropDownList)e.Item.FindControl("ddlAddServiceStopEdit");
            TextBox txtServiceDep = (TextBox)e.Item.FindControl("txtServiceDepEdit");
            
            DataModel.AdminDM objDataModel = new DataModel.AdminDM();
            BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

            objDataModel._id =Convert.ToInt16(Convert.ToInt16(dlServiceInfo.DataKeys[e.Item.ItemIndex]));
            objDataModel._departureTime = txtServiceDep.Text.ToString();
            objDataModel._fromCityId = ddlAddServiceStop.SelectedValue.ToString();

            if (Convert.ToBoolean(objBusinessLogic.UpdateServiceStopsInfo(objDataModel)))
            {
                dlServiceInfo.EditItemIndex = -1;
                dlServiceInfo.DataBind();
                BindServiceStopsInfo();
                
            }


        }
        if (e.CommandName.Equals("lbtnDeleteService_click"))
        {
            int id =Convert.ToInt16(dlServiceInfo.DataKeys[e.Item.ItemIndex]);
            DataModel.AdminDM objDataModel = new DataModel.AdminDM();
            BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();

            objDataModel._id = id;
            if (Convert.ToBoolean(objBusinessLogic.DeleteServiceStopsInfo(objDataModel)))
            {
                dlServiceInfo.EditItemIndex = -1;
                dlServiceInfo.DataBind();
                BindServiceStopsInfo();
            }

        }
        if (e.CommandName.Equals("lbtnCancelService_click"))
        {
            dlServiceInfo.EditItemIndex = -1;
            dlServiceInfo.DataBind();
            BindServiceStopsInfo();
        }
        

    }
    protected void dlServiceInfo_EditCommand(object source, DataListCommandEventArgs e)
    {
        dlServiceInfo.EditItemIndex = e.Item.ItemIndex;
        dlServiceInfo.DataBind();
        BindServiceStopsInfo();

    }
}
