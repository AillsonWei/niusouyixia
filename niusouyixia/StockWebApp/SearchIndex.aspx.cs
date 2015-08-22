using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Data;
using StockWebApp.Model;
using StockWebApp.BLL;
using System;
using D = StockWebApp.DAL;
using B = StockWebApp.BLL;
using M = StockWebApp.Model;


namespace StockWebApp
{
    public partial class SearchIndex : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {     
        }

        protected void BTNSearch1_Click(object sender, EventArgs e)
        {
            if (TXTSearch1.Text != null)
            { 
                btnsearch(TXTSearch1.Text); 
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('请输入你所要查询的股票！');</script>");
            }
           
        }
        protected void BTNSearch2_Click(object sender, EventArgs e)
        {
            if (TXTSearch2.Text != null)
            { btnsearch(TXTSearch2.Text); }
            else
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('请输入你所要查询的股票！');</script>");
            }
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