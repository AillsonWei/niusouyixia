using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using B = StockWebApp.BLL;
using D = StockWebApp.DAL;
using M = StockWebApp.Model;

namespace StockWebApp
{
    public partial class StockChart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    string StockCode;
                    StockCode = Request.QueryString["STOCK_CODE"].ToString();
                    //定义一个数组
                    ShowChart(StockCode);
                    D.StockDAL dsd=new D.StockDAL ();
                    M.Stock MS=new M.Stock ();
                    MS=dsd.GetModelName(StockCode);
                    string StockName=MS.STOCK_NAME;

                     B.StockAnalyse bsa = new B.StockAnalyse();
                    decimal REMININGrate=bsa.REMININGrate(StockCode);
                    decimal URCHASESrate=bsa.PURCHASESrate(StockCode);
                    decimal REAMINQUANTITYrate=bsa.REAMINQUANTITYrate(StockCode);
                    decimal SELLQUANTITYrate=bsa.SELLQUANTITYrate(StockCode);
                    decimal Conclusion=bsa.Conclusion(StockCode);

                    lbl1.Text = ( REMININGrate* 100).ToString("0.00") + "%";
                    lbl2.Text = (URCHASESrate * 100).ToString("0.00") + "%";
                    lbl3.Text = (REAMINQUANTITYrate * 100).ToString("0.00") + "%";
                    lbl4.Text = (SELLQUANTITYrate * 100).ToString("0.00") + "%";
                    lbl5.Text = ( Conclusion* 100).ToString("0.00") + "%";
                    #region//分析数据
                    StringBuilder strconclusion = new StringBuilder();
                    strconclusion.Append(StockName);
                    if (REMININGrate > 0)
                    {
                        strconclusion.Append("股票的融资余额在一周内同比增长了" + lbl1.Text+",");
                    }
                    else
                    {
                        strconclusion.Append("股票的融资余额在一周内同比减少了" + lbl1.Text + ",");
                    }
                    if (URCHASESrate > 0)
                    {
                        strconclusion.Append("融资买入额在一周内同比增长了" + lbl2.Text + ",");
                    }
                    else
                    {
                        strconclusion.Append("融资买入额在一周内同比减少了" + lbl2.Text + ",");
                    }
                    if (REAMINQUANTITYrate > 0)
                    {
                        strconclusion.Append("融券余量在一周内同比增长了" + lbl3.Text + ",");
                    }
                    else
                    {
                        strconclusion.Append("融券余量在一周内同比减少了" + lbl3.Text + ",");
                    }
                    if (SELLQUANTITYrate > 0)
                    {
                        strconclusion.Append("融券卖出量在一周内同比增长了" + lbl4.Text + ",");
                    }
                    else
                    {
                        strconclusion.Append("融券卖出量在一周内同比减少了" + lbl4.Text + ",");
                    }
                    if (Conclusion > 0)
                    {
                        strconclusion.Append("平均在一周内同比增长了" + lbl5.Text + ",");
                    }
                    else
                    {
                        strconclusion.Append("平均在一周内同比减少了" + lbl5.Text + ",");
                    }

