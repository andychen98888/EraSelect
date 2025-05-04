<%@page import="uuu.es.entity.Customer"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<!-- <%@ page pageEncoding="UTF-8" %> -->
<!DOCTYPE html>
<!-- html註解:ctrl+shift+c
 
	input 單行輸入項
	<textarea></textarea>多行輸入項
	有name才會回傳
	-->

<html>
	<head>
		<link rel="apple-touch-icon" sizes="180x180" href="../favicon/apple-touch-icon.png">
		<link rel="icon" type="image/png" sizes="32x32" href="../favicon/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="16x16" href="../favicon/favicon-16x16.png">
		<link rel="manifest" href="../favicon/site.webmanifest">
		<link rel="mask-icon" href="../favicon/safari-pinned-tab.svg" color="#5bbad5">
		<meta name="msapplication-TileColor" content="#da532c">
		<meta name="theme-color" content="#ffffff">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<title>修改會員</title>
		<link rel="stylesheet" type="text/css" href="../style/es.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		
		<script>
			$(init);//$(document).ready(init);
			function init(){ //把表單從記憶體帶回
// 				alert(1);
			$("#changePwd").on("click",changePassword); //要打開
// 			$("#theCheckbox2").on("click",displayPWD2);
			$(":checkbox").on("change",displayPWD3);
				<% if(request.getMethod().equals("POST")){ %> //第一次為get請求，輸入完需傳送form為post請求
					//修改失敗要呼叫[repopulateFormData()]
					repopulateFormData();
			}
			
			function repopulateFormData(){
				$("input[name=id]").val("<%= request.getParameter("id")%>");
				$("input[name=email]").val("<%= request.getParameter("email")%>");
				$("input[name=phone]").val("<%= request.getParameter("phone")%>");
				$("input[name=password1]").val("<%= request.getParameter("password1")%>");
				$("input[name=name]").val("<%= request.getParameter("name")%>");
				$("input[name=birthday]").val("<%= request.getParameter("birthday")%>");
				$("textarea[name=address]").text("<%= request.getParameter("address")%>");<%-- val.  --%>
				
 				$("input[name=gender][value='<%= request.getParameter("gender")%>']").prop('checked',true); <%-- attr.--%>
				$("input[name=subscribed]").prop("checked",<%= request.getParameter("subscribed")!=null %>);

				<% }else{ %>
				
				//進入修改時帶入會員資料
				$("input[name=id]").val("${sessionScope.member.getId()}");
				$("input[name=email]").val("${sessionScope.member.getEmail()}");
				$("input[name=phone]").val("${sessionScope.member.getPhone()}");
				$("input[name=name]").val("${sessionScope.member.getName()}");
				$("input[name=birthday]").val("${sessionScope.member.getBirthday()}");
				$("textarea[name=address]").text("${sessionScope.member.getAddress()}");<%-- val.  --%>
				
 				$("input[name=gender][value=${sessionScope.member.getGender()}").prop('checked',true); <%-- attr.--%>
				$("input[name=subscribed]").prop("checked",${sessionScope.member.isSubscribed()});
			
			
				<% } %>
			}	
				
            function refreshCaptcha(){
                //alert("refreshCaptcha");
                //var captchaImg = document.getElementById("captchaImg");
                captchaImg.src = "../images/captcha.png?refresh="+new Date();
            }
            function displayPWD(){
            	//alert(theCheckbox.checked);
            	if(theCheckbox.checked){ //打勾
            		thePassword.type="text";
            	}else{
            		thePassword.type="password";
            	}
            }
            function displayPWD2(e){
            	if(e.target.checked){
            		$("#newPassword").attr("type","text");
            	}else{
            		$("#newPassword").attr("type","password");
            	}
            }
            function displayPWD3(e){
//             	alert(1);
            	var pwd = $("#"+e.target.dataset.target);
            	console.log(pwd);
            	if(e.target.checked){
            		pwd.attr("type","text");
            	}else{
            		pwd.attr("type","password");
            	}
            }
            function changePassword(e){
//              	alert(theCheckbox.checked);
             	if(e.target.checked){ //打勾
//              		thePassword.type="text";
//              		$("#newPassword").prop("disabled",false);
//              		$("#theCheckbox2").prop("disabled",false);
             		$("#newPassword").removeAttr("disabled");
             		$("#theCheckbox2").removeAttr("disabled");

             	}else{
//              		$("#newPassword").prop("disabled",true);
//              		$("#theCheckbox2").prop("disabled",true);
            		$("#newPassword").attr("disabled","");
             		$("#theCheckbox2").attr("disabled","");
             	}
            }
        </script>
        <style>
        	#theErrorsDiv{color:red;}
        	article{
/*          	 text-align: center;  */
         	 width: 54ex;
	       	 margin-left:760px;
        	}
        	.updateLabel{
        		display: inline-block; /*要設定成inline-block才能調製整*/
         		min-width: 6em;  /*5個字寬*/
        	}
        	.buttonStyled{
        		margin-left: 112px;
        	}
        	h3,.subscribedLabel{
        		margin-left: 140px;
        	}
        	.updateP>input{
        		width: 17.5em;
        		height:25px;
        	}
        	#thePassword,#newPassword{
        		width: 17.5em;
        		height:25px;
        	}
        </style>
	</head>
