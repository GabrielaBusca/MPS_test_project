using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class EditareAnunt : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Request.Params["id"]))
        {
            if(!Page.IsPostBack)
            {
                bool bun = false;
                if (this.User.IsInRole("admin"))
                    bun = true;
                string sql2 = "select * from AspNetAnunt where id = @id";
                SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-licentav1-2a6b1562-d107-4018-abaf-b5f96cb38543;AttachDbFilename=|DataDirectory|\aspnet-licentav1-2a6b1562-d107-4018-abaf-b5f96cb38543.mdf;Integrated Security=SSPI");
                con.Open();
                SqlCommand com = new SqlCommand(sql2, con);
                com.Parameters.AddWithValue("id", Request.Params["id"]);
                SqlDataReader r = com.ExecuteReader();
                while (r.Read())
                    {
                        if (r["user"].ToString().Equals(HttpContext.Current.User.Identity.GetUserId()))
                            bun = true;
                        if(bun)
                        {
                            titlu.Text = r["titlu"].ToString();
                            descriere.Text = r["desc"].ToString();
                            categ.SelectedValue = r["idcat"].ToString();
                            vizib.SelectedValue = r["status"].ToString();
                        }
                    }
                con.Close();
        
                if (!bun)
                    Response.Redirect("~/First");
            }
        }
        else
             Response.Redirect("~/First");
    }
    protected void Adauga_Click(object sender, EventArgs e)
    {
        if (this.User != null && this.User.Identity.IsAuthenticated && (!String.IsNullOrEmpty(Request.Params["id"])))
        {
            string sql = "UPDATE [AspNetAnunt] set [titlu] = @titlu, [desc] = @desc, [idcat] = @cat, [status] = @st where id = @id";
            SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-licentav1-2a6b1562-d107-4018-abaf-b5f96cb38543;AttachDbFilename=|DataDirectory|\aspnet-licentav1-2a6b1562-d107-4018-abaf-b5f96cb38543.mdf;Integrated Security=SSPI");
            con.Open();
            SqlCommand com = new SqlCommand(sql, con);
            string vartitlu = titlu.Text;
            string vardesc = descriere.Text;
            string varcateg = categ.SelectedValue;
            string varvizibilitate = vizib.SelectedValue;
            com.Parameters.AddWithValue("id", Request.Params["id"]);
            com.Parameters.AddWithValue("titlu", vartitlu);
            com.Parameters.AddWithValue("desc", vardesc);
            com.Parameters.AddWithValue("cat", varcateg);
            com.Parameters.AddWithValue("st", varvizibilitate);
            com.ExecuteNonQuery();
            con.Close();
            Response.Redirect("First.aspx");
        }
    }
}