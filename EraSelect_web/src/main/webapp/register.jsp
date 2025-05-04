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
		<link rel="apple-touch-icon" sizes="180x180" href="favicon/apple-touch-icon.png">
		<link rel="icon" type="image/png" sizes="32x32" href="favicon/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="16x16" href="favicon/favicon-16x16.png">
		<link rel="manifest" href="favicon/site.webmanifest">
		<link rel="mask-icon" href="favicon/safari-pinned-tab.svg" color="#5bbad5">
		<meta name="msapplication-TileColor" content="#da532c">
		<meta name="theme-color" content="#ffffff">
		
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta charset="UTF-8">
		<title>EraSelect</title>
		<link href="jquery-ui-1.14.0.custom/jquery-ui.css" rel="stylesheet">	
		<link rel="stylesheet" type="text/css" href="style/es.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="jquery-ui-1.14.0.custom/jquery-ui.js"></script>
		
		<script>
			$(init);//$(document).ready(init);
			function init(){ //把表單從記憶體帶回
// 				alert(1);
				<% if(request.getMethod().equals("POST")){ %> //第一次為get請求，輸入完需傳送form為post請求
					repopulateFormData();
				<% } %>
				$(".menu3").tooltip({ //提示視窗
					//content: "<h1>Hello</h1>", //自訂tooltip裡面的值
					show: {effect: "slideDown", duration: 400},
					hide: {effect: "slideUp", duration: 400},
					tooltipClass: "myStyle", //抓取指定class裡面的css並套用
				});
			}
			
			function repopulateFormData(){
				$("input[name=id]").val("<%= request.getParameter("id")%>");	  <%-- <%= request.getParameter("id")%> == ${param.id} --%>
				$("input[name=email]").val("<%= request.getParameter("email")%>");<%-- <%= request.getParameter("email")%> == ${param.email} --%>
				$("input[name=phone]").val("<%= request.getParameter("phone")%>");<%-- <%= request.getParameter("phone")%> == ${param.phone} --%>
				$("input[name=password1]").val("<%= request.getParameter("password1")%>");
				$("input[name=name]").val("<%= request.getParameter("name")%>");
				$("input[name=birthday]").val("<%= request.getParameter("birthday")%>");
				$("textarea[name=address]").text("<%= request.getParameter("address")%>");<%-- val.  --%>
				
 				$("input[name=gender][value=<%= request.getParameter("gender")%>]").prop('checked',true); <%-- attr.--%>
				$("input[name=subscribed]").prop("checked",<%= request.getParameter("subscribed")!=null %>);

			}
			
            function refreshCaptcha(){
                //alert("refreshCaptcha");
                //var captchaImg = document.getElementById("captchaImg");
                captchaImg.src = "images/captcha.png?refresh="+new Date();
            }
            function displayPWD(){
            	//alert(theCheckbox.checked);
            	if(theCheckbox.checked){ //打勾
            		thePassword.type="text";
            	}else{
            		thePassword.type="password";
            	}
            }
            
            function hidePWD(){
				$("#passwordImg").css("display","none");
				$("#passwordImg2").css("display","inline");
				$("#thePassword").attr("type","password");
			}
			function showPWD(){
				$("#passwordImg2").css("display","none");
				$("#passwordImg").css("display","inline");
				$("#thePassword").attr("type","text");
			}
        </script>
        <style>
        	#theErrorsDiv{color:red;}
        	article{
        	 text-align: center;
        	}
        	#idDiv input,#emailDiv input,#phoneDiv input,#thePassword,#nameDiv input,#birthdayDiv input{
        		width:235px;
        		height:30px;
        	}
        	.idLabel{margin-right:160px;}
			.emailLabel{margin-right:200px;}
			.phoneLabel,.pwdLabel,.nameLabel,.birthdayLabel,.genderLabel,.addresLabel{
				margin-right:210px;
				}
 			#pwdDiv{margin-left:20px;} 
			#genderDiv{margin-right:85px;}
			#subscribedDiv{margin-right:150px;}
			
			#passwordImg,#passwordImg2{
        		width: 20px;
        		position:absolute;
        		position:relative;
         		right:30px; 
         		top:7px; 
         		cursor: pointer;
        	}
			#passwordImg{
				display: none;
			}
 			#pwdInput{
 				margin-left:1px;
 			}
        </style>
	</head>
