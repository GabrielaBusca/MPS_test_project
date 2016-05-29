using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;

public partial class Cauta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Request.Params["q"]))
        {
            string loc="AspNetAnunt.[titlu]";
            string start = "SELECT top 50 AspNetAnunt.id, AspNetAnunt.titlu, AspNetAnunt.[idcat], AspNetAnunt.[desc], AspNetAnunt.data, AspNetProfile.username, AspNetProfile.avatar, AspnetCategorii.denumire FROM AspNetAnunt INNER JOIN AspNetProfile ON AspNetAnunt.[user] = AspNetProfile.user_id INNER JOIN AspNetCategorii ON AspNetAnunt.[idcat] = AspNetCategorii.[id] where ((AspNetAnunt.[user] in (select friend1 as prieten from AspNetPrieteni where friend2 = @id and stare = 2 union select friend2 as prieten from AspNetPrieteni where friend1 = @id and stare = 2) and AspNetAnunt.[status] < 2) or (AspNetAnunt.[status] = 0)) and AspNetAnunt.[data] <= getdate()";
            if (!String.IsNullOrEmpty(Request.Params["loc"]))
                    if(Request.Params["loc"] == "2")
                            loc="AspNetAnunt.[desc]";
                    else
                            loc="AspNetProfile.username";
            start += " and " + loc + " like ";
            if (Request.Params["tip"] == "ex")
                start += "'" + Request.Params["q"] + "'";
            else
                start += "'%" + Request.Params["q"] + "%'";
            if (!String.IsNullOrEmpty(Request.Params["cat"]))
                start += " and AspNetAnunt.[idcat] = '" + Request.Params["cat"] + "'";
            if (!String.IsNullOrEmpty(Request.Params["data"]))
            {
                string t;
                switch (Request.Params["mod"])
                {
                    case "1": t = "="; break;
                    case "2": t = "<"; break;
                    case "3": t = ">"; break;
                    default: t = "="; break;
                }
                start += " and AspNetAnunt.data " + t + " '" + Request.Params["data"] + "'";
            }
            start += " order by data desc";
            SqlDataSource1.SelectCommand = start;
            SqlDataSource1.SelectParameters.Add("id", HttpContext.Current.User.Identity.GetUserId());
            //Response.Write(start);

        }
        else
            Response.Redirect("First");
    }
}