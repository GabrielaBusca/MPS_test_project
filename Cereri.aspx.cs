using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using System.Web.Security;

public partial class Cereri : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.User != null && this.User.Identity.IsAuthenticated)
            SqlDataSource1.SelectCommand = "SELECT AspNetProfile.nume, AspNetProfile.avatar, AspNetProfile.username, AspNetPrieteni.data FROM AspNetPrieteni INNER JOIN AspNetProfile ON AspNetPrieteni.friend1 = AspNetProfile.user_id where friend2 = '" + HttpContext.Current.User.Identity.GetUserId() + "' and stare = 1";
    }
}