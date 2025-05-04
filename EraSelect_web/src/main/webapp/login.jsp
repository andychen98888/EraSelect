<%@page import="java.util.List"%>
<!-- <%@ page pageEncoding="UTF-8" %> -->

<!DOCTYPE html>
<!-- html註解:ctrl+shift+c -->

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
		<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/style/es.css">
		<script src="https://code.jquery.com/jquery-3.0.0.js" integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" crossorigin="anonymous"></script>
		<script type="text/javascript" src="jquery-ui-1.14.0.custom/jquery-ui.js"></script>
		
		<script>
			$(document).ready(init);
			function init(){
				$(".menu3").tooltip({ //提示視窗
					//content: "<h1>Hello</h1>", //自訂tooltip裡面的值
					show: {effect: "slideDown", duration: 400},
					hide: {effect: "slideUp", duration: 400},
					tooltipClass: "myStyle", //抓取指定class裡面的css並套用
				});
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
			
            function refreshCaptcha(){
                //alert("refreshCaptcha"); 跳出對話框
                //var captchaImg = document.getElementById("captchaImg");
                captchaImg.src = "images/captcha.png?renew="+new Date();
              //alert("captchaImg.src"); 跳出對話框
            }
            function displayPWD(){
            	//alert(theCheckbox.checked);
            	if(theCheckbox.checked){ //打勾
            		thePassword.type="text";
            	}else{
            		thePassword.type="password";
            	}
            }
        </script>
        <style>
/*     	    article{ */
/* 				background-image: linear-gradient(45deg, #fff2f0, #c7afaa); */
/* 			} */
        	#theErrorsDiv{
        		color:red;
        	}
        	#refreshImg,#passwordImg,#passwordImg2{
        		cursor: pointer;
        		width: 20px;
        	}
        	#refreshImg{
        		position:absolute;
        		left:114px;
        	}
			.registerP{
				font-size: 14px;
				color: #9fa3a8;
			}

			.loginBody{
				text-align: center; /* */
				width: 700px;
				margin: 60px auto 12px;
				display: flex;
				
				justify-content: center;
				align-items: center;
			}	
			.loginData,.registerData{
				width: 50%;
				height: 400px;				
/* 		*/		padding: 10px 10px;	 
			}
			.loginData{
				border-right: 1px solid silver;
			}
			.registerData{
				display: flex;
				flex-direction: column;
				
			}
/* 			設定對齊欄位 */
			#inputLabel{margin-right:210px;}
			#captchaLabel{margin-right:190px;}
			#theAccount input,#thePassword,#captchaDiv input{
				width:235px;
        		height:30px;
			}
			#passwordImg{
				display: none;
			}
			#passwordImg,#passwordImg2{
				position:absolute;
				right:50px;
				top:7px;
			}
 			#pwdDiv,#captchaDiv{
 				position:relative;
 			} 
			.forgotPassword{
				color: lightslategray;
				font-size: 15px;
				margin-left: 11.5em;
				cursor: pointer;
			}
			#loginButton{
				margin: 0.5em;
			}
			#captchaDiv>div{
				margin-right:150px;
			}
        </style>
	</head>
<body>
	<jsp:include page="./subviews/header.jsp" />
<%-- 	<jsp:include page="./subviews/header.jsp"><jsp:param value="Login" name="subheader"/></jsp:include> --%>
<%-- 	<%@include file="./subviews/nav.jsp" %> --%>
	<article>
		<%
			List<String> errors = (List<String>)request.getAttribute("errors");//接收回傳的errors
		%>
		
		<div class="loginBody">
			<div class="loginData">
				<form action="login.do" method="POST"> <!--回傳form標籤裡的輸入項目-->
					<h3>登入</h3>
					<p>
						<div class="accountOuter">
							<div id="inputLabel"><label>帳號</label></div>
							<div id="theAccount"><input type="text" name="id" required placeholder="請輸入ROC ID/email/手機" autofocus></div>
						</div>
					</p>
					<p>
						<div class="passwordOuter">
							<div id="inputLabel"><label>密碼</label></div>
							<div id="pwdDiv">
								<input id="thePassword" type="password" name="password" required placeholder="請輸入密碼">
								<img src="images/eye_icon.png" id="passwordImg" onclick="hidePWD()">
								<img src="images/eye_no_icon.png" id="passwordImg2" onclick="showPWD()">
<!-- 								<input id="theCheckbox" type="checkbox" onchange="displayPWD()"><label>顯示密碼</label> -->
							</div> 
							<span class="forgotPassword">
								 <a>忘記密碼?</a>
			 				</span>
						</div>
					</p>
					<p>
						<div class="captchaOuter">
							<div id="captchaLabel"><label>驗證碼</label></div>
							<div id="captchaDiv"><input type="text" name="captcha" required placeholder="請輸入驗證碼">
								<div>
									<img src="images/captcha.png" id="captchaImg" >
									<a id="refreshCaptcha"><img id="refreshImg" src="images/refresh_icon.png" onclick="refreshCaptcha()"></a>
								</div>
							</div>
						</div>
					</p>
	 				<div id="theErrorsDiv">
						<%
						out.print(errors!=null?errors:"");
						%>
					</div>
	 				<input type="submit" class="buttonStyled" id="loginButton" value="登入"><!-- <button></button> --> 
				</form>
			</div>	
			<div class="registerData">
				<h3>加入會員</h3>
				<p class="registerP">Eraselect 網路商店提供快速的帳戶開通服務，開通後您可以在我的帳戶內保存多個送貨地址，或取得您的訂單歷史記錄，等等。</p>
				<a href="register.jsp"><button class="buttonStyled" id="registerButton">建立新帳號</button></a>
			</div>
		</div>	
		
	</article>
	<%@include file="./subviews/footer.jsp" %>
</body>
</html>