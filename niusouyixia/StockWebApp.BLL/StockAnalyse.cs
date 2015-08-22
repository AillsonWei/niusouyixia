using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using D = StockWebApp.DAL;
using B = StockWebApp.BLL;
using System.Data;
using M = StockWebApp.Model;

namespace StockWebApp.BLL
{
   public class StockAnalyse
    {
       //分析融资余额
       public decimal REMININGrate(string StockCode)
       {
           decimal[] Remining = new decimal[5];
           D.StockDAL dsd = new D.StockDAL();
           M.Stock ms = new M.Stock();
           DataSet ds = new DataSet();

           ds = dsd.Get5List(StockCode);
           for (int i = 0; i < 5; i++)
           {
               Remining[i] = decimal.Parse(ds.Tables[0].Rows[4 - i][5].ToString());
           }

           decimal[] ReminingCha=new decimal[4];

           for (int i = 0; i < 4; i++)
           {
               ReminingCha[i] = (Remining[i + 1] - Remining[i])/Remining[i];
           }
           decimal dec;
           dec = (ReminingCha[0] + ReminingCha[1] + ReminingCha[2] + ReminingCha[3]) / 4;

           return dec;
       }

       //分析融资买入额
       public decimal PURCHASESrate(string StockCode)
       {
           decimal[] Remining = new decimal[5];
           D.StockDAL dsd = new D.StockDAL();
           M.Stock ms = new M.Stock();
           DataSet ds = new DataSet();

           ds = dsd.Get5List(StockCode);
           for (int i = 0; i < 5; i++)
           {
               Remining[i] = decimal.Parse(ds.Tables[0].Rows[4 - i][6].ToString());
           }

           decimal[] ReminingCha = new decimal[4];

           for (int i = 0; i < 4; i++)
           {
               ReminingCha[i] = (Remining[i + 1] - Remining[i]) / Remining[i];
           }
           decimal dec;
           dec = (ReminingCha[0] + ReminingCha[1] + ReminingCha[2] + ReminingCha[3]) / 4;

           return dec;
       }

       //分析融券余量
       public decimal REAMINQUANTITYrate(string StockCode)
       {
           decimal[] Remining = new decimal[5];
           D.StockDAL dsd = new D.StockDAL();
           M.Stock ms = new M.Stock();
           DataSet ds = new DataSet();

           ds = dsd.Get5List(StockCode);
           for (int i = 0; i < 5; i++)
           {
               Remining[i] = decimal.Parse(ds.Tables[0].Rows[4 - i][9].ToString());
           }

           decimal[] ReminingCha = new decimal[4];

           for (int i = 0; i < 4; i++)
           {
               ReminingCha[i] = (Remining[i + 1] - Remining[i]) / Remining[i];
           }
           decimal dec;
           dec = (ReminingCha[0] + ReminingCha[1] + ReminingCha[2] + ReminingCha[3]) / 4;

           return dec;
       }

       //分析融券卖出量
       public decimal SELLQUANTITYrate(string StockCode)
       {
           decimal[] Remining = new decimal[5];
           D.StockDAL dsd = new D.StockDAL();
           M.Stock ms = new M.Stock();
           DataSet ds = new DataSet();

           ds = dsd.Get5List(StockCode);
           for (int i = 0; i < 5; i++)
           {
               Remining[i] = decimal.Parse(ds.Tables[0].Rows[4 - i][10].ToString());
           }

           decimal[] ReminingCha = new decimal[4];

           for (int i = 0; i < 4; i++)
           {
               ReminingCha[i] = (Remining[i + 1] - Remining[i]) / Remining[i];
           }
           decimal dec;
           dec = (ReminingCha[0] + ReminingCha[1] + ReminingCha[2] + ReminingCha[3]) / 4;

           return dec;
       }

       //匹配结论
       public decimal Conclusion(string StockCode)
       {
           decimal StockREMININGrate = REMININGrate(StockCode);
           decimal StockPURCHASESrate=PURCHASESrate(StockCode);
           decimal StockREAMINQUANTITYrate=REAMINQUANTITYrate(StockCode);
           decimal StockSELLQUANTITYrate=SELLQUANTITYrate(StockCode);

           decimal ADD = (StockREMININGrate + StockPURCHASESrate + StockREAMINQUANTITYrate + StockSELLQUANTITYrate)/4;

           return ADD;
       }
    }
}
