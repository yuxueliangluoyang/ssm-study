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
  <title>数字管理系统_用户登录</title>
  <link rel="stylesheet" type="text/css" href="resources/css/style.css" />
  <link rel="stylesheet" type="text/css" href="resources/css/skin_/login.css" />
  <script type="text/javascript" src="resources/js/jquery.js"></script>
  <script type="text/javascript" src="resources/js/jquery.select.js"></script>
</head>
<body>
<div id="container">
    <div id="bd">
    	<div id="main">
    	<form id="loginForm" action="main/successLogin.do" method="post">
        	<div class="login-box">
                <div id="logo"></div>
                <h1></h1>
                <div class="input username" id="username">
                    <label for="userName">用户名</label>
                    <span></span>
                    <input type="text" id="userName" name="userName" required="required"/>
                    <div id="userNameError" class="errorInfo">
                    	<label><font color="red">用户名不存在</font></label>
                    </div>
                </div>
                <div class="input psw" id="psw">
                    <label for="password">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                    <span></span>
                    <input type="password" id="password" name="password" required="required"/>
                    <div id="passwordError" class="errorInfo">
                    	<label><font color="red">用户名密码错误</font></label>
                    </div>
                </div>
                <div class="input validate" id="validate">
                    <label for="valiDate">验证码</label>
                    <input type="text" id="valiDate" name="valiDate" required="required"/>
                    <img id="img" src="#" onclick="refresh()" alt="暂缺" class="value"> 
                </div>
                <div id="btn" class="loginButton">
                    <input type="button" class="button" value="登录"  onclick="checkForm()"/>
                </div>
                <div id="validateError" class="input validate" style="margin-left: 100px;display: none;">
                    <label for="valiDate"><font color="red">验证码错误</font></label>
                </div>
            </div>
        </form>
        </div>
        <div id="ft">CopyRight&nbsp;2014&nbsp;&nbsp;版权所有&nbsp;&nbsp;More Templates <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a> &nbsp;&nbsp;</div>
    </div>
</div>
</body>
<script type="text/javascript" src="resources/js/login.js"></script>
</html>