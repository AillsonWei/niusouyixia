using StockWebApp.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockWebApp
{
    public partial class SearchResult : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StName"] != null)
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
            else
            {
                Panel1.Visible = false;
                Panel2.Visible = true;
            }
        }

        protected void BTNSearch_Click(object sender, EventArgs e)
        {
            btnsearch(TXTSearch.Text);
        }
        //搜索
        protected void btnsearch(string input)
        {
            //判断选择搜索类型
            Session["StName"] = input;
            Search srn = new Search();
            bool bln = srn.SearchStName(Session["StName"].ToString());
            if (bln)
            {
                Response.Redirect("SearchResult.aspx");
            }
            else
            {
                Session["StName"] = null;
                Session["StCode"] = input;
                Search src = new Search();
                bool blc = src.SearchStCode(Session["StCode"].ToString());
                if (blc)
                {
                    Response.Redirect("SearchResult.aspx");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('很遗憾，你搜索的股票不存在！');</script>");
                }
            }
        }

    }
}