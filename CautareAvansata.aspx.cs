using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CautareAvansata : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            categ.Items.Insert(0, new ListItem("Toate categoriile", "0"));
            categ.SelectedIndex = 0;
        }
    }
    protected void Adauga_Click(object sender, EventArgs e)
    {
        string url = ResolveClientUrl("~/Cauta");
        if (!String.IsNullOrEmpty(titlu.Text))
        {
            url = url + "?q=" + titlu.Text;
            if (int.Parse(RadioButtonList2.SelectedValue) > 1)
                url = url + "&loc=" + RadioButtonList2.SelectedValue;
            if (int.Parse(RadioButtonList1.SelectedValue) > 1)
                url = url + "&tip=ex";
            if (int.Parse(categ.SelectedValue) > 0)
                url = url + "&cat=" + categ.SelectedValue;
            if (!String.IsNullOrEmpty(data.Text))
                url = url + "&data=" + data.Text + "&mod=" + RadioButtonList3.SelectedValue;
            Response.Redirect(url);
           // Response.Write(categ.SelectedValue);
        }
    }
}