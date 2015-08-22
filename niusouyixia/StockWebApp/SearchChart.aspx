<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchChart.aspx.cs" Inherits="StockWebApp.StockChart" %>
<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head runat="server">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>折线图</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

    <!--自适应屏幕分辨率-->

	<meta content="" name="description" />

	<meta content="" name="author" />

	<!-- BEGIN GLOBAL MANDATORY STYLES -->

	<link href="media/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="media/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<!-- END GLOBAL MANDATORY STYLES -->

	<link rel="shortcut icon" href="media/image/favicon.ico" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed">
<form id="form1" runat="server">
    	<!-- BEGIN HEADER -->
      <script type="text/javascript">
          function showdate(n) {
              var uom = new Date();
              uom.setDate(uom.getDate() + n);
              return new Date(uom.getFullYear(), uom.getMonth(), uom.getDate()).getTime();
          }
          var date1 = [showdate(shuzi[0]), showdate(shuzi[1]), showdate(shuzi[2]), showdate(shuzi[3]), showdate(shuzi[4]), showdate(shuzi[5]), showdate(shuzi[6]), showdate(shuzi[7]), showdate(shuzi[8]), showdate(shuzi[9]), showdate(shuzi[10]), showdate(shuzi[11]), showdate(shuzi[12]), showdate(shuzi[13]), showdate(shuzi[14]), showdate(shuzi[15]), showdate(shuzi[16]), showdate(shuzi[17]), showdate(shuzi[18]), showdate(shuzi[19]), showdate(shuzi[20]), showdate(shuzi[21]), showdate(shuzi[22]), showdate(shuzi[23]), showdate(shuzi[24]), showdate(shuzi[25]), showdate(shuzi[26]), showdate(shuzi[27]), showdate(shuzi[28]), showdate(shuzi[29])];
    </script>
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

		<!-- END TOP NAVIGATION BAR -->

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

								<a href="SearchIndex.aspx">主页</a> 

								<i class="icon-angle-right"></i>

							</li>

							<li>融资融券变化图</li>

						</ul>

						<!-- END PAGE TITLE & BREADCRUMB-->

					</div>

				</div>

				<!-- END PAGE HEADER-->

				<!-- BEGIN CHART PORTLETS-->

				<div class="row-fluid">

					<div class="span12">
               
						<!-- BEGIN INTERACTIVE CHART PORTLET-->

						<div class="portlet box red">

							<div class="portlet-title">

								<div class="caption"><i class="icon-reorder"></i>融资余额</div>

								<div class="tools">

									<a href="javascript:;" class="collapse"></a>

									<a href="#portlet-config" data-toggle="modal" class="config"></a>

									<a href="javascript:;" class="reload"></a>

									<a href="javascript:;" class="remove"></a>

								</div>

							</div>

							<div class="portlet-body">

								<div id="chart_1" class="chart"></div>

							</div>

						</div>

						<!-- END INTERACTIVE CHART PORTLET--> 
                        <!-- BEGIN INTERACTIVE CHART PORTLET-->

                        <div class="portlet box red">

                            <div class="portlet-title">

                                <div class="caption"><i class="icon-reorder"></i>融资买入额</div>

                                <div class="tools">

                                    <a href="javascript:;" class="collapse"></a>

                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>

                                    <a href="javascript:;" class="reload"></a>

                                    <a href="javascript:;" class="remove"></a>

                                </div>

                            </div>

                            <div class="portlet-body">

                                <div id="chart_2" class="chart"></div>

                            </div>

                        </div>

                        <!-- END INTERACTIVE CHART PORTLET-->
                        <!-- BEGIN INTERACTIVE CHART PORTLET-->

                        <div class="portlet box red">

                            <div class="portlet-title">

                                <div class="caption"><i class="icon-reorder"></i>融券余量</div>

                                <div class="tools">

                                    <a href="javascript:;" class="collapse"></a>

                                    <a href="#portlet-config" data-toggle="modal" class="config"></a>

                                    <a href="javascript:;" class="reload"></a>

                                    <a href="javascript:;" class="remove"></a>

                                </div>

                            </div>

                            <div class="portlet-body">

                                <div id="chart_3" class="chart"></div>

                            </div>

                        </div>

                        <!-- END INTERACTIVE CHART PORTLET-->                

                        <!-- BEGIN INTERACTIVE CHART PORTLET-->

						<div class="portlet box red">

							<div class="portlet-title">

								<div class="caption"><i class="icon-reorder"></i>融券卖出量</div>

								<div class="tools">

									<a href="javascript:;" class="collapse"></a>

									<a href="#portlet-config" data-toggle="modal" class="config"></a>

									<a href="javascript:;" class="reload"></a>

									<a href="javascript:;" class="remove"></a>

								</div>

							</div>

							<div class="portlet-body">

								<div id="chart_4" class="chart"></div>

							</div>

						</div>

						<!-- END INTERACTIVE CHART PORTLET--> 
					</div>

				</div>

				<!-- END CHART PORTLETS-->
                					<div class="portlet box red">

						<!-- BEGIN SAMPLE TABLE PORTLET-->

						<div class="portlet box red">

							<div class="portlet-title">

								<div class="caption">特色分析（一周）</div>

								<div class="tools">

									<a href="javascript:;" class="collapse"></a>

									<a href="#portlet-config" data-toggle="modal" class="config"></a>

									<a href="javascript:;" class="reload"></a>

									<a href="javascript:;" class="remove"></a>

								</div>

							</div>

							<div class="portlet-body">

								<table class="table table-hover" >

									<thead>

										<tr>

											<th>#</th>

											<th>融资余额</th>

											<th>融资买入额</th>

											<th class="hidden-480">融券余量</th>

											<th>融券卖出量</th>

										</tr>

									</thead>

									<tbody>

										<tr>

											<td>变化率</td>

											<td>
                                                <asp:Label ID="lbl1" runat="server"></asp:Label>
                                            </td>

											<td>
                                                <asp:Label ID="lbl2" runat="server"></asp:Label>
                                            </td>

											<td class="hidden-480">
                                                <asp:Label ID="lbl3" runat="server"></asp:Label>
                                            </td>

											<td>
                                                <asp:Label ID="lbl4" runat="server"></asp:Label>
                                            </td>

										</tr>

										<tr>

											<td>平均变化率</td>

											<td colspan="4">
                                                <asp:Label ID="lbl5" runat="server"></asp:Label>
                                            </td>

										</tr>

										<tr>

											<td>特色分析结论</td>

											<td colspan="4">
                                                <asp:Label ID="lbl6" runat="server"></asp:Label>
                                            </td>

										</tr>

									</tbody>

								</table>

							</div>

						</div>

						<!-- END SAMPLE TABLE PORTLET-->

					</div>
				<!-- END PAGE CONTENT-->

			</div>

			<!-- BEGIN PAGE CONTAINER-->     

		</div>

		<!-- END PAGE --> 

	</div>

	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER -->

	<div class="footer">

		<div class="footer-inner">

			2014 &copy;牛搜一下，软件工程学院4+1项目部

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

	<!-- BEGIN PAGE LEVEL PLUGINS -->

	<script src="media/js/jquery.flot.js"></script>

	<script src="media/js/jquery.flot.resize.js"></script>

	<script src="media/js/jquery.flot.pie.js"></script>

	<script src="media/js/jquery.flot.stack.js"></script>

	<script src="media/js/jquery.flot.crosshair.js"></script>

	<!-- END PAGE LEVEL PLUGINS -->

	<!-- BEGIN PAGE LEVEL SCRIPTS -->

	<script src="media/js/app.js"></script>

	<script>
	    var Charts = function () {

	        return {
	            //main function to initiate the module


	            initCharts: function () {
	                //Interactive Chart
	                function chart1() {
	                    var getremaining = [
                            [date1[0], number1[0]],
                            [date1[1], number1[1]],
                            [date1[2], number1[2]],
                            [date1[3], number1[3]],
                            [date1[4], number1[4]],
                            [date1[5], number1[5]],
                            [date1[6], number1[6]],
                            [date1[7], number1[7]],
                            [date1[8], number1[8]],
                            [date1[9], number1[9]],
                            [date1[10], number1[10]],
                            [date1[11], number1[11]],
                            [date1[12], number1[12]],
                            [date1[13], number1[13]],
                            [date1[14], number1[14]],
                            [date1[15], number1[15]],
                            [date1[16], number1[16]],
                            [date1[17], number1[17]],
                            [date1[18], number1[18]],
                            [date1[19], number1[19]],
	                    ];
	                    var plot = $.plot($("#chart_1"), [{
	                        data: getremaining,
	                        label: "融资余额（元）"
	                    },
	                    ], {
	                        series: {
	                            lines: {
	                                show: true,
	                                lineWidth: 2,
	                                fill: true,
	                                fillColor: {
	                                    colors: [{
	                                        opacity: 0.05
	                                    }, {
	                                        opacity: 0.01
	                                    }
	                                    ]
	                                }
	                            },
	                            points: {
	                                show: true
	                            },
	                            shadowSize: 2
	                        },
	                        grid: {
	                            hoverable: true,
	                            clickable: true,
	                            tickColor: "#eee",
	                            borderWidth: 0
	                        },
	                        colors: ["#d12610"],
	                        xaxis: {
	                            ticks: 11,
	                            tickDecimals: 0
	                        },
	                        yaxis: {
	                            ticks: 11,
	                            tickDecimals: 0
	                        }
	                    });


	                    function showTooltip(x, y, contents) {
	                        $('<div id="tooltip">' + contents + '</div>').css({
	                            position: 'absolute',
	                            display: 'none',
	                            top: y + 5,
	                            left: x + 15,
	                            border: '1px solid #333',
	                            padding: '4px',
	                            color: '#fff',
	                            'border-radius': '3px',
	                            'background-color': '#333',
	                            opacity: 0.80
	                        }).appendTo("body").fadeIn(200);
	                    }

	                    var previousPoint = null;
	                    $("#chart_1").bind("plothover", function (event, pos, item) {
	                        $("#x").text(pos.x.toFixed(2));
	                        $("#y").text(pos.y.toFixed(2));

	                        if (item) {
	                            if (previousPoint != item.dataIndex) {
	                                previousPoint = item.dataIndex;


	                                $("#tooltip").remove();
	                                var x = item.datapoint[0],
                                        y = item.datapoint[1];
	                                var month = new Date(x).getMonth() + 1;
	                                var year = new Date(x).getFullYear();
	                                var day = new Date(x).getDate();
	                                showTooltip(item.pageX, item.pageY, item.series.label + year + "年" + month + "月" + day + "日" + " = " + y + "元");
                                }
                            } else {
                                $("#tooltip").remove();
                                previousPoint = null;
	                        }
	                    });
	                }
	                function chart2() {
	                    var getpurchases = [
                            [date1[0], number2[0]],
                            [date1[1], number2[1]],
                            [date1[2], number2[2]],
                            [date1[3], number2[3]],
                            [date1[4], number2[4]],
                            [date1[5], number2[5]],
                            [date1[6], number2[6]],
                            [date1[7], number2[7]],
                            [date1[8], number2[8]],
                            [date1[9], number2[9]],
                            [date1[10], number2[10]],
                            [date1[11], number2[11]],
                            [date1[12], number2[12]],
                            [date1[13], number2[13]],
                            [date1[14], number2[14]],
                            [date1[15], number2[15]],
                            [date1[16], number2[16]],
                            [date1[17], number2[17]],
                            [date1[18], number2[18]],
                            [date1[19], number2[19]],
	                    ];
	                    var plot = $.plot($("#chart_2"), [{
	                        data: getpurchases,
	                        label: "融资买入额（元）"
	                    },
	                    ], {
	                        series: {
	                            lines: {
	                                show: true,
	                                lineWidth: 2,
	                                fill: true,
	                                fillColor: {
	                                    colors: [{
	                                        opacity: 0.05
	                                    }, {
	                                        opacity: 0.01
	                                    }
	                                    ]
	                                }
	                            },
	                            points: {
	                                show: true
	                            },
	                            shadowSize: 2
	                        },
	                        grid: {
	                            hoverable: true,
	                            clickable: true,
	                            tickColor: "#eee",
	                            borderWidth: 0
	                        },
	                        colors: ["#37b7f3"],
	                        xaxis: {
	                            ticks: 11,
	                            tickDecimals: 0
	                        },
	                        yaxis: {
	                            ticks: 11,
	                            tickDecimals: 0
	                        }
	                    });


	                    function showTooltip(x, y, contents) {
	                        $('<div id="tooltip">' + contents + '</div>').css({
	                            position: 'absolute',
	                            display: 'none',
	                            top: y + 5,
	                            left: x + 15,
	                            border: '1px solid #333',
	                            padding: '4px',
	                            color: '#fff',
	                            'border-radius': '3px',
	                            'background-color': '#333',
	                            opacity: 0.80
	                        }).appendTo("body").fadeIn(200);
	                    }

	                    var previousPoint = null;
	                    $("#chart_2").bind("plothover", function (event, pos, item) {
	                        $("#x").text(pos.x.toFixed(2));
	                        $("#y").text(pos.y.toFixed(2));

	                        if (item) {
	                            if (previousPoint != item.dataIndex) {
	                                previousPoint = item.dataIndex;

	                                $("#tooltip").remove();
	                                var x = item.datapoint[0],
                                        y = item.datapoint[1];
	                                var month = new Date(x).getMonth()+1;
	                                var year = new Date(x).getFullYear();
	                                var day = new Date(x).getDate();
	                                showTooltip(item.pageX, item.pageY, item.series.label + year + "年" + month + "月" + day + "日" + " = " + y + "元");
                                }
                            } else {
                                $("#tooltip").remove();
                                previousPoint = null;
	                        }
	                    });
	                }
	                function chart3() {
	                    var getremainquility = [
                            [date1[0], number3[0]],
                            [date1[1], number3[1]],
                            [date1[2], number3[2]],
                            [date1[3], number3[3]],
                            [date1[4], number3[4]],
                            [date1[5], number3[5]],
                            [date1[6], number3[6]],
                            [date1[7], number3[7]],
                            [date1[8], number3[8]],
                            [date1[9], number3[9]],
                            [date1[10], number3[10]],
                            [date1[11], number3[11]],
                            [date1[12], number3[12]],
                            [date1[13], number3[13]],
                            [date1[14], number3[14]],
                            [date1[15], number3[15]],
                            [date1[16], number3[16]],
                            [date1[17], number3[17]],
                            [date1[18], number3[18]],
                            [date1[19], number3[19]],
	                    ];
	                    var plot = $.plot($("#chart_3"), [{
	                        data: getremainquility,
	                        label: "融券余量（股）"
	                    },
	                    ], {
	                        series: {
	                            lines: {
	                                show: true,
	                                lineWidth: 2,
	                                fill: true,
	                                fillColor: {
	                                    colors: [{
	                                        opacity: 0.05
	                                    }, {
	                                        opacity: 0.01
	                                    }
	                                    ]
	                                }
	                            },
	                            points: {
	                                show: true
	                            },
	                            shadowSize: 2
	                        },
	                        grid: {
	                            hoverable: true,
	                            clickable: true,
	                            tickColor: "#eee",
	                            borderWidth: 0
	                        },
	                        colors: ["#52e136"],
	                        xaxis: {
	                            ticks: 11,
	                            tickDecimals: 0
	                        },
	                        yaxis: {
	                            ticks: 11,
	                            tickDecimals: 0
	                        }
	                    });


	                    function showTooltip(x, y, contents) {
	                        $('<div id="tooltip">' + contents + '</div>').css({
	                            position: 'absolute',
	                            display: 'none',
	                            top: y + 5,
	                            left: x + 15,
	                            border: '1px solid #333',
	                            padding: '4px',
	                            color: '#fff',
	                            'border-radius': '3px',
	                            'background-color': '#333',
	                            opacity: 0.80
	                        }).appendTo("body").fadeIn(200);
	                    }

	                    var previousPoint = null;
	                    $("#chart_3").bind("plothover", function (event, pos, item) {
	                        $("#x").text(pos.x.toFixed(2));
	                        $("#y").text(pos.y.toFixed(2));

	                        if (item) {
	                            if (previousPoint != item.dataIndex) {
	                                previousPoint = item.dataIndex;


	                                $("#tooltip").remove();
	                                var x = item.datapoint[0],
                                        y = item.datapoint[1];
	                                var month = new Date(x).getMonth() + 1;
	                                var year = new Date(x).getFullYear();
	                                var day = new Date(x).getDate();
	                                showTooltip(item.pageX, item.pageY, item.series.label + year + "年" + month + "月" + day + "日" + " = " + y + "股");
                                }
                            } else {
                                $("#tooltip").remove();
                                previousPoint = null;
	                        }
	                    });
	                }
	                function chart4(){
	                    var getsellquantity = [
                            [date1[0], number4[0]],
                            [date1[1], number4[1]],
                            [date1[2], number4[2]],
                            [date1[3], number4[3]],
                            [date1[4], number4[4]],
                            [date1[5], number4[5]],
                            [date1[6], number4[6]],
                            [date1[7], number4[7]],
                            [date1[8], number4[8]],
                            [date1[9], number4[9]],
                            [date1[10], number4[10]],
                            [date1[11], number4[11]],
                            [date1[12], number4[12]],
                            [date1[13], number4[13]],
                            [date1[14], number4[14]],
                            [date1[15], number4[15]],
                            [date1[16], number4[16]],
                            [date1[17], number4[17]],
                            [date1[18], number4[18]],
                            [date1[19], number4[19]],
	                    ];
	                    var plot = $.plot($("#chart_4"), [{
	                        data: getsellquantity,
	                        label: "融券卖出量（股）"
	                    },
	                    ], {
	                        series: {
	                            lines: {
	                                show: true,
	                                lineWidth: 2,
	                                fill: true,
	                                fillColor: {
	                                    colors: [{
	                                        opacity: 0.05
	                                    }, {
	                                        opacity: 0.01
	                                    }
	                                    ]
	                                }
	                            },
	                            points: {
	                                show: true
	                            },
	                            shadowSize: 2
	                        },
	                        grid: {
	                            hoverable: true,
	                            clickable: true,
	                            tickColor: "#eee",
	                            borderWidth: 0
	                        },
	                        colors: ["#fed700"],
	                        xaxis: {
	                            ticks: 11,
	                            tickDecimals: 0
	                        },
	                        yaxis: {
	                            ticks: 11,
	                            tickDecimals: 0
	                        }
	                    });


	                    function showTooltip(x, y, contents) {
	                        $('<div id="tooltip">' + contents + '</div>').css({
	                            position: 'absolute',
	                            display: 'none',
	                            top: y + 5,
	                            left: x + 15,
	                            border: '1px solid #333',
	                            padding: '4px',
	                            color: '#fff',
	                            'border-radius': '3px',
	                            'background-color': '#333',
	                            opacity: 0.80
	                        }).appendTo("body").fadeIn(200);
	                    }

	                    var previousPoint = null;
	                    $("#chart_4").bind("plothover", function (event, pos, item) {
	                        $("#x").text(pos.x.toFixed(2));
	                        $("#y").text(pos.y.toFixed(2));

	                        if (item) {
	                            if (previousPoint != item.dataIndex) {
	                                previousPoint = item.dataIndex;

	                                $("#tooltip").remove();
	                                var x = item.datapoint[0],
                                        y = item.datapoint[1];
	                                var month = new Date(x).getMonth() + 1;
	                                var year = new Date(x).getFullYear();
	                                var day = new Date(x).getDate();
	                                showTooltip(item.pageX, item.pageY, item.series.label + year + "年" + month + "月" + day + "日" + " = " + y + "股");
                                }
                            } else {
                                $("#tooltip").remove();
                                previousPoint = null;
	                        }
	                    });
	                }
	                //graph
	                chart1();
	                chart2();
	                chart3();
	                chart4();

	            },

	        };

	    }();
    </script>      

	<script>

	    jQuery(document).ready(function () {

	        // initiate layout and plugins

	        App.init();

	        Charts.initCharts();

	    });

	</script>

	<!-- END PAGE LEVEL SCRIPTS -->
</form>
</body>

<!-- END BODY -->

</html>

