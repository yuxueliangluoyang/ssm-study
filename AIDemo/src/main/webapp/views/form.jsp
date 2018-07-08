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
  <title>template</title>
  
  <link rel="stylesheet" type="text/css" href="resources/css/style.css" />
  <link rel="stylesheet" type="text/css" href="resources/css/WdatePicker.css" />
  <link rel="stylesheet" type="text/css" href="resources/css/skin_/form.css" />
  <link href="resources/umeditor/themes/default/_css/umeditor.css" type="text/css" rel="stylesheet">
  <script type="text/javascript" src="resources/js/jquery.js"></script>
  <script type="text/javascript" src="resources/js/global.js"></script>
  <script type="text/javascript" src="resources/js/jquery.select.js"></script>
  <script type="text/javascript" src="resources/js/WdatePicker.js"></script>
  <script type="text/javascript">
	window.UMEDITOR_HOME_URL = 'resources/umeditor/';  // 请换成绝对路径
  </script>
  <script type="text/javascript" src="resources/js/umeditor.config.js"></script>
  <script type="text/javascript" src="resources/js/editor_api.js"></script>
  <script type="text/javascript" src="resources/umeditor/lang/zh-cn/zh-cn.js"></script>
  <script type="text/javascript">
	$('select').select();
	showRemind('input[type=text],textarea','color5');
	UM.getEditor('content');
  </script>
</head>
<body>
<div id="container">
	<div id="hd">
    </div>
    <div id="bd">
    	<div id="main">
            <h2 class="subfild">
            	<span>基本信息</span>
            </h2>
            <div class="subfild-content base-info">
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>文章标题</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="文章标题" />
                    </div>
                    <span class="kv-item-tip">标题字数限制在35个字符</span>
                </div>
                <div class="kv-item ue-clear time">
                	<label><span class="impInfo">*</span>发布时间</label>
                	<div class="kv-item-content">
                    	<input type="text" placeholder="文章标题" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" />
                        <i class="time-icon"></i>
                    </div>
                    <span class="kv-item-tip error">这是一个错误信息</span>
                </div>
                
                <div class="kv-item ue-clear">
                	<label>所在栏目</label>
                	<div class="kv-item-content">
                    	<select>
                        	<option>新闻资讯</option>
                            <option>新闻资讯</option>
                            <option>新闻资讯</option>
                        </select>
                    </div>
                    <span class="kv-item-tip success">成功信息</span>
                </div>
                
                <div class="kv-item ue-clear">
                	<label>是否审核</label>
                	<div class="kv-item-content">
                    	<span class="choose">
                            <span class="checkboxouter">
                                <input type="radio" name="need" />
                                <span class="radio"></span>
                            </span>
                            <span class="text">是</span>
                        </span>
                    	<span class="choose">
                            <span class="checkboxouter">
                                <input type="radio" name="need" />
                                <span class="radio"></span>
                            </span>
                            <span class="text">否</span>
                        </span>
                        
                    </div>
                    <span class="kv-item-tip">标题字数限制在35个字符</span>
                </div>
                
                
                <div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>缩略图</label>
                	<div class="kv-item-content file">
						<span class="text"></span>
                        <input type="file" />
                        <input type="button" class="button normal long2" value="浏览.." />
                    </div>
                    <span class="kv-item-tip">标题字数限制在35个字符</span>
                </div>
            </div>
            
            <h2 class="subfild">
            	<span>备注资料</span>
            </h2>
            
            <div class="subfild-content remarkes-info">
            	<div class="kv-item ue-clear">
                	<label><span class="impInfo">*</span>文章内容</label>
                	<div class="kv-item-content">
                    	<textarea placeholder="文章内容" id="content" style="width:800px;height:240px;"></textarea>
                    </div>
                </div>
            </div>
            
            <div class="buttons">
                <input class="button" type="button" value="确认修改" />
            </div>
        </div>
    </div>
</div>
    
</body>
</html>