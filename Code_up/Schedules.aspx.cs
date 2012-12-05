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

public partial class Schedules : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        ScheduleBL objScheduleBL = new ScheduleBL();
        DataSet ds = new DataSet();
        ds = objScheduleBL.RetrieveSchedule();
        GVSchedules.DataSource = ds;
        GVSchedules.DataBind();
    }

    public string GetTime(object time)
    {
        return Convert.ToDateTime(time).TimeOfDay.ToString();
    }
}
