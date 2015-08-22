using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Data;
using System.Net;
using System.IO;
using StockWebApp.DAL;
using StockWebApp.Model;

namespace StockWebApp.BLL
{
    public class StockManager
    { 

        /// <summary>
        /// 爬取新浪融资融券网当天的交易信息，并存储到数据库里
        /// </summary>
        /// <param name="tradeDate"></param>
        /// <returns></returns>
        public static int  BeginFunction(DateTime tradeDate)
        {
            int flat = 0;
            string url = "http://vip.stock.finance.sina.com.cn/q/go.php/vInvestConsult/kind/rzrq/index.phtml?tradedate=" + tradeDate.Date.ToString("yyyy-MM-dd");
            //得到指定Url的源码 
            string strWebContent = GetWebContent(url);

                #region//取出和数据有关的那段源码
                int iStart = strWebContent.IndexOf("融资融券交易明细");
                if (iStart > 0)
                {
                    string strTableStart = strWebContent.Substring(0, iStart);
                    string strTableEnd = strWebContent.Substring(iStart);
                    strTableStart = strTableStart.Substring(strTableStart.LastIndexOf("<table"));
                    strTableEnd = strTableEnd.Substring(0, strTableEnd.IndexOf("</table>") + 8);
                    string strWeb = strTableStart + strTableEnd;
                    string[] trArray = Regex.Split(strWeb, @"<tr class=""head"">", RegexOptions.IgnoreCase);
                    for (int i = 0; i < trArray.Length; i++)
                    {
                        string[] tdArray = Regex.Split(trArray[i], @"<td style=""background-color:#ffffff"">", RegexOptions.IgnoreCase);
                        if (tdArray.Length == 12)
                        {
                            string stockCode = string.Empty;
                            string stockName = string.Empty;
                            decimal remaining = 0;
                            decimal purchases = 0;
                            decimal payments = 0;
                            decimal remainSum = 0;
                            int remainQuantity = 0;
                            int sellQuantity = 0;
                            int reimbursedFloat = 0;
                            decimal securitiesBalances = 0;

                            stockCode = tdArray[2];
                            stockCode = stockCode.Substring(0, stockCode.IndexOf("</a>"));
                            stockCode = stockCode.Substring(stockCode.LastIndexOf(">") + 1);

                            stockName = tdArray[3];
                            stockName = stockName.Substring(0, stockName.IndexOf("</a>"));
                            stockName = stockName.Substring(stockName.LastIndexOf(">") + 1);

                            string strRemaining = tdArray[4].Replace("</td>", "").Replace("\n>", "").Replace("--", "").Trim();
                            if (strRemaining != string.Empty)
                                remaining = decimal.Parse(strRemaining);

                            string strPurchases = tdArray[5].Replace("</td>", "").Replace("\n>", "").Replace("--", "").Trim();
                            if (strPurchases != string.Empty)
                                purchases = decimal.Parse(strPurchases);

                            string strPayments = tdArray[6].Replace("</td>", "").Replace("\n>", "").Replace("--", "").Trim();
                            if (strPayments != string.Empty)
                                payments = decimal.Parse(strPayments);

                            string strRemainSum = tdArray[7].Replace("</td>", "").Replace("\n>", "").Replace("--", "").Trim();
                            if (strRemainSum != string.Empty)
                                remainSum = decimal.Parse(strRemainSum);

                            string strRemainQuantity = tdArray[8].Replace("</td>", "").Replace("\n>", "").Replace("--", "").Replace(",", "").Trim();
                            if (strRemainQuantity != string.Empty)
                                remainQuantity = int.Parse(strRemainQuantity);

                            string strSellQuantity = tdArray[9].Replace("</td>", "").Replace("\n>", "").Replace("--", "").Replace(",", "").Trim();
                            if (strSellQuantity != string.Empty)
                                sellQuantity = int.Parse(strSellQuantity);

                            string strReimbursedFloat = tdArray[10].Replace("</td>", "").Replace("\n>", "").Replace("--", "").Replace(",", "").Trim();
                            if (strReimbursedFloat != string.Empty)
                                reimbursedFloat = int.Parse(strReimbursedFloat);

                            try
                            {
                                string strSecuritiesBalances = tdArray[11].Replace("</td>", "").Replace("</tr>", "").Replace("</table>", "").Replace("\n>", "").Replace("--", "").Trim();
                                if (strSecuritiesBalances != string.Empty)
                                    securitiesBalances = decimal.Parse(strSecuritiesBalances);
                            }
                            catch (Exception e)
                            {
                                string message = e.Message;
                            }

                            StockWebApp.Model.Stock swm = new Stock();
                            StockWebApp.DAL.StockDAL swd = new StockDAL();

                            swm.STOCK_CODE = stockCode;
                            swm.STOCK_NAME = stockName;
                            swm.REMAINING = remaining;
                            swm.PURCHASES = purchases;
                            swm.PAYMENTS = payments;
                            swm.REMAIN_SUM = remainSum;
                            swm.REMAIN_QUANTITY = remainQuantity;
                            swm.SELL_QUANTITY = sellQuantity;
                            swm.REIMBURSED_FLOAT = reimbursedFloat;
                            swm.SECURITIES_BALANCES = securitiesBalances;
                            swm.TRADE_DATE = tradeDate;
                            swm.CREATED = DateTime.Now;
                            flat = swd.Add(swm);
                        }
                    }
                }
                if (flat != 0)
                {
                    return 1;//爬取成功
                }
                else return 0;//爬取失败
                #endregion
        

            
        }

        /// <summary>
        /// 根据Url地址得到网页的html源码
        /// </summary>
        /// <param name="tradeDate"></param>
        /// <returns></returns>
        private static string GetWebContent(string Url)
        {
            string strResult = "";
            try
            {
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(Url);
                //声明一个HttpWebRequest请求 
                request.Timeout = 600000;          
                //设置连接超时时间 
                request.Headers.Set("Pragma", "no-cache");
                HttpWebResponse response = (HttpWebResponse)request.GetResponse();
                Stream streamReceive = response.GetResponseStream();
                Encoding encoding = Encoding.GetEncoding("GB2312");
                StreamReader streamReader = new StreamReader(streamReceive, encoding);
                strResult = streamReader.ReadToEnd();
            }
            catch
            {
               
            }

            return strResult;
        }

    }
}
