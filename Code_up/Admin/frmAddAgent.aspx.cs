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
 


public partial class Admin_frmAddAgent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"].ToString() == "")
        {
            Response.Redirect("~\\Admin\\frmHome.aspx");
        }

    }

    protected void btnFinish_Click(object sender, EventArgs e)
    {
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        string UserId1=GenAgentId();
        objDataModel.userId = UserId1;
        objDataModel._userName = txtUserName.Text.Trim();
        objDataModel._password = txtPassword.Text.Trim();
        objDataModel._name = txtName.Text.Trim();
        objDataModel._eMailId = txtEmail.Text.Trim();
        objDataModel._mobile = long.Parse(txtMobileNo.Text.Trim());
        if (rbtnMale.Checked)
        {
            objDataModel._gender = rbtnMale.Text;
        }
        else
        {
            objDataModel._gender = rbtnFemale.Text;
        }
        objDataModel._officeName = txtOfficeName.Text.Trim();
        objDataModel._officeAddress = txtAddress.Text.Trim();
        if (txtLandLine.Text.Trim() == string.Empty)
            objDataModel._officeLandLine = 0;
        else
        objDataModel._officeLandLine =long.Parse( txtLandLine.Text.Trim());
        objDataModel._city=txtCity.Text.Trim();
        if (txtOfficeMobile.Text.Trim() == string.Empty)
            objDataModel._mobile = 0;
        else
            objDataModel._mobile = long.Parse(txtOfficeMobile.Text.Trim());
        objDataModel._state = ddlState.SelectedItem.ToString();
        if (Convert.ToBoolean(objBusinessLogic.insertAgent(objDataModel)))
        {
            lblMessage.Text = "Registration succesful";
            lblMessage.ForeColor = System.Drawing.Color.Green;

        }
        else
        {

            lblMessage.Text = "Registration unsuccesful";
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }




    }



    public string GenAgentId()
    {
        string userid;

        Random ran = new Random();
        int num = ran.Next(100000);

        userid = "agn" + num.ToString();

        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        objDataModel._userId = userid;

        if (objBusinessLogic.CheckUserId(objDataModel) == 0)
        {
            GenAgentId();
        }

        return userid;

    }
    protected void btnCheckAvaliblity_Click(object sender, EventArgs e)
    {
        BusinessLogic.AdminBL objBusinessLogic = new BusinessLogic.AdminBL();
        DataModel.AdminDM objDataModel = new DataModel.AdminDM();
        if (txtUserName.Text.Trim() != "")
        {
            objDataModel._userName = txtUserName.Text.Trim();
            if (Convert.ToBoolean(objBusinessLogic.CheckUserName(objDataModel)))
            {
                lblAvailable.Text = "Congratulations UserName available";
                lblAvailable.ForeColor = System.Drawing.Color.Green;
                btnFinish.Visible = true;
            }
            else
            {
                lblAvailable.Text = "Sorry UserName not available please try another one";
                lblAvailable.ForeColor = System.Drawing.Color.Red;
            }
        }
        else
        {
            lblAvailable.Text = "please enter a valid username";
            lblAvailable.ForeColor = System.Drawing.Color.Red;
        }



        

    }
}
