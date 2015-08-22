using System;
using System.Data;
using System.Text;
using System.Data.SqlClient;
using StockWebApp.DBUtility;//Please add references
namespace StockWebApp.DAL
{
    /// <summary>
    /// 数据访问类:StockDAL
    /// </summary>
    public class StockDAL
    {

        #region  BasicMethod
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(int ROW_ID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from T_STOCK");
            strSql.Append(" where ROW_ID=@ROW_ID");
            SqlParameter[] parameters = {
					new SqlParameter("@ROW_ID", SqlDbType.Int,4)
			};
            parameters[0].Value = ROW_ID;

            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }
        /// <summary>
        /// 是否存在该记录(模糊)
        /// 重载董苇
        /// </summary>
        public bool ExistsName(string strSql)
        {
            return DbHelperSQL.Exists(strSql.ToString());
        }
        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool ExistsDate(DateTime dt)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from T_STOCK");
            strSql.Append(" where TRADE_DATE=@TRADE_DATE");
            SqlParameter[] parameters = {
					new SqlParameter("@TRADE_DATE", SqlDbType.DateTime)
			};
            parameters[0].Value = dt;

            return DbHelperSQL.Exists(strSql.ToString(), parameters);
        }
        /// <summary>
        /// 增加一条数据
        /// </summary>
        public int Add(StockWebApp.Model.Stock model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into T_STOCK(");
            strSql.Append("CREATED,TRADE_DATE,STOCK_CODE,STOCK_NAME,REMAINING,PURCHASES,PAYMENTS,REMAIN_SUM,REMAIN_QUANTITY,SELL_QUANTITY,REIMBURSED_FLOAT,SECURITIES_BALANCES)");
            strSql.Append(" values (");
            strSql.Append("@CREATED,@TRADE_DATE,@STOCK_CODE,@STOCK_NAME,@REMAINING,@PURCHASES,@PAYMENTS,@REMAIN_SUM,@REMAIN_QUANTITY,@SELL_QUANTITY,@REIMBURSED_FLOAT,@SECURITIES_BALANCES)");
            strSql.Append(";select @@IDENTITY");
            SqlParameter[] parameters = {
					new SqlParameter("@CREATED", SqlDbType.DateTime),
					new SqlParameter("@TRADE_DATE", SqlDbType.DateTime),
					new SqlParameter("@STOCK_CODE", SqlDbType.VarChar,100),
					new SqlParameter("@STOCK_NAME", SqlDbType.VarChar,100),
					new SqlParameter("@REMAINING", SqlDbType.Money,8),
					new SqlParameter("@PURCHASES", SqlDbType.Money,8),
					new SqlParameter("@PAYMENTS", SqlDbType.Money,8),
					new SqlParameter("@REMAIN_SUM", SqlDbType.Money,8),
					new SqlParameter("@REMAIN_QUANTITY", SqlDbType.Int,4),
					new SqlParameter("@SELL_QUANTITY", SqlDbType.Int,4),
					new SqlParameter("@REIMBURSED_FLOAT", SqlDbType.Int,4),
					new SqlParameter("@SECURITIES_BALANCES", SqlDbType.Money,8)};
            parameters[0].Value = model.CREATED;
            parameters[1].Value = model.TRADE_DATE;
            parameters[2].Value = model.STOCK_CODE;
            parameters[3].Value = model.STOCK_NAME;
            parameters[4].Value = model.REMAINING;
            parameters[5].Value = model.PURCHASES;
            parameters[6].Value = model.PAYMENTS;
            parameters[7].Value = model.REMAIN_SUM;
            parameters[8].Value = model.REMAIN_QUANTITY;
            parameters[9].Value = model.SELL_QUANTITY;
            parameters[10].Value = model.REIMBURSED_FLOAT;
            parameters[11].Value = model.SECURITIES_BALANCES;

            object obj = DbHelperSQL.GetSingle(strSql.ToString(), parameters);
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }
        /// <summary>
        /// 更新一条数据
        /// </summary>
        public bool Update(StockWebApp.Model.Stock model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("update T_STOCK set ");
            strSql.Append("CREATED=@CREATED,");
            strSql.Append("TRADE_DATE=@TRADE_DATE,");
            strSql.Append("STOCK_CODE=@STOCK_CODE,");
            strSql.Append("STOCK_NAME=@STOCK_NAME,");
            strSql.Append("REMAINING=@REMAINING,");
            strSql.Append("PURCHASES=@PURCHASES,");
            strSql.Append("PAYMENTS=@PAYMENTS,");
            strSql.Append("REMAIN_SUM=@REMAIN_SUM,");
            strSql.Append("REMAIN_QUANTITY=@REMAIN_QUANTITY,");
            strSql.Append("SELL_QUANTITY=@SELL_QUANTITY,");
            strSql.Append("REIMBURSED_FLOAT=@REIMBURSED_FLOAT,");
            strSql.Append("SECURITIES_BALANCES=@SECURITIES_BALANCES");
            strSql.Append(" where ROW_ID=@ROW_ID");
            SqlParameter[] parameters = {
					new SqlParameter("@CREATED", SqlDbType.DateTime),
					new SqlParameter("@TRADE_DATE", SqlDbType.DateTime),
					new SqlParameter("@STOCK_CODE", SqlDbType.VarChar,100),
					new SqlParameter("@STOCK_NAME", SqlDbType.VarChar,100),
					new SqlParameter("@REMAINING", SqlDbType.Money,8),
					new SqlParameter("@PURCHASES", SqlDbType.Money,8),
					new SqlParameter("@PAYMENTS", SqlDbType.Money,8),
					new SqlParameter("@REMAIN_SUM", SqlDbType.Money,8),
					new SqlParameter("@REMAIN_QUANTITY", SqlDbType.Int,4),
					new SqlParameter("@SELL_QUANTITY", SqlDbType.Int,4),
					new SqlParameter("@REIMBURSED_FLOAT", SqlDbType.Int,4),
					new SqlParameter("@SECURITIES_BALANCES", SqlDbType.Money,8),
					new SqlParameter("@ROW_ID", SqlDbType.Int,4)};
            parameters[0].Value = model.CREATED;
            parameters[1].Value = model.TRADE_DATE;
            parameters[2].Value = model.STOCK_CODE;
            parameters[3].Value = model.STOCK_NAME;
            parameters[4].Value = model.REMAINING;
            parameters[5].Value = model.PURCHASES;
            parameters[6].Value = model.PAYMENTS;
            parameters[7].Value = model.REMAIN_SUM;
            parameters[8].Value = model.REMAIN_QUANTITY;
            parameters[9].Value = model.SELL_QUANTITY;
            parameters[10].Value = model.REIMBURSED_FLOAT;
            parameters[11].Value = model.SECURITIES_BALANCES;
            parameters[12].Value = model.ROW_ID;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /// <summary>
        /// 删除一条数据
        /// </summary>
        public bool Delete(int ROW_ID)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_STOCK ");
            strSql.Append(" where ROW_ID=@ROW_ID");
            SqlParameter[] parameters = {
					new SqlParameter("@ROW_ID", SqlDbType.Int,4)
			};
            parameters[0].Value = ROW_ID;

            int rows = DbHelperSQL.ExecuteSql(strSql.ToString(), parameters);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        /// <summary>
        /// 批量删除数据
        /// </summary>
        public bool DeleteList(string ROW_IDlist)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("delete from T_STOCK ");
            strSql.Append(" where ROW_ID in (" + ROW_IDlist + ")  ");
            int rows = DbHelperSQL.ExecuteSql(strSql.ToString());
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public StockWebApp.Model.Stock GetModel(int ROW_ID)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 ROW_ID,CREATED,TRADE_DATE,STOCK_CODE,STOCK_NAME,REMAINING,PURCHASES,PAYMENTS,REMAIN_SUM,REMAIN_QUANTITY,SELL_QUANTITY,REIMBURSED_FLOAT,SECURITIES_BALANCES from T_STOCK ");
            strSql.Append(" where ROW_ID=@ROW_ID");
            SqlParameter[] parameters = {
					new SqlParameter("@ROW_ID", SqlDbType.Int,4)
			};
            parameters[0].Value = ROW_ID;

            StockWebApp.Model.Stock model = new StockWebApp.Model.Stock();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return DataRowToModel(ds.Tables[0].Rows[0]);
            }
            else
            {
                return null;
            }
        }
        /// <summary>
        /// 得到一个对象实体
        /// 重载 董苇
        /// </summary>
        public StockWebApp.Model.Stock GetModelName(string code)
        {

            StringBuilder strSql = new StringBuilder();
            strSql.Append("select  top 1 ROW_ID,CREATED,TRADE_DATE,STOCK_CODE,STOCK_NAME,REMAINING,PURCHASES,PAYMENTS,REMAIN_SUM,REMAIN_QUANTITY,SELL_QUANTITY,REIMBURSED_FLOAT,SECURITIES_BALANCES from T_STOCK ");
            strSql.Append(" where STOCK_CODE=@STOCK_CODE");
            SqlParameter[] parameters = {
					new SqlParameter("@STOCK_CODE", SqlDbType.NVarChar,100)
			};
            parameters[0].Value = code;

            StockWebApp.Model.Stock model = new StockWebApp.Model.Stock();
            DataSet ds = DbHelperSQL.Query(strSql.ToString(), parameters);
            if (ds.Tables[0].Rows.Count > 0)
            {
                return DataRowToModel(ds.Tables[0].Rows[0]);
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 得到一个对象实体
        /// </summary>
        public StockWebApp.Model.Stock DataRowToModel(DataRow row)
        {
            StockWebApp.Model.Stock model = new StockWebApp.Model.Stock();
            if (row != null)
            {
                if (row["ROW_ID"] != null && row["ROW_ID"].ToString() != "")
                {
                    model.ROW_ID = int.Parse(row["ROW_ID"].ToString());
                }
                if (row["CREATED"] != null && row["CREATED"].ToString() != "")
                {
                    model.CREATED = DateTime.Parse(row["CREATED"].ToString());
                }
                if (row["TRADE_DATE"] != null && row["TRADE_DATE"].ToString() != "")
                {
                    model.TRADE_DATE = DateTime.Parse(row["TRADE_DATE"].ToString());
                }
                if (row["STOCK_CODE"] != null)
                {
                    model.STOCK_CODE = row["STOCK_CODE"].ToString();
                }
                if (row["STOCK_NAME"] != null)
                {
                    model.STOCK_NAME = row["STOCK_NAME"].ToString();
                }
                if (row["REMAINING"] != null && row["REMAINING"].ToString() != "")
                {
                    model.REMAINING = decimal.Parse(row["REMAINING"].ToString());
                }
                if (row["PURCHASES"] != null && row["PURCHASES"].ToString() != "")
                {
                    model.PURCHASES = decimal.Parse(row["PURCHASES"].ToString());
                }
                if (row["PAYMENTS"] != null && row["PAYMENTS"].ToString() != "")
                {
                    model.PAYMENTS = decimal.Parse(row["PAYMENTS"].ToString());
                }
                if (row["REMAIN_SUM"] != null && row["REMAIN_SUM"].ToString() != "")
                {
                    model.REMAIN_SUM = decimal.Parse(row["REMAIN_SUM"].ToString());
                }
                if (row["REMAIN_QUANTITY"] != null && row["REMAIN_QUANTITY"].ToString() != "")
                {
                    model.REMAIN_QUANTITY = int.Parse(row["REMAIN_QUANTITY"].ToString());
                }
                if (row["SELL_QUANTITY"] != null && row["SELL_QUANTITY"].ToString() != "")
                {
                    model.SELL_QUANTITY = int.Parse(row["SELL_QUANTITY"].ToString());
                }
                if (row["REIMBURSED_FLOAT"] != null && row["REIMBURSED_FLOAT"].ToString() != "")
                {
                    model.REIMBURSED_FLOAT = int.Parse(row["REIMBURSED_FLOAT"].ToString());
                }
                if (row["SECURITIES_BALANCES"] != null && row["SECURITIES_BALANCES"].ToString() != "")
                {
                    model.SECURITIES_BALANCES = decimal.Parse(row["SECURITIES_BALANCES"].ToString());
                }
            }
            return model;
        }

        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataSet GetList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ROW_ID,CREATED,TRADE_DATE,STOCK_CODE,STOCK_NAME,REMAINING,PURCHASES,PAYMENTS,REMAIN_SUM,REMAIN_QUANTITY,SELL_QUANTITY,REIMBURSED_FLOAT,SECURITIES_BALANCES ");
            strSql.Append(" FROM T_STOCK ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 获得前几行数据
        /// </summary>
        public DataSet GetList(int Top, string strWhere, string filedOrder)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select ");
            if (Top > 0)
            {
                strSql.Append(" top " + Top.ToString());
            }
            strSql.Append(" ROW_ID,CREATED,TRADE_DATE,STOCK_CODE,STOCK_NAME,REMAINING,PURCHASES,PAYMENTS,REMAIN_SUM,REMAIN_QUANTITY,SELL_QUANTITY,REIMBURSED_FLOAT,SECURITIES_BALANCES ");
            strSql.Append(" FROM T_STOCK ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            strSql.Append(" order by " + filedOrder);
            return DbHelperSQL.Query(strSql.ToString());
        }

        /// <summary>
        /// 获得前几行数据
        /// 重载 董苇 反向取30个数据
        /// </summary>
        public DataSet GetREMAININGList(string strData)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select top 30 ROW_ID,CREATED,TRADE_DATE,STOCK_CODE,STOCK_NAME,REMAINING,PURCHASES,PAYMENTS,REMAIN_SUM,REMAIN_QUANTITY,SELL_QUANTITY,REIMBURSED_FLOAT,SECURITIES_BALANCES ");
            strSql.Append(" FROM T_STOCK ");
            if (strData.Trim() != "")
            {
                strSql.Append(" where  STOCK_CODE=" + strData);
            }
            strSql.Append(" order by TRADE_DATE DESC ");
            return DbHelperSQL.Query(strSql.ToString());
        }
        /// <summary>
        /// 获得前几行数据
        /// 重载 董苇 反向取5天数据
        /// </summary>
        public DataSet Get5List(string strData)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append(" select top 5 ROW_ID,CREATED,TRADE_DATE,STOCK_CODE,STOCK_NAME,REMAINING,PURCHASES,PAYMENTS,REMAIN_SUM,REMAIN_QUANTITY,SELL_QUANTITY,REIMBURSED_FLOAT,SECURITIES_BALANCES ");
            strSql.Append(" FROM T_STOCK ");
            if (strData.Trim() != "")
            {
                strSql.Append(" where  STOCK_CODE=" + strData);
            }
            strSql.Append(" order by TRADE_DATE DESC ");
            return DbHelperSQL.Query(strSql.ToString());
        }
        /// <summary>
        /// 获取记录总数
        /// </summary>
        public int GetRecordCount(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) FROM T_STOCK ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" where " + strWhere);
            }
            object obj = DbHelperSQL.GetSingle(strSql.ToString());
            if (obj == null)
            {
                return 0;
            }
            else
            {
                return Convert.ToInt32(obj);
            }
        }
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetListByPage(string strWhere, string orderby, int startIndex, int endIndex)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM ( ");
            strSql.Append(" SELECT ROW_NUMBER() OVER (");
            if (!string.IsNullOrEmpty(orderby.Trim()))
            {
                strSql.Append("order by T." + orderby);
            }
            else
            {
                strSql.Append("order by T.ROW_ID desc");
            }
            strSql.Append(")AS Row, T.*  from T_STOCK T ");
            if (!string.IsNullOrEmpty(strWhere.Trim()))
            {
                strSql.Append(" WHERE " + strWhere);
            }
            strSql.Append(" ) TT");
            strSql.AppendFormat(" WHERE TT.Row between {0} and {1}", startIndex, endIndex);
            return DbHelperSQL.Query(strSql.ToString());
        }

        /*
        /// <summary>
        /// 分页获取数据列表
        /// </summary>
        public DataSet GetList(int PageSize,int PageIndex,string strWhere)
        {
            SqlParameter[] parameters = {
                    new SqlParameter("@tblName", SqlDbType.VarChar, 255),
                    new SqlParameter("@fldName", SqlDbType.VarChar, 255),
                    new SqlParameter("@PageSize", SqlDbType.Int),
                    new SqlParameter("@PageIndex", SqlDbType.Int),
                    new SqlParameter("@IsReCount", SqlDbType.Bit),
                    new SqlParameter("@OrderType", SqlDbType.Bit),
                    new SqlParameter("@strWhere", SqlDbType.VarChar,1000),
                    };
            parameters[0].Value = "T_STOCK";
            parameters[1].Value = "ROW_ID";
            parameters[2].Value = PageSize;
            parameters[3].Value = PageIndex;
            parameters[4].Value = 0;
            parameters[5].Value = 0;
            parameters[6].Value = strWhere;	
            return DbHelperSQL.RunProcedure("UP_GetRecordByPage",parameters,"ds");
        }*/

        #endregion  BasicMethod
        #region  ExtensionMethod

        #endregion  ExtensionMethod
    }
}

