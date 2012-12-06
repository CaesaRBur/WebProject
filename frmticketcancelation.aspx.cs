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
using DataAccess;
using DataModel;

public partial class frmticketcancelation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        panel.Visible = true;
        ticketcancellationDM objticketcancellationDM = new ticketcancellationDM();
        DataSet ds = new DataSet();
        
       
            objticketcancellationDM.Pnrno = txtPnrno.Text;
            objticketcancellationDM.Firstname = txtFirstname.Text;
            objticketcancellationDM.Lastname = txtLastname.Text;
            objticketcancellationDM.Journeydate = txtDOJ.Text;
            DateTime dt;
            dt = DateTime.Now;
            DateTime dt1;
            dt1 = Convert.ToDateTime(txtDOJ.Text);
            if (dt < dt1)
            {
            ticketcancellationBL objticketcancellationBL = new ticketcancellationBL();
            ds = objticketcancellationBL.TicketDetails(objticketcancellationDM);
            if (ds.Tables[0].Rows.Count == 0)
            {
                lblTicket.Text = "Ticket Already Cancelled";

            }
            else
            {
                gvTicketcancellationdetails.DataSource = ds;
                gvTicketcancellationdetails.DataBind();
                btnCancelyourticket.Visible = true;
            }
        }
        else 
        {
            lblTicket.Text = "Date Not Valid";
        }
    }
    protected void btnCancelyourticket_Click(object sender, EventArgs e)
    {

        ticketcancellationDM objticketcancellationDM = new ticketcancellationDM();
        ticketcancellationBL objticketcancellationBL = new ticketcancellationBL();
        objticketcancellationDM.Pnrno = txtPnrno.Text;
        int i = objticketcancellationBL.CancelTicket(objticketcancellationDM);
        if (i == 1)
            lblTicket.Text = "Ticket Cancelled Successfully";
    }
}
