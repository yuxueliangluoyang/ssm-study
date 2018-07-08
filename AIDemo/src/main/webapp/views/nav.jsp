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
  <title>底部内容页</title>
  <link rel="stylesheet" type="text/css" href="resources/css/style.css" />
  <link rel="stylesheet" href="resources/css/zTreeStyle/zTreeStyle.css" type="text/css">
  <link rel="stylesheet" type="text/css" href="resources/css/skin_/nav.css" />
  <script type="text/javascript" src="resources/js/jquery.js"></script>
  <script type="text/javascript" src="resources/js/global.js"></script>
  <script type="text/javascript" src="resources/js/nav.js"></script>
<script type="text/javascript" src="resources/js/Menu.js"></script>
<script type="text/javascript" src="resources/js/jquery.ztree.core-3.5.js"></script>

</head>
<body>
<div id="container">
	<div id="bd">
    	<div class="sidebar">
        	<div class="sidebar-bg"></div>
            <i class="sidebar-hide"></i>
            <h2><a href="javascript:;"><i class="h2-icon" title="切换到树型结构"></i><span>安全管理</span></a></h2>
            <ul class="nav">
                <li class="nav-li">
                	<a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">新闻管理</span></a>
                    <ul class="subnav">
                    	<li class="subnav-li" href="views/index.jsp" data-id="8"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">新闻视频管理</span></a></li>
                        <li class="subnav-li" href="views/form.jsp" data-id="9"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">新闻频道管理</span></a></li>
                        <li class="subnav-li" href="views/table.jsp" data-id="10"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">地方新闻管理</span></a></li>
                        <li class="subnav-li" data-id="11"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">自定义设置1</span></a></li>
                    </ul>
                </li>
                <li class="nav-li current">
                	<a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">用户信息设置</span></a>
                	<ul class="subnav">
                    	<li class="subnav-li current" href="views/index.jsp" data-id="1"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">首页</span></a></li>
                        <li class="subnav-li" href="views/form.jsp"  data-id="2"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">表单</span></a></li>
                        <li class="subnav-li" href="views/table.jsp" data-id="3"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">表格</span></a></li>
                        <li class="subnav-li" href="views/users.jsp" data-id="4"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">用户信息管理</span></a></li>
                    </ul>
                </li>
                <li class="nav-li">
                	<a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">工作安排</span></a>
                    <ul class="subnav">
                    	<li class="subnav-li" data-id="5"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">工作安排查询1</span></a></li>
                        <li class="subnav-li" data-id="6"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">安排管理1</span></a></li>
                        <li class="subnav-li" data-id="7"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">类型选择1</span></a></li>
                    </ul>
                </li>
                <li class="nav-li last-nav-li">
                	<a href="javascript:;" class="ue-clear"><i class="nav-ivon"></i><span class="nav-text">数据管理</span></a>
                    <ul class="subnav">
                    	<li class="subnav-li" data-id="12"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">工作安排查询2</span></a></li>
                        <li class="subnav-li" data-id="13"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">安排管理2</span></a></li>
                        <li class="subnav-li" data-id="14"><a href="javascript:;" class="ue-clear"><i class="subnav-icon"></i><span class="subnav-text">类型选择2</span></a></li>
                    </ul>
                </li>
            </ul>
            <div class="tree-list outwindow">
            	<div class="tree ztree"></div>
            </div>
        </div>
        <div class="main">
        	<div class="title">
                <i class="sidebar-show"></i>
                <ul class="tab ue-clear">
                   
                </ul>
                <i class="tab-more"></i>
                <i class="tab-close"></i>
            </div>
            <div class="content">
            </div>
        </div>
    </div>
</div>

<div class="more-bab-list">
	<ul></ul>
    <div class="opt-panel-ml"></div>
    <div class="opt-panel-mr"></div>
    <div class="opt-panel-bc"></div>
    <div class="opt-panel-br"></div>
    <div class="opt-panel-bl"></div>
</div>
</body>
<script type="text/javascript">
	var menu = new Menu({
		defaultSelect: $('.nav').find('li[data-id="1"]')	
	});
	
	// 左侧树结构加载
	var setting = {};

		var zNodes =[
			{ name:"新闻管理",
			   children: [
				 { name:"新闻视频管理",icon:'resources/img/skin_/leftlist.png'},
				 { name:"新闻频道管理",icon:'resources/img/skin_/leftlist.png'},
				 { name:"地方新闻管理",icon:'resources/img/skin_/leftlist.png'}
			]},
			{ name:"用户信息设置", open:true,
			   children: [
				 { name:"首页", checked:true,icon:'resources/img/skin_/leftlist.png'},
				 { name:"表单",icon:'resources/img/skin_/leftlist.png'},
				 { name:"表格",icon:'resources/img/skin_/leftlist.png'},
				 { name:"自定义设置",icon:'resources/img/skin_/leftlist.png'}
			]},
			{ name:"工作安排",
			   children: [
				 { name:"工作安排",icon:'resources/img/skin_/leftlist.png'},
				 { name:"安排管理",icon:'resources/img/skin_/leftlist.png'},
				 { name:"类型选择",icon:'resources/img/skin_/leftlist.png'},
				 { name:"自定义设置",icon:'resources/img/skin_/leftlist.png'}
			]},
			{ name:"数据管理",
			   children: [
				 { name:"工作安排",icon:'resources/img/skin_/leftlist.png'},
				 { name:"安排管理",icon:'resources/img/skin_/leftlist.png'},
				 { name:"类型选择",icon:'resources/img/skin_/leftlist.png'},
				 { name:"自定义设置",icon:'resources/img/skin_/leftlist.png'}
			]}
		];

	$.fn.zTree.init($(".tree"), setting, zNodes);
	
	
	$('.sidebar h2').click(function(e) {
        $('.tree-list').toggleClass('outwindow');
		$('.nav').toggleClass('outwindow');
    });
	
	$(document).click(function(e) {
		if(!$(e.target).is('.tab-more')){
			 $('.tab-more').removeClass('active');
			 $('.more-bab-list').hide();
		}
    });
</script>
</html>