using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Text;
using System.IO;
using System.Linq;
using System.Xml.Linq;
public partial class ImageValidation : System.Web.UI.Page
{
    private Random rnd;
    protected void Page_Load(object sender, EventArgs e)
    {
        int x, y;
        string strValidation = null;
        rnd = new Random();
        Response.ContentType = "image/jpeg";
        Response.Clear();
        Response.BufferOutput = true;
        strValidation = GenerateString();
        Session["strValidation"] = strValidation;
        Font font = new Font("Arial", (float)rnd.Next(17, 20));

        Bitmap bitmap = new Bitmap(200, 50);
        Graphics gr = Graphics.FromImage(bitmap);
        gr.FillRectangle(Brushes.LightGreen, new Rectangle(0, 0, bitmap.Width, bitmap.Height));
        gr.DrawString(strValidation, font, Brushes.Black, (float)rnd.Next(70), (float)rnd.Next(20));
       // gr.DrawLine(new Pen(Color.White), new Point(0, rnd.Next(50)), new Point(200, rnd.Next(50)));
       // gr.DrawLine(new Pen(Color.White), new Point(0, rnd.Next(50)), new Point(200, rnd.Next(50)));
       // gr.DrawLine(new Pen(Color.White), new Point(0, rnd.Next(50)), new Point(200, rnd.Next(50)));
        for (x = 0; x < bitmap.Width; x++)
            for (y = 0; y < bitmap.Height; y++)
                if (rnd.Next(4) == 1)
                    bitmap.SetPixel(x, y, Color.LightGreen);
        font.Dispose();
        gr.Dispose();
        bitmap.Save(Response.OutputStream, ImageFormat.Jpeg);
        bitmap.Dispose();
    }
    private string GenerateString()
    {
        rnd = new Random();
        string validatingText = null;
        for (int a = 0; a < 7; a++)
        {
            char chr = (char)rnd.Next(65, 90);
            validatingText += chr.ToString();
        }
        return validatingText;

    }

}
