using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StockWebApp.Model
{
    public class Stock
    {
        /// <summary>
        /// 初始化股票相关信息
        /// </summary>
        public int ROW_ID;
        public DateTime CREATED;
        public DateTime TRADE_DATE;
        public string STOCK_CODE;
        public string STOCK_NAME;
        public decimal REMAINING;
        public decimal PURCHASES;
        public decimal PAYMENTS;
        public decimal REMAIN_SUM;
        public int REMAIN_QUANTITY;
        public int SELL_QUANTITY;
        public int REIMBURSED_FLOAT;
        public int RETRY_ATTEMPT;
        public decimal SECURITIES_BALANCES;
    }
}