                    if (Conclusion < 0.05M)
                    {
                        strconclusion.Append("变现低落，建议持股即可，必要时可适当卖出.");
                    }
                    else
                    {
                        if (0.05M <= Conclusion || Conclusion <0.1M)
                        {
                            strconclusion.Append("低开高走，表现平淡，投资者对未来本股的行情出现分歧、结合其一周以来的涨幅，走强势头尚未结束，建议继续持股.");
                        }
                        else
                        {
                            if (0.1M <= Conclusion || Conclusion <0.12M)
                            {
                                strconclusion.Append("表现强势，相应股票表现不俗，适当关注这一现象.");
                            }
                            else
                            {
                                if (0.12M <= Conclusion || Conclusion < 0.15M)
                                {
                                    strconclusion.Append("强势整理，强支撑，而且成交量也保持良好水平，技术指标亦多有配合。建议密切关注.");
                                }
                                else
                                {
                                    strconclusion.Append("表现强势，属于强力股，资金大头，个人可适当跟盘操作，公司可考虑强力入股.");
                                }
                            }
                        }
                    }
#endregion
                    string strconclusion2 = strconclusion.ToString();
                    lbl6.Text = strconclusion2;
                }
                catch
                {
                    Server.Transfer("404error.aspx", true);
                }

         }
        }

        private void ShowChart(string StockCode)
        {
            B.ChartContent bcc = new B.ChartContent();
            #region //数组获取数据库融资余额
            decimal[] REMAINING = new decimal[20];
            REMAINING = bcc.GETREMAINING(StockCode);

            //定义像页面输出的数组名称,利用for循环把数组内容添加到numbers里面
            string mes1 = "var number1=[";
            for (int i = 0; i < REMAINING.Length; i++)
            {
                mes1 += REMAINING[i].ToString() + ",";
            }
            //把最后的,符号去掉,并且补全
            mes1 = mes1.Substring(0, mes1.LastIndexOf(',')).ToString() + "]";
            //一起输出到页面
            Response.Write("<script>" + mes1 + "</script>");
            Response.Flush();
            #endregion
            #region//数组获取数据库融资买入额
            decimal[] PURCHASES = new decimal[20];
            PURCHASES = bcc.GETPURCHASES(StockCode);

            //定义像页面输出的数组名称,利用for循环把数组内容添加到numbers里面
            string mes2 = "var number2=[";
            for (int i = 0; i < PURCHASES.Length; i++)
            {
                mes2 += PURCHASES[i].ToString() + ",";
            }
            //把最后的,符号去掉,并且补全
            mes2 = mes2.Substring(0, mes2.LastIndexOf(',')).ToString() + "]";
            //一起输出到页面
            Response.Write("<script>" + mes2 + "</script>");
            Response.Flush();
            #endregion
            #region//数组获取数据库融券余量
            int[] REMAINQUILITY = new int[20];
            REMAINQUILITY = bcc.GETREMAINQUILITY(StockCode);

            //定义像页面输出的数组名称,利用for循环把数组内容添加到numbers里面
            string mes3 = "var number3=[";
            for (int i = 0; i < REMAINQUILITY.Length; i++)
            {
                mes3 += REMAINQUILITY[i].ToString() + ",";
            }
            //把最后的,符号去掉,并且补全
            mes3 = mes3.Substring(0, mes3.LastIndexOf(',')).ToString() + "]";
            //一起输出到页面
            Response.Write("<script>" + mes3 + "</script>");
            Response.Flush();
            #endregion
            #region//数组获取数据库融券买入量
            int[] SELLQUANTITY = new int[20];
            SELLQUANTITY = bcc.GETSELLQUANTITY(StockCode);

            //定义像页面输出的数组名称,利用for循环把数组内容添加到numbers里面
            string mes4 = "var number4=[";
            for (int i = 0; i < SELLQUANTITY.Length; i++)
            {
                mes4 += SELLQUANTITY[i].ToString() + ",";
            }
            //把最后的,符号去掉,并且补全
            mes4 = mes4.Substring(0, mes4.LastIndexOf(',')).ToString() + "]";
            //一起输出到页面
            Response.Write("<script>" + mes4 + "</script>");
            Response.Flush();
            #endregion
            #region //数组获取数据库对应日期
            DateTime[] DATE = new DateTime[20];
            DATE = bcc.GETDATE(StockCode);

            int [] DATECHA=new int[20];
            for (int i = 0; i < DATECHA.Length; i++)
            {
                TimeSpan span = DATE[19] - DATE[i];
                DATECHA[i] = span.Days+2;
            }


            //定义像页面输出的数组名称,利用for循环把数组内容添加到numbers里面
            string mes5 = "var shuzi=[";
            for (int i = 0; i < DATECHA.Length; i++)
            {
                mes5 += "-"+DATECHA[i].ToString() + ",";
            }
            //把最后的,符号去掉,并且补全
            mes5 = mes5.Substring(0, mes5.LastIndexOf(',')).ToString() + "]";
            //一起输出到页面
            Response.Write("<script>" + mes5 + "</script>");
            Response.Flush();
            #endregion
        }
    }
}