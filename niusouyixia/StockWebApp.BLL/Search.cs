using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using D = StockWebApp.DAL;
using B = StockWebApp.BLL;
using M = StockWebApp.Model;

namespace StockWebApp.BLL
{
    public class Search
    {
        //搜索是否存在股票名
        public bool SearchStName(string stokename)
        {
            string str = string.Format("select count(1) from T_STOCK where STOCK_NAME like '%{0}%'", stokename);
            D.StockDAL dsi = new D.StockDAL();
            return dsi.ExistsName(str);
        }
        //搜索是否存在代码名
        public bool SearchStCode(string stokename)
        {
            string str = string.Format("select count(1) from T_STOCK where STOCK_CODE like '%{0}%'", stokename);
            D.StockDAL dsi = new D.StockDAL();
            return dsi.ExistsName(str);
        }
    }
}
