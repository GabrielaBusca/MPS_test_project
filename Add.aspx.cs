using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CompareValidator3.ValueToCompare = DateTime.Now.ToShortDateString();
    }
    protected void Adauga_Click(object sender, EventArgs e)
    {
        if (this.User != null && this.User.Identity.IsAuthenticated)
        {
            string sql = "INSERT INTO [AspNetAnunt] ([titlu],[desc],[user],[idcat],[status],dataexp) VALUES (@titlu,@desc,@user,@cat,@st,@exp)";
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-licentav1-2a6b1562-d107-4018-abaf-b5f96cb38543;AttachDbFilename=|DataDirectory|\aspnet-licentav1-2a6b1562-d107-4018-abaf-b5f96cb38543.mdf;Integrated Security=SSPI");
            con.Open();
            SqlCommand com = new SqlCommand(sql, con);
            string vartitlu = titlu.Text;
            string vardesc = descriere.Text;
            string vardata = data.Text;
            string varcateg = categ.SelectedValue;
            string varvizibilitate = vizib.SelectedValue;
            string varid = HttpContext.Current.User.Identity.GetUserId();
            com.Parameters.AddWithValue("titlu", vartitlu);
            com.Parameters.AddWithValue("desc", vardesc);
            com.Parameters.AddWithValue("exp", vardata);
            com.Parameters.AddWithValue("user", varid);
            com.Parameters.AddWithValue("cat", varcateg);
            com.Parameters.AddWithValue("st", varvizibilitate);
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("First.aspx");
        }
    }
}