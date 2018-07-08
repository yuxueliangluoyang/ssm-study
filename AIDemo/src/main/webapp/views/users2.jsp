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
  <title>表格</title>
  
  <link href="http://cdn.bootcss.com/bootstrap-table/1.9.1/bootstrap-table.min.css" rel="stylesheet"/> 
  
</head>
<body>
	<table data-toggle="table" id="table">
	</table>
</body>
<script type="text/javascript" src="resources/js/jquery.js"></script>
<script src="resources/js/bootstrap/bootstrap-table_1.9.1_bootstrap-table.min.js"></script>
<script src="resources/js/bootstrap/bootstrap-table_1.9.1_locale_bootstrap-table-zh-CN.min.js"></script>
<script type="text/javascript">
$('#table').bootstrapTable({
url: "main/getUserList.do", 
dataType: "json",
pagination: true,
singleSelect: false,
search: true,
sidePagination: "server", //服务端处理分页
      columns: [
              {
                title: 'id',
                  field: 'id',
                  align: 'center',
                  valign: 'middle'
              }, 
              {
                  title: '姓名',
                  field: 'userName',
                  align: 'center',
                  valign: 'middle',
              }, 
              {
                  title: '密码',
                  field: 'password',
                  align: 'center'
              },
              {
                  title: '年龄',
                  field: 'age',
                  align: 'center'
              },
              {
                  title: '操作',
                  field: 'id',
                  align: 'center',
                  formatter:function(value,row,index){  
               		var e = '<a href="#" mce_href="#" onclick="edit(\''+ row.id + '\')">编辑</a> ';  
               		var d = '<a href="#" mce_href="#" onclick="del(\''+ row.id +'\')">删除</a> ';  
                  return e+d;  
                } 
              }
          ]
  });
</script>
</html>