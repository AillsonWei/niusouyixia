<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchResult.aspx.cs" Inherits="StockWebApp.SearchResult" %>

<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>牛搜一下 - 搜索结果</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<meta content="" name="description" />

	<meta content="" name="author" />

	<!-- BEGIN GLOBAL MANDATORY STYLES -->

	<link href="media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/font-awesome.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN PAGE LEVEL STYLES --> 

	<link rel="stylesheet" type="text/css" href="media/css/datepicker.css" />

	<link href="media/css/jquery.fancybox.css" rel="stylesheet" />

	<link href="media/css/search.css" rel="stylesheet" type="text/css"/>

	<!-- END PAGE LEVEL STYLES -->

	<link rel="shortcut icon" href="media/image/favicon.ico" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">
    <form runat ="server">
	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<!-- BEGIN TOP NAVIGATION BAR -->

		<div class="navbar-inner">

			<div class="container-fluid">

				<!-- BEGIN LOGO -->

				<a class="brand" href="SearchIndex.aspx">

				<img src="media/image/logo.png" alt="logo" />

				</a>

				<!-- END LOGO -->
            </div>
        </div>

	</div>

	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->   

	<div class="page-container row-fluid">

		<!-- BEGIN SIDEBAR -->

		<div class="page-sidebar nav-collapse collapse">

			<!-- BEGIN SIDEBAR MENU -->        

			<ul class="page-sidebar-menu">

				<li>

					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->

					<div class="sidebar-toggler hidden-phone"></div>

					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->

				</li>

				<li>

					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->

					<!-- END RESPONSIVE QUICK SEARCH FORM -->

				</li>

				<li class="start ">

					<a href="SearchIndex.aspx">

					<i class="icon-home"></i> 

					<span class="title">首页</span>

					</a>

				</li>

				</ul>

			<!-- END SIDEBAR MENU -->

		</div>

		<!-- END SIDEBAR -->

		<!-- BEGIN PAGE -->

		<div class="page-content">

			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<div id="portlet-config" class="modal hide">

				<div class="modal-header">

					<button data-dismiss="modal" class="close" type="button"></button>

					<h3>portlet Settings</h3>

				</div>

				<div class="modal-body">

					<p>Here will be a configuration form</p>

				</div>

			</div>

			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->

			<!-- BEGIN PAGE CONTAINER-->

			<div class="container-fluid">

				<!-- BEGIN PAGE HEADER-->

				<div class="row-fluid">

					<div class="span12">

						<!-- BEGIN STYLE CUSTOMIZER -->

						<div class="color-panel hidden-phone">

							<div class="color-mode-icons icon-color"></div>

							<div class="color-mode-icons icon-color-close"></div>

							<div class="color-mode">

								<p>主题色彩</p>

								<ul class="inline">

									<li class="color-black current color-default" data-style="default"></li>

									<li class="color-blue" data-style="blue"></li>

									<li class="color-brown" data-style="brown"></li>

									<li class="color-purple" data-style="purple"></li>

									<li class="color-grey" data-style="grey"></li>

									<li class="color-white color-light" data-style="light"></li>

								</ul>

								<label>

									<span>Layout</span>

									<select class="layout-option m-wrap small">

										<option value="fluid" selected>Fluid</option>

										<option value="boxed">Boxed</option>

									</select>

								</label>

								<label>

									<span>Header</span>

									<select class="header-option m-wrap small">

										<option value="fixed" selected>Fixed</option>

										<option value="default">Default</option>

									</select>

								</label>

								<label>

									<span>Sidebar</span>

									<select class="sidebar-option m-wrap small">

										<option value="fixed">Fixed</option>

										<option value="default" selected>Default</option>

									</select>

								</label>

								<label>

									<span>Footer</span>

									<select class="footer-option m-wrap small">

										<option value="fixed">Fixed</option>

										<option value="default" selected>Default</option>

									</select>

								</label>

							</div>

						</div>

						<!-- END BEGIN STYLE CUSTOMIZER --> 

						<!-- BEGIN PAGE TITLE & BREADCRUMB-->

						<h3 class="page-title">

                            <font style="FONT-SIZE: 50pt; FILTER: shadow(color=#af2dco); WIDTH: 100%; COLOR: #212121; LINE-HEIGHT: 100%; FONT-FAMILY: 华文行楷" size=6>牛搜一下</font><small>融资融券</small>

						</h3>

						<ul class="breadcrumb">

							<li>

								<i class="icon-home"></i>

								<a href="SearchIndex.aspx">首页</a> 

								<i class="icon-angle-right"></i>

							</li>
							<li>搜索结果</li>

						</ul>
                        <div class="row-fluid search-forms search-default">
                           

                                <div>
                                  &nbsp;<asp:TextBox ID="TXTSearch" runat="server" Height="30px" Width=89%></asp:TextBox>
                                  <asp:Button ID="BTNSearch" runat="server" BackColor="#35A947" BorderColor="#35A947" BorderStyle="Solid" Font-Names="微软雅黑" Font-Size="X-Large" ForeColor="White" Height="50px" Text="牛搜一下" Width="118px" OnClick="BTNSearch_Click" />
                                    <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TXTSearch" ErrorMessage="*必须输入搜索内容" ForeColor="#CC0000" ValidationGroup="3"></asp:RequiredFieldValidator>
                                </div>

                           
                        </div>
						<!-- END PAGE TITLE & BREADCRUMB-->

					</div>

				</div>

				<!-- END PAGE HEADER-->

				<!-- BEGIN PAGE CONTENT-->
                <div>
                    <asp:Panel ID="Panel1" runat="server">
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#DF6458" GridLines="None" Width="100%" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" PageSize="12">
                        <AlternatingRowStyle BackColor="White" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <Columns>
                        <asp:HyperLinkField DataTextField="STOCK_CODE" DataTextFormatString="{0:c}" DataNavigateUrlFields="STOCK_CODE"
                            DataNavigateUrlFormatString="~/SearchChart.aspx?STOCK_CODE={0}" 
                            HeaderText="股票代码" >
                        <HeaderStyle BackColor="#003399" ForeColor="White" />
                             </asp:HyperLinkField>
                            <asp:BoundField DataField="STOCK_NAME" HeaderText="股票名称" SortExpression="STOCK_NAME" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <RowStyle BackColor="#EFF3FB" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#4BB161" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:db_StockConnectionString2 %>" SelectCommand="SELECT DISTINCT [STOCK_CODE], [STOCK_NAME] FROM [T_STOCK] WHERE ([STOCK_NAME] LIKE '%' + @STOCK_NAME + '%') ORDER BY [STOCK_CODE]">
                            <SelectParameters>
                                <asp:SessionParameter Name="STOCK_NAME" SessionField="StName" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" Width="100%">
                    <asp:GridView ID="GridView3" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" AutoGenerateColumns="False" DataSourceID="SqlDataSourceStockInfo" AllowPaging="True" PageSize="12">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                         <asp:HyperLinkField DataTextField="STOCK_CODE" DataTextFormatString="{0:c}" DataNavigateUrlFields="STOCK_CODE"
                            DataNavigateUrlFormatString="~/SearchChart.aspx?STOCK_CODE={0}" 
                            HeaderText="股票代码" >
                        <HeaderStyle BackColor="#003399" ForeColor="White" />
                        </asp:HyperLinkField>
                            <asp:BoundField DataField="STOCK_NAME" HeaderText="股票名称" SortExpression="STOCK_NAME" />
                        </Columns>
                        <EditRowStyle BackColor="#2461BF" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <RowStyle BackColor="#EFF3FB" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#4BB161" Font-Names="华文行楷" Font-Size="XX-Large" />
                        <SortedAscendingCellStyle BackColor="#F5F7FB" />
                        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                        <SortedDescendingCellStyle BackColor="#E9EBEF" />
                        <SortedDescendingHeaderStyle BackColor="#4870BE" />
                    </asp:GridView>
                        </asp:Panel>
                    <asp:SqlDataSource ID="SqlDataSourceStockInfo" runat="server" ConnectionString="<%$ ConnectionStrings:db_StockConnectionString %>" SelectCommand="SELECT DISTINCT [STOCK_CODE], [STOCK_NAME] FROM [T_STOCK] WHERE ([STOCK_CODE] LIKE '%' + @STOCK_CODE + '%') ORDER BY [STOCK_CODE]">
                        <SelectParameters>
                            <asp:SessionParameter Name="STOCK_CODE" SessionField="StCode" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

				<div class="row-fluid">

					<div class="tabbable tabbable-custom tabbable-full-width">

						<div class="tab-content">

							<div id="tab_2_2" class="tab-pane active">

					</div>

					<!--end tabbable-->           

				</div>

				<!-- END PAGE CONTENT-->

			</div>

			<!-- END PAGE CONTAINER--> 

		</div>

		<!-- END PAGE -->    

	</div>

	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->

	<div class="footer">

		<div class="footer-inner">

			2014 &copy; 牛搜一下，软件工程学院4+1项目部

		</div>

		<div class="footer-tools">

			<span class="go-top">

			<i class="icon-angle-up"></i>

			</span>

		</div>

	</div>

	<!-- END FOOTER -->

	<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->

	<!-- BEGIN CORE PLUGINS -->

	<script src="media/js/jquery-1.10.1.min.js" type="text/javascript"></script>

	<script src="media/js/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>

	<!-- IMPORTANT! Load jquery-ui-1.10.1.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->

	<script src="media/js/jquery-ui-1.10.1.custom.min.js" type="text/javascript"></script>      

	<script src="media/js/bootstrap.min.js" type="text/javascript"></script>

	<!--[if lt IE 9]>

	<script src="media/js/excanvas.min.js"></script>

	<script src="media/js/respond.min.js"></script>  

	<![endif]-->   

	<script src="media/js/jquery.slimscroll.min.js" type="text/javascript"></script>

	<script src="media/js/jquery.blockui.min.js" type="text/javascript"></script>  

	<script src="media/js/jquery.cookie.min.js" type="text/javascript"></script>

	<script src="media/js/jquery.uniform.min.js" type="text/javascript" ></script>

	<!-- END CORE PLUGINS -->

	<script type="text/javascript" src="media/js/bootstrap-datepicker.js"></script>

	<script src="media/js/jquery.fancybox.pack.js"></script>

	<script src="media/js/app.js"></script>

	<script src="media/js/search.js"></script>      

	<script>

	    jQuery(document).ready(function () {

	        App.init();

	        Search.init();

	    });

	</script>

	<!-- END JAVASCRIPTS -->

<script type="text/javascript">  var _gaq = _gaq || []; _gaq.push(['_setAccount', 'UA-37564768-1']); _gaq.push(['_setDomainName', 'keenthemes.com']); _gaq.push(['_setAllowLinker', true]); _gaq.push(['_trackPageview']); (function () { var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true; ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s); })();</script>
            </form>
            </body>

<!-- END BODY -->

</html>