<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <base href="<%=basePath%>">
  <title>首页</title>
  <link rel="stylesheet" type="text/css" href="resources/css/style.css" />
  <link rel="stylesheet" type="text/css" href="resources/css/skin_/index.css" />
  <script type="text/javascript" src="resources/js/jquery.js"></script>
  <script type="text/javascript" src="resources/js/global.js"></script>
  <script type="text/javascript" src="resources/js/jquery-ui-1.9.2.custom.min.js"></script>
  <script type="text/javascript">
	var minwidth = 282;
	resizeWidth();
	$(top.window).resize(function(e) {
       resizeWidth();
    });
	$(function() {
		$( ".content-list" ).sortable({
		  revert: true,
		  handle:'h2'
		});
		
	});
	
function resizeWidth (){
	if($('#main').width() / 3 < minwidth){
		$('.content-item').width(($('#main').width() / 2) - 15);
	}else{
		$('.content-item').width(($('#main').width() / 3) - 15);	
	}
		
}
</script>
</head>
<body>
<div id="container">
	<div id="hd">
    </div>
    <div id="bd">
    	<div id="main">
            <ul class="nav-list ue-clear">
            	<li class="nav-item desk">
                	<a href="main/index.do">
                        <p class="icon"></p>
                        <p class="title">我的桌面</p>
                    </a>
                </li>
                <li class="nav-item news">
                	<a href="main/index.do">
                        <p class="icon"></p>
                        <p class="title">新闻资讯</p>
                    </a>
                </li>
                <li class="nav-item notice">
                	<a href="main/index.do">
                        <p class="icon"></p>
                        <p class="title">公告通知</p>
                    </a>
                </li>
                
                <li class="nav-item plan">
                	<a href="main/index.do">
                        <p class="icon"></p>
                        <p class="title">工作计划</p>
                    </a>
                </li>
                <li class="nav-item contacts">
                	<a href="main/index.do">
                        <p class="icon"></p>
                        <p class="title">通讯录</p>
                    </a>
                </li>
                <li class="nav-item mail">
                	<a href="main/index.do">
                        <p class="icon"></p>
                        <p class="title">我的邮件</p>
                    </a>
                </li>
                <li class="nav-item logs">
                	<a href="main/index.do">
                        <p class="icon"></p>
                        <p class="title">我的日志</p>
                    </a>
                </li>
                <li class="nav-item dosthings">
                	<a href="main/index.do">
                        <p class="icon"></p>
                        <p class="title">待办事宜</p>
                    </a>
                </li>
                <li class="nav-item fav">
                	<a href="main/index.do">
                        <p class="icon"></p>
                        <p class="title">收藏夹</p>
                    </a>
                </li>
                
                <li class="nav-item browser">
                	<a href="main/index.do">
                        <p class="icon"></p>
                        <p class="title">浏览器</p>
                    </a>
                </li>
            </ul>
            
            <ul class="content-list">
            	<li class="content-item system">
                	<h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <span class="setting" title="设置"></span>
                            <span class="report" title="导出"></span>
                            <span class="close" title="关闭"></span>
                        </span>
                    	<span class="title">系统概况</span>
                        
                    </h2>
                    <div class="content-bd">
                    	<img src="resources/img/skin_/pic1.png" />
                    </div>
                </li>
                <li class="content-item dothings">
                	<h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <span class="setting" title="设置"></span>
                            <span class="report" title="导出"></span>
                            <span class="close" title="关闭"></span>
                        </span>
                    	<span class="title">待办事项</span>
                    </h2>
                    <div class="content-bd">
                    	<ul class="content-list things">
                        	<li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">查干湖冬捕壮观景象</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">江西新余：一座城为重病男童圆梦</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">学生建4.5平米1室1厅1厨1卫 欲申请专利</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">央视直播曝光中纪委办公区</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">盘点那些年曾“脱光光”的十大女星</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="content-item richeng">
                	<h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <span class="setting" title="设置"></span>
                            <span class="report" title="导出"></span>
                            <span class="close" title="关闭"></span>
                        </span>
                    	<span class="title">日程安排</span>
                    </h2>
                    <div class="content-bd">
                    	<ul class="content-list things">
                        	<li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">查干湖冬捕壮观景象</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">江西新余：一座城为重病男童圆梦</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">学生建4.5平米1室1厅1厨1卫 欲申请专利</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">央视直播曝光中纪委办公区</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">盘点那些年曾“脱光光”的十大女星</a>
                            </li>
                        </ul>
                    </div>
                </li>
                
                <li class="content-item system">
                	<h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <span class="setting" title="设置"></span>
                            <span class="report" title="导出"></span>
                            <span class="close" title="关闭"></span>
                        </span>
                    	<span class="title">数据统计</span>
                    </h2>
                    <div class="content-bd">
                    	<img src="resources/img/skin_/pic2.png" />
                    </div>
                </li>
                
                <li class="content-item news">
                	<h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <span class="setting" title="设置"></span>
                            <span class="report" title="导出"></span>
                            <span class="close" title="关闭"></span>
                        </span>
                    	<span class="title">新闻资讯</span>
                    </h2>
                    <div class="content-bd">
                    	<ul class="content-list things">
                        	<li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">查干湖冬捕壮观景象</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">江西新余：一座城为重病男童圆梦</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">学生建4.5平米1室1厅1厨1卫 欲申请专利</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">央视直播曝光中纪委办公区</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">盘点那些年曾“脱光光”的十大女星</a>
                            </li>
                        </ul>
                    </div>
                </li>
                
                <li class="content-item news">
                	<h2 class="content-hd">
                    	<span class="opt">
                        	<span class="refresh" title="刷新"></span>
                            <span class="setting" title="设置"></span>
                            <span class="report" title="导出"></span>
                            <span class="close" title="关闭"></span>
                        </span>
                    	<span class="title">我的邮件</span>
                    </h2>
                    <div class="content-bd">
                    	<ul class="content-list things">
                        	<li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">查干湖冬捕壮观景象</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">江西新余：一座城为重病男童圆梦</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">学生建4.5平米1室1厅1厨1卫 欲申请专利</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">央视直播曝光中纪委办公区</a>
                            </li>
                            <li class="content-list-item">
                            	<i class="icon"></i>
                                <a href="javascript:;">盘点那些年曾“脱光光”的十大女星</a>
                            </li>
                        </ul>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>
    
</body>
</html>