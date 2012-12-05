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

public partial class frmSelectSeatReturn : System.Web.UI.Page
{
   
        DataTable dtbl = new DataTable();
    DataTable dtblSeats;
    DataTable dtblSeatsReturn;
    DataSet ds1;
    SearchBL BL = new SearchBL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //if (Request.QueryString.Count > 4)
            //{
            //    btnSave.Text = "Continue";
            //}
            //else
            //{
            //    btnSave.Text = "Save";
            //}
            bindGrid();
            bindDataTable();
            getBoardingStops();

            DataSet ds = new DataSet();
            ds = BL.GetServiceDataSet(Request.QueryString["sno"].ToString(), Request.QueryString["from"].ToString(), Request.QueryString["to"].ToString());

            getSeats();

            lblService.Text = ds.Tables[0].Rows[0]["fromCity"].ToString() + "-" + ds.Tables[0].Rows[0]["toCity"].ToString();
            lblServiceNumber.Text = ds.Tables[0].Rows[0]["svcNo"].ToString();
            lblCoachType.Text = ds.Tables[0].Rows[0]["CoachName"].ToString();
            lblJourneyDate.Text = Request.QueryString["date"].ToString();
            lblFrom.Text = ds.Tables[0].Rows[0]["fromCity"].ToString();
            lblTo.Text = ds.Tables[0].Rows[0]["toCity"].ToString();
            lblDate.Text = Request.QueryString["date"].ToString();
            Session["fare"] = ds.Tables[0].Rows[0]["fare"].ToString();
        }
    }

    private void getBoardingStops()
    {
        ddlBoardingPoint.Items.Clear();
        DataSet dsCat = new DataSet();
        dsCat = BL.GetBoardingPointDataSet(Request.QueryString["from"].ToString());
        if (dsCat.Tables[0].Rows.Count != 0)
        {
            ddlBoardingPoint.DataSource = dsCat;
            ddlBoardingPoint.DataTextField = "boardingStopName";
            ddlBoardingPoint.DataValueField = "boardingStopName";
            ddlBoardingPoint.DataBind();
            ddlBoardingPoint.Items.Insert(0, "Select Boarding Point");
        }
        else
        {
            ddlBoardingPoint.Items.Insert(0, "Select Boarding Point");
            ddlBoardingPoint.Items.Insert(1, Request.QueryString["from"].ToString());
        }
    }
    private void bindGrid()
    {
        dtbl.Columns.Add(new DataColumn("Title", System.Type.GetType("System.String")));
        dtbl.Columns.Add(new DataColumn("FirstName", System.Type.GetType("System.String")));
        dtbl.Columns.Add(new DataColumn("LastName", System.Type.GetType("System.String")));
        dtbl.Columns.Add(new DataColumn("Age", System.Type.GetType("System.Int32")));
        dtbl.Columns.Add(new DataColumn("ContactNumber", System.Type.GetType("System.String")));
        dtbl.Columns.Add(new DataColumn("BoardingPoint", System.Type.GetType("System.String")));
        dtbl.Columns.Add(new DataColumn("SeatNo", System.Type.GetType("System.String")));
        dtbl.Columns.Add(new DataColumn("TotalFare", System.Type.GetType("System.Decimal")));
        
        dgdItems.DataSource = dtbl;
        //dgdItems.Columns[11].Visible = false;
        dtbl.Columns["SeatNo"].Unique = true;
        dtbl.PrimaryKey = new DataColumn[] { dtbl.Columns["SeatNo"] };
        Session["Total"] = dtbl;
        dgdItems.DataBind();

    }
    protected void img1_Click(object sender, ImageClickEventArgs e)
    {
        if (S1D.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("1D"))
            {
                S1D.ImageUrl = "~/Images/Selected.gif";
            }
            //AddProductToGrid("1D");
        }
        else if (S1D.ImageUrl == "~/Images/Selected.gif")
        {
            S1D.ImageUrl = "~/Images/Available.gif";
            DeleteProducts("1D");
        }
    }
    protected void img2_Click(object sender, ImageClickEventArgs e)
    {
        if (S2D.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("2D"))
            {
                S2D.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S2D.ImageUrl == "~/Images/Selected.gif")
        {
           S2D.ImageUrl = "~/Images/Available.gif";
           DeleteProducts("2D");
        }
    }
    protected void img3_Click(object sender, ImageClickEventArgs e)
    {
        if (S3D.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("3D"))
            {
                S3D.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S3D.ImageUrl == "~/Images/Selected.gif")
        {
            S3D.ImageUrl = "~/Images/Available.gif";
            DeleteProducts("3D");
        }
    }
    protected void img4_Click(object sender, ImageClickEventArgs e)
    {
        if (S4D.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("4D"))
            {
                S4D.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S4D.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("4D");
            S4D.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img5_Click(object sender, ImageClickEventArgs e)
    {
        if (S5D.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("5D"))
            {
                S5D.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S5D.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("5D");
            S5D.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img6_Click(object sender, ImageClickEventArgs e)
    {
        if (S6D.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("6D"))
            {
                S6D.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S6D.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("6D");
            S6D.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img7_Click(object sender, ImageClickEventArgs e)
    {
        if (S7D.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("7D"))
            {
                S7D.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S7D.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("7D");
            S7D.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img8_Click(object sender, ImageClickEventArgs e)
    {
        if (S8D.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("8D"))
            {
                S8D.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S8D.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("8D");
            S8D.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img9_Click(object sender, ImageClickEventArgs e)
    {
        if (S9D.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("9D"))
            {
                S9D.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S9D.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("9D");
            S9D.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img10_Click(object sender, ImageClickEventArgs e)
    {
        if (S10D.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("10D"))
            {
                S10D.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S10D.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("10D");
            S10D.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img11_Click(object sender, ImageClickEventArgs e)
    {
        if (S11D.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("11D"))
            {
                S11D.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S11D.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("11D");
            S11D.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img12_Click(object sender, ImageClickEventArgs e)
    {
        if (S1C.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("1C"))
            {
                S1C.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S1C.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("1C");
            S1C.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img13_Click(object sender, ImageClickEventArgs e)
    {
        if (S2C.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("2C"))
            {
                S2C.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S2C.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("2C");
            S2C.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img14_Click(object sender, ImageClickEventArgs e)
    {
        if (S3C.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("3C"))
            {
                S3C.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S3C.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("3C");
            S3C.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img15_Click(object sender, ImageClickEventArgs e)
    {
        if (S4C.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("4C"))
            {
                S4C.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S4C.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("4C");
            S4C.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img16_Click(object sender, ImageClickEventArgs e)
    {
        if (S5C.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("5C"))
            {
                S5C.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S5C.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("5C");
            S5C.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img17_Click(object sender, ImageClickEventArgs e)
    {
        if (S6C.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("6C"))
            {
                S6C.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S6C.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("6C");
            S6C.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img18_Click(object sender, ImageClickEventArgs e)
    {
        if (S7C.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("7C"))
            {
                S7C.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S7C.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("7C");
            S7C.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img19_Click(object sender, ImageClickEventArgs e)
    {
        if (S8C.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("8C"))
            {
                S8C.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S8C.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("8C");
            S8C.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img20_Click(object sender, ImageClickEventArgs e)
    {
        if (S9C.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("9C"))
            {
                S9C.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S9C.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("9C");
            S9C.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img21_Click(object sender, ImageClickEventArgs e)
    {
        if (S10C.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("10C"))
            {
                S10C.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S10C.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("10C");
            S10C.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img22_Click(object sender, ImageClickEventArgs e)
    {
        if (S11C.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("11C"))
            {
                S11C.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S11C.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("11C");
            S11C.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img23_Click(object sender, ImageClickEventArgs e)
    {
        if (S1B.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("1B"))
            {
                S1B.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S1B.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("1B");
            S1B.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img24_Click(object sender, ImageClickEventArgs e)
    {
        if (S2B.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("2B"))
            {
                S2B.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S2B.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("2B");
            S2B.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img25_Click(object sender, ImageClickEventArgs e)
    {
        if (S3B.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("3B"))
            {
                S3B.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S3B.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("3B");
            S3B.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img26_Click(object sender, ImageClickEventArgs e)
    {
        if (S4B.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("4B"))
            {
                S4B.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S4B.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("4B");
            S4B.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img27_Click(object sender, ImageClickEventArgs e)
    {
        if (S5B.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("5B"))
            {
                S5B.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S5B.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("5B");
            S5B.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img28_Click(object sender, ImageClickEventArgs e)
    {
        if (S6B.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("6B"))
            {
                S6B.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S6B.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("6B");
            S6B.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img29_Click(object sender, ImageClickEventArgs e)
    {
        if (S7B.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("7B"))
            {
                S7B.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S7B.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("7B");
            S7B.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img30_Click(object sender, ImageClickEventArgs e)
    {
        if (S8B.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("8B"))
            {
                S8B.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S8B.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("8B");
            S8B.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img31_Click(object sender, ImageClickEventArgs e)
    {
        if (S9B.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("9B"))
            {
                S9B.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S9B.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("9B");
            S9B.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img32_Click(object sender, ImageClickEventArgs e)
    {
        if (S10B.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("10B"))
            {
                S10B.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S10B.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("10B");
            S10B.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img33_Click(object sender, ImageClickEventArgs e)
    {
        if (S11B.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("11B"))
            {
                S11B.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S11B.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("11B");
            S11B.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img34_Click(object sender, ImageClickEventArgs e)
    {
        if (S1A.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("1A"))
            {
                S1A.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S1A.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("1A");
            S1A.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img35_Click(object sender, ImageClickEventArgs e)
    {
        if (S2A.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("2A"))
            {
                S2A.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S2A.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("2A");
            S2A.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img36_Click(object sender, ImageClickEventArgs e)
    {
        if (S3A.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("3A"))
            {
                S3A.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S3A.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("3A");
            S3A.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img37_Click(object sender, ImageClickEventArgs e)
    {
        if (S4A.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("4A"))
            {
                S4A.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S4A.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("4A");
            S4A.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img38_Click(object sender, ImageClickEventArgs e)
    {
        if (S5A.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("5A"))
            {
                S5A.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S5A.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("5A");
            S5A.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img39_Click(object sender, ImageClickEventArgs e)
    {
        if (S6A.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("6A"))
            {
                S6A.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S6A.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("6A");
            S6A.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img40_Click(object sender, ImageClickEventArgs e)
    {
        if (S7A.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("7A"))
            {
                S7A.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S7A.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("7A");
            S7A.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img41_Click(object sender, ImageClickEventArgs e)
    {
        if (S8A.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("8A"))
            {
                S8A.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S8A.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("8A");
            S8A.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img42_Click(object sender, ImageClickEventArgs e)
    {
        if (S9A.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("9A"))
            {
                S9A.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S9A.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("9A");
            S9A.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img43_Click(object sender, ImageClickEventArgs e)
    {
        if (S10A.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("10A"))
            {
                S10A.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S10A.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("10A");
            S10A.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img44_Click(object sender, ImageClickEventArgs e)
    {
        if (S11A.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("11A"))
            {
                S11A.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S11A.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("11A");
            S11A.ImageUrl = "~/Images/Available.gif";
        }
    }
    protected void img45_Click(object sender, ImageClickEventArgs e)
    {
        if (S11E.ImageUrl == "~/Images/Available.gif")
        {
            if (AddProductToGrid("11E"))
            {
                S11E.ImageUrl = "~/Images/Selected.gif";
            }
        }
        else if (S11E.ImageUrl == "~/Images/Selected.gif")
        {
            DeleteProducts("11E");
            S11E.ImageUrl = "~/Images/Available.gif";
        }
    }

    private bool SaveProductToGrid(string name)
    {
        dtbl = (DataTable)Session["Total"];
        if (dtbl.Rows.Count < 3)
        {
            DataSet dsProducts = new DataSet();
            DataRow drRow;
            try
            {
                //for (int i = 0; i < dsProducts.Tables[0].Rows.Count; i++)
                //{
                //    drRow = dtbl.NewRow();
                //    drRow["ProductID"] = Convert.ToString(dsProducts.Tables[0].Rows[i][0]);
                //    drRow["ProductName"] = dsProducts.Tables[0].Rows[i][1].ToString();
                //    drRow["CaseStock"] = dsProducts.Tables[0].Rows[i][2];
                //    drRow["UnitStock"] = dsProducts.Tables[0].Rows[i][3];
                //    drRow["CaseSize"] = dsProducts.Tables[0].Rows[i][4];	/// Case Size (Total Items in a Case) 
                //    drRow["Price1"] = dsProducts.Tables[0].Rows[i][5];	/// Price1 from Inventory Location Table					
                drRow = dtbl.NewRow();
                drRow["SeatNo"] = name;
                drRow["TotalFare"] = Session["fare"].ToString();
                //DataRow dr = dtbl.Rows.Find(dsProducts.Tables[0].Rows[i][0]);
                //if (dr == null)
                dtbl.Rows.Add(drRow);
                //}
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('"+ex.Message.ToString()+"');", true);
                return false;
            }
            dgdItems.DataSource = dtbl;
            dgdItems.DataBind();
            Session["Total"] = dtbl;
            return true;
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('Sorry..Maximum number of selection 4 only');", true);
            return false;
        }
    }


    private bool AddProductToGrid(string name)
    {
        dtbl = (DataTable)Session["Total"];
        if (dtbl.Rows.Count < 3)
        {
            DataSet dsProducts = new DataSet();
            DataRow drRow;
            try
            {
                //for (int i = 0; i < dsProducts.Tables[0].Rows.Count; i++)
                //{
                //    drRow = dtbl.NewRow();
                //    drRow["ProductID"] = Convert.ToString(dsProducts.Tables[0].Rows[i][0]);
                //    drRow["ProductName"] = dsProducts.Tables[0].Rows[i][1].ToString();
                //    drRow["CaseStock"] = dsProducts.Tables[0].Rows[i][2];
                //    drRow["UnitStock"] = dsProducts.Tables[0].Rows[i][3];
                //    drRow["CaseSize"] = dsProducts.Tables[0].Rows[i][4];	/// Case Size (Total Items in a Case) 
                //    drRow["Price1"] = dsProducts.Tables[0].Rows[i][5];	/// Price1 from Inventory Location Table					
                drRow = dtbl.NewRow();
                drRow["SeatNo"] = name;
                drRow["TotalFare"] = Session["fare"].ToString();
                drRow["BoardingPoint"] = ddlBoardingPoint.SelectedValue.ToString();
                //DataRow dr = dtbl.Rows.Find(dsProducts.Tables[0].Rows[i][0]);
                //if (dr == null)
                dtbl.Rows.Add(drRow);
                //}
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('"+ex.Message.ToString()+"');", true);
                return false;
            }
            dgdItems.DataSource = dtbl;
            dgdItems.DataBind();
            Session["Total"] = dtbl;
            return true;
        }
        else
        {
             ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('Sorry..Maximum number of selection 4 only');", true);
            return false;
        }
    }

    private void DeleteProducts(string name)
    {
        dtbl = (DataTable)Session["Total"];
        //foreach (DataGridItem diItem in dgdItems.Items)
        //{
            //string s = diItem.Cells[6].Text.ToString();
            dtbl.Rows.Remove(dtbl.Rows.Find(name));
        //}
        //dtbl.Rows.Remove(dtbl.Rows.Find(diItem.Cells[6].Text.ToString()));
        Session["Total"] = dtbl;
        dgdItems.DataSource = dtbl;
        dgdItems.DataBind();
    }

    private void bindDataTable()
    {
        dtblSeatsReturn = new DataTable();
        dtblSeatsReturn.Columns.Add(new DataColumn("Service", System.Type.GetType("System.String")));
        dtblSeatsReturn.Columns.Add(new DataColumn("ServiceNumber", System.Type.GetType("System.String")));
        dtblSeatsReturn.Columns.Add(new DataColumn("JourneyDate", System.Type.GetType("System.String")));
        dtblSeatsReturn.Columns.Add(new DataColumn("CoachType", System.Type.GetType("System.String")));
        dtblSeatsReturn.Columns.Add(new DataColumn("Address", System.Type.GetType("System.String")));
        dtblSeatsReturn.Columns.Add(new DataColumn("EmailId", System.Type.GetType("System.String")));
        dtblSeatsReturn.Columns.Add(new DataColumn("PhotoIdProof", System.Type.GetType("System.String")));

        dtblSeatsReturn.Columns.Add(new DataColumn("Title", System.Type.GetType("System.String")));
        dtblSeatsReturn.Columns.Add(new DataColumn("FirstName", System.Type.GetType("System.String")));
        dtblSeatsReturn.Columns.Add(new DataColumn("LastName", System.Type.GetType("System.String")));
        dtblSeatsReturn.Columns.Add(new DataColumn("Age", System.Type.GetType("System.Int32")));
        dtblSeatsReturn.Columns.Add(new DataColumn("ContactNumber", System.Type.GetType("System.String")));
        dtblSeatsReturn.Columns.Add(new DataColumn("BoardingPoint", System.Type.GetType("System.String")));
        dtblSeatsReturn.Columns.Add(new DataColumn("SeatNo", System.Type.GetType("System.String")));
        dtblSeatsReturn.Columns.Add(new DataColumn("TotalFare", System.Type.GetType("System.String")));

        dtblSeatsReturn.Columns["SeatNo"].Unique = true;
        dtblSeatsReturn.PrimaryKey = new DataColumn[] { dtblSeatsReturn.Columns["SeatNo"] };
        Session["SeatsReturn"] = dtblSeatsReturn;
    }

    private void getSeats()
    {
        ds1 = new DataSet();
        string s = Request.QueryString["date"].ToString();
        //DateTime dd=Convert.ToDateTime(s);



        ds1 = BL.GetBookingDataSet(Request.QueryString["sno"].ToString(), Request.QueryString["from"].ToString(), Request.QueryString["to"].ToString(),s );
        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "1D")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S1D.ImageUrl = "~/images/Female.gif"; S1D.Enabled = false; }
                else { S1D.ImageUrl = "~/images/Booked.gif"; S1D.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "2D")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S2D.ImageUrl = "~/images/Female.gif"; S2D.Enabled = false; }
                else { S2D.ImageUrl = "~/images/Booked.gif"; S2D.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "3D")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S3D.ImageUrl = "~/images/Female.gif"; S3D.Enabled = false; }
                else { S3D.ImageUrl = "~/images/Booked.gif"; S3D.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "4D")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S4D.ImageUrl = "~/images/Female.gif"; S4D.Enabled = false; }
                else { S4D.ImageUrl = "~/images/Booked.gif"; S4D.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "5D")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S5D.ImageUrl = "~/images/Female.gif"; S5D.Enabled = false; }
                else { S5D.ImageUrl = "~/images/Booked.gif"; S5D.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "6D")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S6D.ImageUrl = "~/images/Female.gif"; S6D.Enabled = false; }
                else { S6D.ImageUrl = "~/images/Booked.gif"; S6D.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "7D")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S7D.ImageUrl = "~/images/Female.gif"; S7D.Enabled = false; }
                else { S7D.ImageUrl = "~/images/Booked.gif"; S7D.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "8D")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S8D.ImageUrl = "~/images/Female.gif"; S8D.Enabled = false; }
                else { S8D.ImageUrl = "~/images/Booked.gif"; S8D.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "9D")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S9D.ImageUrl = "~/images/Female.gif"; S9D.Enabled = false; }
                else { S9D.ImageUrl = "~/images/Booked.gif"; S9D.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "10D")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S10D.ImageUrl = "~/images/Female.gif"; S10D.Enabled = false; }
                else { S10D.ImageUrl = "~/images/Booked.gif"; S10D.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "11D")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S11D.ImageUrl = "~/images/Female.gif"; S11D.Enabled = false; }
                else { S11D.ImageUrl = "~/images/Booked.gif"; S11D.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "1C")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S1C.ImageUrl = "~/images/Female.gif"; S1C.Enabled = false; }
                else { S1C.ImageUrl = "~/images/Booked.gif"; S1C.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "2C")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S2C.ImageUrl = "~/images/Female.gif"; S2C.Enabled = false; }
                else { S2C.ImageUrl = "~/images/Booked.gif"; S2C.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "3C")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S3C.ImageUrl = "~/images/Female.gif"; S3C.Enabled = false; }
                else { S3C.ImageUrl = "~/images/Booked.gif"; S3C.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "4C")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S4C.ImageUrl = "~/images/Female.gif"; S4C.Enabled = false; }
                else { S4C.ImageUrl = "~/images/Booked.gif"; S4C.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "5C")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S5C.ImageUrl = "~/images/Female.gif"; S5C.Enabled = false; }
                else { S5C.ImageUrl = "~/images/Booked.gif"; S5C.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "6C")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S6C.ImageUrl = "~/images/Female.gif"; S6C.Enabled = false; }
                else { S6C.ImageUrl = "~/images/Booked.gif"; S6C.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "7C")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S7C.ImageUrl = "~/images/Female.gif"; S7C.Enabled = false; }
                else { S7C.ImageUrl = "~/images/Booked.gif"; S7C.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "8C")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S8C.ImageUrl = "~/images/Female.gif"; S8C.Enabled = false; }
                else { S8C.ImageUrl = "~/images/Booked.gif"; S8C.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "9C")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S9C.ImageUrl = "~/images/Female.gif"; S9C.Enabled = false; }
                else { S9C.ImageUrl = "~/images/Booked.gif"; S9C.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "10C")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S10C.ImageUrl = "~/images/Female.gif"; S10C.Enabled = false; }
                else { S10C.ImageUrl = "~/images/Booked.gif"; S10C.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "11C")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S11C.ImageUrl = "~/images/Female.gif"; S11C.Enabled = false; }
                else { S11C.ImageUrl = "~/images/Booked.gif"; S11C.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "1B")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S1B.ImageUrl = "~/images/Female.gif"; S1B.Enabled = false; }
                else { S1B.ImageUrl = "~/images/Booked.gif"; S1B.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "2B")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S2B.ImageUrl = "~/images/Female.gif"; S2B.Enabled = false; }
                else { S2B.ImageUrl = "~/images/Booked.gif"; S2B.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "3B")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S3B.ImageUrl = "~/images/Female.gif"; S3B.Enabled = false; }
                else { S3B.ImageUrl = "~/images/Booked.gif"; S3B.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "4B")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S4B.ImageUrl = "~/images/Female.gif"; S4B.Enabled = false; }
                else { S4B.ImageUrl = "~/images/Booked.gif"; S4B.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "5B")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S5B.ImageUrl = "~/images/Female.gif"; S5B.Enabled = false; }
                else { S5B.ImageUrl = "~/images/Booked.gif"; S5B.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "6B")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S6B.ImageUrl = "~/images/Female.gif"; S6B.Enabled = false; }
                else { S6B.ImageUrl = "~/images/Booked.gif"; S6B.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "7B")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S7B.ImageUrl = "~/images/Female.gif"; S7B.Enabled = false; }
                else { S7B.ImageUrl = "~/images/Booked.gif"; S7B.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "8B")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S8B.ImageUrl = "~/images/Female.gif"; S8B.Enabled = false; }
                else { S8B.ImageUrl = "~/images/Booked.gif"; S8B.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "9B")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S9B.ImageUrl = "~/images/Female.gif"; S9B.Enabled = false; }
                else { S9B.ImageUrl = "~/images/Booked.gif"; S9B.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "10B")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S10B.ImageUrl = "~/images/Female.gif"; S10B.Enabled = false; }
                else { S10B.ImageUrl = "~/images/Booked.gif"; S10B.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "11B")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S11B.ImageUrl = "~/images/Female.gif"; S11B.Enabled = false; }
                else { S11B.ImageUrl = "~/images/Booked.gif"; S11B.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "1A")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S1A.ImageUrl = "~/images/Female.gif"; S1A.Enabled = false; }
                else { S1A.ImageUrl = "~/images/Booked.gif"; S1A.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "2A")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S2A.ImageUrl = "~/images/Female.gif"; S2A.Enabled = false; }
                else { S2A.ImageUrl = "~/images/Booked.gif"; S2A.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "3A")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S3A.ImageUrl = "~/images/Female.gif"; S3A.Enabled = false; }
                else { S3A.ImageUrl = "~/images/Booked.gif"; S3A.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "4A")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S4A.ImageUrl = "~/images/Female.gif"; S4A.Enabled = false; }
                else { S4A.ImageUrl = "~/images/Booked.gif"; S4A.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "5A")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S5A.ImageUrl = "~/images/Female.gif"; S5A.Enabled = false; }
                else { S5A.ImageUrl = "~/images/Booked.gif"; S5A.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "6A")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S6A.ImageUrl = "~/images/Female.gif"; S6A.Enabled = false; }
                else { S6A.ImageUrl = "~/images/Booked.gif"; S6A.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "7A")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S7A.ImageUrl = "~/images/Female.gif"; S7A.Enabled = false; }
                else { S7A.ImageUrl = "~/images/Booked.gif"; S7A.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "8A")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S8A.ImageUrl = "~/images/Female.gif"; S8A.Enabled = false; }
                else { S8A.ImageUrl = "~/images/Booked.gif"; S8A.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "9A")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S9A.ImageUrl = "~/images/Female.gif"; S9A.Enabled = false; }
                else { S9A.ImageUrl = "~/images/Booked.gif"; S9A.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "10A")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S10A.ImageUrl = "~/images/Female.gif"; S10A.Enabled = false; }
                else { S10A.ImageUrl = "~/images/Booked.gif"; S10A.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "11A")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S11A.ImageUrl = "~/images/Female.gif"; S11A.Enabled = false; }
                else { S11A.ImageUrl = "~/images/Booked.gif"; S11A.Enabled = false; }
            }
            else if (ds1.Tables[0].Rows[i]["seatNo"].ToString() == "11E")
            {
                if (ds1.Tables[0].Rows[i]["gender"].ToString() == "F") { S11E.ImageUrl = "~/images/Female.gif"; S11E.Enabled = false; }
                else { S11E.ImageUrl = "~/images/Booked.gif"; S11E.Enabled = false; }
            }

        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ddlPhotoidProof.SelectedIndex == 0)
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('Please select ID proof');", true);
            return;
        }
        int intBookingId;
        DataSet ds = new DataSet();
        ds = BL.GetMaxBookingIdDataSet();
        if (ds.Tables[0].Rows.Count == 0)
        {
            intBookingId = 1;
        }
        else
        {
            intBookingId = Convert.ToInt16(ds.Tables[0].Rows[0]["bookingId"].ToString()) + 1;
        }
        try
        {
            #region Onward Journey ticket details

            dtblSeats = (DataTable)Session["Seats"];
            if (dtblSeats.Rows.Count > 0)
            {
                DataModel.BookingDE DE1 = new DataModel.BookingDE();
                for (int i = 0; i < dtblSeats.Rows.Count; i++)
                {
                    DE1.ServiceId = dtblSeats.Rows[i]["ServiceNumber"].ToString();
                    DE1.journeyDate = Convert.ToDateTime(dtblSeats.Rows[i]["JourneyDate"].ToString());
                    DE1.fromCityId = Request.QueryString["to"].ToString();
                    DE1.toCityId = Request.QueryString["from"].ToString();
                    DE1.Address = dtblSeats.Rows[i]["Address"].ToString();
                    DE1.EmailId1 = dtblSeats.Rows[i]["EmailId"].ToString();
                    if (dtblSeats.Rows[i]["Title"].ToString() == "Mr")
                    {
                        DE1.Gender = 'M';
                    }
                    else
                    {
                        DE1.Gender = 'F';
                    }
                    DE1.firstName = dtblSeats.Rows[i]["FirstName"].ToString();
                    DE1.lastName = dtblSeats.Rows[i]["LastName"].ToString();
                    DE1.age = Convert.ToInt16(dtblSeats.Rows[i]["Age"].ToString());
                    DE1.Phone1 = dtblSeats.Rows[i]["ContactNumber"].ToString();
                    DE1.boardingPoint = dtblSeats.Rows[i]["BoardingPoint"].ToString();
                    DE1.PhotoIdProof = dtblSeats.Rows[i]["PhotoIdProof"].ToString();
                    DE1.seatNo = dtblSeats.Rows[i]["SeatNo"].ToString();
                    DE1.fare = Convert.ToInt16(dtblSeats.Rows[i]["TotalFare"].ToString());
                    BusinessLogic.SearchBL Bl = new BusinessLogic.SearchBL();
                    if (Session.Contents["UserId"] == null)
                    {
                        Session["UserId"] = "0";
                    }
                    int j = BL.insertBookingDetails(DE1, intBookingId, Session["UserId"].ToString());
                    if (j == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('Data not inserted');", true);
                        return;
                    }
                }
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('Please select one seat');", true);
            }
            #endregion

            #region Return Journey Tickets

            DataModel.BookingDE DE = new DataModel.BookingDE();
            dtblSeatsReturn = (DataTable)Session["SeatsReturn"];
            foreach (DataGridItem diItem in dgdItems.Items)
            {
                DataRow drRow1;
                //DataModel.BookingDE DE = new DataModel.BookingDE();
                TextBox txtFirstName = (TextBox)diItem.FindControl("txtFirstName");
                TextBox txtLastName = (TextBox)diItem.FindControl("txtLastName");
                TextBox txtAge = (TextBox)diItem.FindControl("txtAge");
                TextBox txtContactNumber = (TextBox)diItem.FindControl("txtContactNumber");
                TextBox txtBoardingPoint = (TextBox)diItem.FindControl("txtBoardingPoint");
                DropDownList ddlTitle = (DropDownList)diItem.FindControl("ddlTitle");
                string strSeatNumber = diItem.Cells[6].Text;
                string strTotalFare = diItem.Cells[7].Text;

                //DE.firstName = txtFirstName.Text;
                //DE.lastName = txtLastName.Text;
                //DE.age = Convert.ToInt16(txtAge.Text);
                //DE.Phone1 = txtContactNumber.Text;
                //DE.seatNo = strSeatNumber;
                //DE.fare = Convert.ToInt16(strTotalFare);


                drRow1 = dtblSeatsReturn.NewRow();
                drRow1["Service"] = lblService.Text;
                drRow1["ServiceNumber"] = lblServiceNumber.Text;
                drRow1["JourneyDate"] = lblJourneyDate.Text;
                drRow1["CoachType"] = lblCoachType.Text;
                drRow1["Address"] = txtAddress.Text;
                drRow1["EmailId"] = txtEmailId.Text;
                drRow1["PhotoIdProof"] = ddlPhotoidProof.SelectedValue;
                drRow1["Title"] = ddlTitle.SelectedValue;
                drRow1["FirstName"] = txtFirstName.Text;
                drRow1["LastName"] = txtLastName.Text;
                drRow1["Age"] = txtAge.Text;
                drRow1["ContactNumber"] = txtContactNumber.Text;
                drRow1["BoardingPoint"] = ddlBoardingPoint.SelectedItem.Value;
                drRow1["SeatNo"] = strSeatNumber;
                drRow1["TotalFare"] = strTotalFare;

                dtblSeatsReturn.Rows.Add(drRow1);
            }
            Session["SeatsReturn"] = dtblSeatsReturn;

            //DataSet ds = new DataSet();
            //ds.Tables[0] = dtblSeats;
            if (dtblSeatsReturn.Rows.Count > 0)
            {
                for (int i = 0; i < dtblSeatsReturn.Rows.Count; i++)
                {
                    DE.ServiceId = dtblSeatsReturn.Rows[i]["ServiceNumber"].ToString();
                    DE.journeyDate = Convert.ToDateTime(Request.QueryString["date"].ToString());
                    DE.fromCityId = Request.QueryString["from"].ToString();
                    DE.toCityId = Request.QueryString["to"].ToString();
                    DE.Address = dtblSeatsReturn.Rows[i]["Address"].ToString();
                    DE.EmailId1 = dtblSeatsReturn.Rows[i]["EmailId"].ToString();
                    if (dtblSeatsReturn.Rows[i]["Title"].ToString() == "Mr")
                    {
                        DE.Gender = 'M';
                    }
                    else
                    {
                        DE.Gender = 'F';
                    }
                    DE.firstName = dtblSeatsReturn.Rows[i]["FirstName"].ToString();
                    DE.lastName = dtblSeatsReturn.Rows[i]["LastName"].ToString();
                    DE.age = Convert.ToInt16(dtblSeatsReturn.Rows[i]["Age"].ToString());
                    DE.Phone1 = dtblSeatsReturn.Rows[i]["ContactNumber"].ToString();
                    DE.boardingPoint = dtblSeatsReturn.Rows[i]["BoardingPoint"].ToString();
                    DE.PhotoIdProof = dtblSeatsReturn.Rows[i]["PhotoIdProof"].ToString();
                    DE.seatNo = dtblSeatsReturn.Rows[i]["SeatNo"].ToString();
                    DE.fare = Convert.ToInt16(dtblSeatsReturn.Rows[i]["TotalFare"].ToString());
                    BusinessLogic.SearchBL Bl = new BusinessLogic.SearchBL();
                    if (Session.Contents["UserId"] == null)
                    {
                        Session["UserId"] = "0";
                    }
                    int j = BL.insertBookingDetails(DE, intBookingId, Session["UserId"].ToString());
                    if (j == 0)
                    {
                        ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('Data not inserted');", true);
                        return;
                    }
                }
                Response.Redirect("~/frmBooking.aspx?from=" + lblTo.Text + "&to=" + lblFrom.Text + "&date=" + Request.QueryString["date"].ToString() + "&returndate=1");
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('Please select one seat');", true);
            }
            #endregion
        }
        catch(Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(UpdatePanel1, UpdatePanel1.GetType(), "AnyScriptNameYouLike", "alert('"+ex.Message.ToString()+"');", true);
        }
    }

   
}
