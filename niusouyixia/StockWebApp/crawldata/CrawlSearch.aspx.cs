using StockWebApp.BLL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using D = StockWebApp.DAL;
using System.Runtime;

namespace StockWebApp.crawldata
{
    public partial class CrawlSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    int flat = 3;//默认数据是最新的
                    Label1.Text = "正在自动爬取中 ，请稍候！";
                    //自动获取最近30天的数据,并存到数据库里
                    
                    D.StockDAL dsd = new D.StockDAL();
                    DateTime tradeDateFlat = DateTime.Now;
                    tradeDateFlat = tradeDateFlat.Date;
                    
                    //判断是否为最新数据
                    if (!dsd.ExistsDate(tradeDateFlat))
                    {
                        try
                        {
                            DateTime tradeDate = DateTime.Now.AddDays(-29);
                            tradeDate = tradeDate.Date;
                            //判断30天的数据是否完整
                            for (int i = 0; i < 30; i++)
                            {
                                //首先从数据库里检索当天的数据，如果没有则到新浪融资融券网爬取当天的数据，并存储到数据库里
                                if (!dsd.ExistsDate(tradeDate))
                                {
                                    //获取当天的数据,并存到数据库里
                                    StockManager.BeginFunction(tradeDate);
                                }
                                tradeDate = tradeDate.AddDays(1);
                            }
                            flat = 1;
                        }
                        catch
                        {
                            flat = 0;
                        }


                    }
                    else
                    {
                        flat = 3;
                    }
                    if (flat == 3)
                    {
                        Label1.Text = "数据已经是最新的啦";

                    }
                    else
                    {
                        if (flat == 1)
                        {
                            Label1.Text = "爬取成功";
                        }
                        else
                        { Label1.Text = "爬取失败，当天数据不存在或者你未联网！"; }
                    }
                }
                catch
                {
                    Label1.Text = "爬取失败，当天数据不存在或者你未联网！";
                }
            }
        }
    }
}