<body>
	<jsp:include page="../subviews/header.jsp"><jsp:param value="Register" name="subheader"/></jsp:include>
<%-- 	<%@include file="./subviews/nav.jsp" %> --%>
	<article>
	<%
		List<String> errors = (List<String>)request.getAttribute("errors");
	%>
	<div id="theErrorsDiv">
	<%=	(errors!=null?errors:"")%>
	</div>
	<h3>修改會員</h3>
	<form action="update.do" method="POST"> <!--回傳form標籤裡的輸入項目 update.do-->
		<p class="updateP">
			<label class="updateLabel">身分證字號:</label>
			<input type="text" name="id" readonly placeholder="請輸入ROC ID" pattern="[A-Z][1289][0-9]{8}">
		</p>
		<p class="updateP">
			<label class="updateLabel">email:</label>
			<input type="email" name="email" required placeholder="請輸入email">
		</p>
		<p class="updateP">
			<label class="updateLabel">手機:</label>
			<input type="tel" name="phone" required placeholder="請輸入手機">
		</p>
		<p class="updateP2">
			<label class="updateLabel">原密碼:</label>
			<input id="thePassword" type="password" name="password" required placeholder="請輸入密碼" minlength="<%= Customer.MIN_PWD_LENGTH %>" maxlength="<%= Customer.MAX_PWD_LENGTH %>">
<!-- 			<br><label>確認:</label> -->
<!-- 			<input type="password" name="password2" required placeholder="請再次輸入密碼"><br> -->
			<input id="theCheckbox" type="checkbox"  data-target="thePassword"><label>顯示密碼</label><!--  onchange="displayPWD()"-->
		</p>
		<fieldset>
			<legend><input id="changePwd" type="checkbox" name="changePwd" >修改密碼</legend>
			<label class="updateLabel">新密碼:</label>
			<input id="newPassword" type="password" name="newPassword" required disabled placeholder="請輸入新密碼" minlength="<%= Customer.MIN_PWD_LENGTH %>" maxlength="<%= Customer.MAX_PWD_LENGTH %>">
			<input id="theCheckbox2" type="checkbox"  disabled data-target="newPassword"><label>顯示密碼</label><!--  onchange="displayPWD2()"-->
		</fieldset>
		<p class="updateP">
			<label class="updateLabel">姓名:</label>
			<input type="text" name="name" required placeholder="請輸入姓名" minlength="<%= Customer.MIN_NAME_LENGTH %>" maxlength="<%= Customer.MAX_NAME_LENGTH %>">
		</p>
		<p class="updateP">
			<label class="updateLabel">生日:</label>
			<input type="date" name="birthday" required max="<%= LocalDate.now().plusYears(-Customer.MIN_AGE) %>">
		</p>
		<p>
			<label class="updateLabel">性別:</label>
			<input type="radio" name="gender" required value="<%= Customer.MALE%>"><label>男</label>
			<input type="radio" name="gender" required value="<%= Customer.FEMALE%>"><label>女</label>
			<input type="radio" name="gender" required value="<%= Customer.OTHER%>"><label>不願透漏</label>
			<!--<select name="gender" required>
				<option value="">請選擇...</option> dummy option 防呆選項 給一個空字串
				<option value="M">男</option>
				<option value="F">女</option>
				<option value="O">其他</option>
			</select>-->
		</p>
		<p class="updateP">
			<label class="updateLabel">地址:</label>
			<textarea name="address" rows="2" cols=30></textarea>
		</p>
		<p>
			<span  class="subscribedLabel"><input type="checkbox" name="subscribed"><label>訂閱電子報</label></span>
<!-- 			<label>訂閱電子報:</label> -->
<!-- 			<select name="subscribed"> -->
<!-- 				<option value="true">是</option> -->
<!-- 				<option value="false">否</option> -->
<!-- 			</select> -->
<!-- 			<input type="radio" name="subscribed" value="true"><label>是</label> -->
<!-- 			<input type="radio" name="subscribed" value="false"><label>否</label> -->
		</p>
<!-- 		<p> -->
<!-- 			<label>驗證碼:</label> -->
<!-- 			<input type="text" name="captcha" required placeholder="請輸入驗證碼"> -->
<!-- 			<img src="../images/captcha.png" id="captchaImg" title="點選即可更新驗證碼" onclick="refreshCaptcha()"> -->
<!-- 		</p> -->
		<input type="submit" value="確定" class="buttonStyled">
	</form>
	</article>
	<%@include file="../subviews/footer.jsp" %>
</body>
</html>