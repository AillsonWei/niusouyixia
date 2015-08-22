<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchIndex.aspx.cs" Inherits="StockWebApp.SearchIndex" %>

<!DOCTYPE html>

<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->



<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

	<title>牛搜一下</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

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

	<link href="media/css/promo.css" rel="stylesheet" type="text/css"/>

	<link href="media/css/animate.css" rel="stylesheet" type="text/css"/>

	<link rel="shortcut icon" href="media/image/favicon.ico" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="page-header-fixed page-full-width">
<form id="form1" runat="server">
	<!-- BEGIN HEADER -->

	<div class="header navbar navbar-inverse navbar-fixed-top">

		<!-- BEGIN TOP NAVIGATION BAR -->

        <div class="navbar-inner">

            <div class="container">

                <!-- BEGIN LOGO -->
                    <img alt="logo" src="media/image/logo.png">
            </div>
                        
            <!-- END LOGO -->

        </div>
			
		</div>

		<!-- END TOP NAVIGATION BAR -->

	<!-- END HEADER -->

	<!-- BEGIN CONTAINER -->   

	<div class="page-container row-fluid">

		<!-- BEGIN PAGE -->

		<div class="page-content no-min-height">

			<!-- BEGIN PAGE CONTAINER-->

			<div class="container-fluid promo-page">

				<!-- BEGIN PAGE CONTENT-->

				<div class="row-fluid">

					<div class="span12">

						<div class="block-grey">

							<div class="container">

								<div id="promo_carousel" class="carousel slide">

									<div class="carousel-inner">

										<div class="active item">

                                            <div class="row-fluid">

                                                <div class="span7 margin-bottom-20 margin-top-20 animated rotateInUpRight">

                                                    <h1><font style="FONT-SIZE: 50pt; FILTER: shadow(color=#af2dco); WIDTH: 100%; COLOR: #212121; LINE-HEIGHT: 100%; FONT-FAMILY: 华文行楷" size=6>欢迎来到牛搜一下！</font></h1>
                                                    <div>
                                                        <img alt="logo" src="media/image/Large_logo.png">
                                                    </div>
                                                <div>
                                                    &nbsp;<asp:TextBox ID="TXTSearch1" runat="server" Height="30px" Width="397px"></asp:TextBox>
                                                    <asp:Button ID="BTNSearch1" runat="server" BackColor="#D74B39" BorderColor="#D74B39" BorderStyle="Solid" Font-Names="微软雅黑" Font-Size="X-Large" ForeColor="White" Height="50px" Text="牛搜一下" Width="118px" OnClick="BTNSearch1_Click" />
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TXTSearch1" ErrorMessage="*必须输入搜索内容" ForeColor="#CC0000" ValidationGroup="1"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>

												<div class="span5 animated rotateInDownLeft">

													<a href="SearchIndex.aspx"><img src="media/image/img1.png" alt=""></a>

												</div>

											</div>

										</div>

										<div class="item">

											<div class="row-fluid">

												<div class="span5 animated rotateInUpRight">

													<a href="SearchIndex.aspx"><img src="media/image/img1_2.png" alt=""></a>

												</div>

												<div class="span7 margin-bottom-20 animated rotateInDownLeft">

                                                    <h1><font style="FONT-SIZE: 50pt; FILTER: shadow(color=#af2dco); WIDTH: 100%; COLOR: #212121; LINE-HEIGHT: 100%; FONT-FAMILY: 华文行楷" size=6>欢迎来到牛搜一下！</font></h1>

                                                    <div>
                                                        <img alt="logo" src="media/image/Large_logo.png">
                                                    </div>
                                                    <div>
                                                 &nbsp;<asp:TextBox ID="TXTSearch2" runat="server" Height="30px" Width="397px"></asp:TextBox>
                                                    <asp:Button ID="BTNSearch2" runat="server" BackColor="#35A947" BorderColor="#35A947" BorderStyle="Solid" Font-Names="微软雅黑" Font-Size="X-Large" ForeColor="White" Height="50px" Text="牛搜一下" Width="118px" OnClick="BTNSearch2_Click" />
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TXTSearch2" ErrorMessage="*必须输入搜索内容" ForeColor="#CC0000" ValidationGroup="2"></asp:RequiredFieldValidator>
                                                </div>

												</div>

											</div>

										</div>

									</div>

									<a class="carousel-control left" href="#promo_carousel" data-slide="prev">

									<i class="m-icon-big-swapleft m-icon-white"></i>

									</a>

									<a class="carousel-control right" href="#promo_carousel" data-slide="next">

									<i class="m-icon-big-swapright m-icon-white"></i>

									</a>

								</div>

							</div>

						</div>

						<div class="block-yellow">

							<div class="container">

								<div class="row-fluid">

									<div class="span5 margin-bottom-20">

										<a href="SearchIndex.aspx"><img src="media/image/img2.png" alt=""></a>

									</div>

									<div class="span7">

										<h2><font style="FONT-SIZE: 50pt; FILTER: shadow(color=#af2dco); WIDTH: 100%; COLOR: #212121; LINE-HEIGHT: 100%; FONT-FAMILY: 华文行楷" size=6>关于牛搜一下！</font></h2>

										<p>
                                            <asp:Label ID="Label1" runat="server" Font-Names="微软雅黑" Font-Size="Large" Text="基于Web搜索搜索引擎。。。"></asp:Label>
                                        </p>

										<p>&nbsp;<asp:Label ID="Label2" runat="server" Font-Names="微软雅黑" Font-Size="Large" Text="该网站是由重庆邮电大学软件学院4+1项目组开发的一款基于融资融券的搜索引擎。在这里， 您可以任意查看融资融券的信息，当然我们也会为您提供一定参考意见。我们也在不断地改进 网站，网站不足的地方请您多见谅。"></asp:Label>
                                        </p>
                        

									</div>

								</div>

							</div>

						</div>

					</div>

				</div>

			</div>

			<!-- END PAGE CONTENT-->

		</div>

		<!-- END PAGE CONTAINER--> 

	</div>

	<!-- END PAGE --> 

	<!-- END CONTAINER -->

	<!-- BEGIN FOOTER1 -->

	<div class="footer">

		<div class="container">

			<div class="footer-inner">

				2014 &copy; 牛搜一下，软件工程学院4+1项目组

			</div>

			<div class="footer-tools">

				<span class="go-top">

				<i class="icon-angle-up"></i>

				</span>

			</div>

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

	<script src="media/js/app.js"></script>      

	<script>

	    jQuery(document).ready(function () {

	        App.init();

	        jQuery('#promo_carousel').carousel({

	            interval: 10000,

	            pause: 'hover'

	        });

	    });

	</script>

	<!-- END JAVASCRIPTS -->

<script type="text/javascript">  var _gaq = _gaq || []; _gaq.push(['_setAccount', 'UA-37564768-1']); _gaq.push(['_setDomainName', 'keenthemes.com']); _gaq.push(['_setAllowLinker', true]); _gaq.push(['_trackPageview']); (function () { var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true; ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js'; var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s); })();</script>

</form>

</body>

<!-- END BODY -->

</html>

