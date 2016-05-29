using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Data.SqlClient;
using System.Collections;
using System.Data;

public partial class Anunturi : System.Web.UI.Page
{

    public int PageNumber
    {
        get
        {
            if (ViewState["PageNumber"] != null)
            {
                return Convert.ToInt32(ViewState["PageNumber"]);
            }
            else
            {
                return 0;
            }
        }
        set { ViewState["PageNumber"] = value; }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.User != null && this.User.Identity.IsAuthenticated)
        {
            SqlDataSource1.SelectCommand = "SELECT top 250 AspNetAnunt.id, AspNetAnunt.titlu, AspNetAnunt.[idcat], AspNetAnunt.[desc], AspNetAnunt.data, AspNetProfile.username, AspNetProfile.avatar, AspnetCategorii.denumire FROM AspNetAnunt INNER JOIN AspNetProfile ON AspNetAnunt.[user] = AspNetProfile.user_id INNER JOIN AspNetCategorii ON AspNetAnunt.[idcat] = AspNetCategorii.[id] where (AspNetAnunt.[user] in (select friend1 as prieten from AspNetPrieteni where friend2 = @id and stare = 2 union select friend2 as prieten from AspNetPrieteni where friend1 = @id and stare = 2) and AspNetAnunt.[status] < 2 and AspNetAnunt.[data] <= getdate()) or (AspNetAnunt.[status] = 0 and AspNetAnunt.[data] <= getdate()) order by data desc";
            SqlDataSource1.SelectParameters.Add("id", HttpContext.Current.User.Identity.GetUserId());
            BindRepeater();
            SqlDataSource1.DataBind();

        }
        else
            Response.Redirect("First");
    }
    
    protected void rptPaging_ItemCommand(object source, System.Web.UI.WebControls.RepeaterCommandEventArgs e)
    {
        PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
        BindRepeater();
    }
    private void BindRepeater()
    {
        //Do your database connection stuff and get your data
        SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Data Source=(LocalDb)\v11.0;Initial Catalog=aspnet-licentav1-2a6b1562-d107-4018-abaf-b5f96cb38543;AttachDbFilename=|DataDirectory|\aspnet-licentav1-2a6b1562-d107-4018-abaf-b5f96cb38543.mdf;Integrated Security=SSPI");
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = cn;
        SqlDataAdapter ad = new SqlDataAdapter(cmd);
        cmd.CommandText = SqlDataSource1.SelectCommand;
        cmd.Parameters.AddWithValue("id", HttpContext.Current.User.Identity.GetUserId());
        //save the result in data table
        DataTable dt = new DataTable();
        ad.SelectCommand = cmd;
        ad.Fill(dt);

        //Create the PagedDataSource that will be used in paging
        PagedDataSource pgitems = new PagedDataSource();
        pgitems.DataSource = dt.DefaultView;
        pgitems.AllowPaging = true;

        //Control page size from here 
        pgitems.PageSize = 25;
        pgitems.CurrentPageIndex = PageNumber;
        if (pgitems.PageCount > 1)
        {
            rptPaging.Visible = true;
            ArrayList pages = new ArrayList();
            for (int i = 0; i <= pgitems.PageCount - 1; i++)
            {
                pages.Add((i + 1).ToString());
            }
            rptPaging.DataSource = pages;
            rptPaging.DataBind();
        }
        else
        {
            rptPaging.Visible = false;
        }

        //Finally, set the datasource of the repeater
        Repeater1.DataSource = pgitems;
        Repeater1.DataSourceID = null;
        Repeater1.DataBind();
    }
}