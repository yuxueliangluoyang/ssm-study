var height = $(window).height() > 445 ? $(window).height() : 445;
	$("#container").height(height);
	var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
	$('#bd').css('padding-top', bdheight);
	$(window).resize(function(e) {
        var height = $(window).height() > 445 ? $(window).height() : 445;
		$("#container").height(height);
		var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
		$('#bd').css('padding-top', bdheight);
    });
$('select').select();
//登录校验
function checkForm(){
	var loginObj = new Object();
    loginObj.userName= $("#userName").val();
    loginObj.password= $("#password").val();
    loginObj.valiDate= $("#valiDate").val();
    var loginJson = JSON.stringify(loginObj); //将JSON对象转化为JSON字符  
    $.post('main/validateLogin.do',
        {"loginObj":loginJson},
        function(result){
          	result=JSON.parse(result); //由JSON字符串转换为JSON对象
          if(result.accountMsg){
        	  $("#userNameError").show();
        	  $("#passwordError").hide();
        	  $("#validateError").hide();
          }else if (result.pwdMsg){
        	  $("#userNameError").hide();
              $("#passwordError").show();
              $("#validateError").hide();
          }else if (result.valiDate){
        	  $("#userNameError").hide();
        	  $("#passwordError").hide();
        	  $("#validateError").show();
          } else {
        	$("#loginForm").submit();
          }
    });
}
function refresh(){
	var url = "main/checkCode.do?number="+Math.random();
	$("#img").attr("src",url);
}
$(function(){
	var url = "main/checkCode.do?number="+Math.random();
	$("#img").attr("src",url);
});
//非空校验
//function checkField(field){
//	with(field){
//		if (value == null || value == "") {
//			return false;
//		} else {
//			return true;
//		}
//	}
//}