<body>
	<jsp:include page="./subviews/header.jsp"><jsp:param value="Register" name="subheader"/></jsp:include>
<%-- 	<%@include file="./subviews/nav.jsp" %> --%>
	<article>
<%-- 	<% --%>
<!--  		List<String> errors = (List<String>)request.getAttribute("errors"); -->
<%-- 	%> --%>
	<div id="theErrorsDiv">
		${ requestScope.errors }
<%-- 		<%=	(errors!=null?errors:"")%> --%>
	</div>
	<h3>註冊帳號</h3>
	<form action="register.do" method="POST"> <!--回傳form標籤裡的輸入項目-->
		<p>
			<div>
				<div class="idLabel"><label >身分證字號</label></div>
				<div id=idDiv><input type="text" name="id" required placeholder="請輸入ROC ID" pattern="[A-Z][1289][0-9]{8}"></div>
			</div>
		</p>
		<p>
			<div>
				<div class="emailLabel"><label>email</label></div>
				<div id="emailDiv"><input type="email" name="email" required placeholder="請輸入email"></div>
			</div>
		</p>
		<p>
			<div>
				<div class="phoneLabel"><label>手機</label></div>
				<div id="phoneDiv"><input type="tel" name="phone" required placeholder="請輸入手機"></div>
			</div>
		</p>
		<p>
			<div>
				<div class="pwdLabel"><label>密碼</label></div>
				<div id="pwdDiv">
					<input id="thePassword" type="password" name="password1" required placeholder="請輸入密碼" minlength="<%= Customer.MIN_PWD_LENGTH %>" maxlength="<%= Customer.MAX_PWD_LENGTH %>">
					<img src="images/eye_icon.png" id="passwordImg" onclick="hidePWD()">
					<img src="images/eye_no_icon.png" id="passwordImg2" onclick="showPWD()">
<!-- 				<input id="theCheckbox" type="checkbox" onchange="displayPWD()"><label>顯示密碼</label> -->
				</div>
			</div>
		</p>
		<p>
			<div>
				<div class="nameLabel"><label>姓名</label></div>
				<div id="nameDiv"><input type="text" name="name" required placeholder="請輸入姓名" minlength="<%= Customer.MIN_NAME_LENGTH %>" maxlength="<%= Customer.MAX_NAME_LENGTH %>"></div>
			</div>
		</p>
		<p>
			<div>
				<div class="birthdayLabel"><label>生日</label></div>
				<div id="birthdayDiv"><input type="date" name="birthday" required max="<%= LocalDate.now().plusYears(-Customer.MIN_AGE) %>"></div>
			</div>
		</p>
		<p>
			<div>
				<div class="genderLabel"><label>性別</label></div>
				<div id="genderDiv"><input type="radio" name="gender" required value="<%= Customer.MALE%>"><label>男</label>
				<input type="radio" name="gender" required value="<%= Customer.FEMALE%>"><label>女</label>
				<input type="radio" name="gender" required value="<%= Customer.OTHER%>"><label>不願透漏</label></div>
				<!--<select name="gender" required>
					<option value="">請選擇...</option> dummy option 防呆選項 給一個空字串
					<option value="M">男</option>
					<option value="F">女</option>
					<option value="O">其他</option>
				</select>-->
			</div>
		</p>
		<p>
			<div>
				<div class="addresLabel"><label>地址</label></div>
				<div id="addressDiv"><textarea name="address" rows="2" cols=30></textarea></div>
			</div>
		</p>
		<p>
			<div>
				<div id="subscribedDiv"><input type="checkbox" name="subscribed"><label>訂閱電子報</label></div>
			</div>
		</p>
<!-- 		<p> -->
<!-- 			<label>驗證碼:</label> -->
<!-- 			<input type="text" name="captcha" required placeholder="請輸入驗證碼"> -->
<!-- 			<img src="images/captcha.png" id="captchaImg" title="點選即可更新驗證碼" onclick="refreshCaptcha()"> -->
<!-- 		</p> -->
		<input type="submit" value="註冊" class="buttonStyled">
	</form>
	</article>
	<%@include file="./subviews/footer.jsp" %>
</body>
</html>