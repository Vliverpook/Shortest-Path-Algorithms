<%--
  Created by IntelliJ IDEA.
  User: 20617
  Date: 2023/5/10
  Time: 19:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        body {
            font: 14px Arial,sans-serif;
            margin: 0px;
        }
        header {
            padding: 10px 20px;
            background: #acb3b9;
        }
        header h1 {
            font-size: 24px;
        }
        .container {
            width: 100%;
            background: #f2f2f2;
            height: 100%;
        }
        nav, section {
            float: left;
            padding: 20px;
            min-height: 170px;
            box-sizing: border-box;
        }
        section {
            width: 80%;
        }
        nav {
            width: 20%;
            background: #d4d7dc;
            height: auto;
        }
        nav ul {
            list-style: none;
            line-height: 24px;
            padding: 0px;
        }
        nav ul li a {
            color: #333;
        }
        .clearfix:after {
            content: ".";
            display: block;
            /*height: 58%;*/
            clear: both;
            visibility: hidden;
        }
        .content{
            height: 81%;
            padding: 0;
        }
        footer {
            background: #acb3b9;
            text-align: center;
            padding: 5px;
        }
        .context{
            border-spacing: 10px;
            border:0;
        }
        td{
            border: 0;
            padding: 0;
        }
        form{
            height:120px;
            margin: 0;
            padding: 0;
            border: 0;
        }
        #button1{
            background: bisque;
            border: 0;
            border-radius: 5px;
            box-shadow: 2px 2px 8px ;
            width: 100%;
            height: 100%;
        }
        #button2{
            background: lightcoral;
            border: 0;
            border-radius: 5px;
            box-shadow: 2px 2px 8px ;
            width: 100%;
            height: 100%;
        }
        #button3{
            background: darkseagreen;
            border: 0;
            border-radius: 5px;
            box-shadow: 2px 2px 8px ;
            width: 100%;
            height: 100%;
        }
        .label{
            background: red;
            height: 20px;
            border-radius: 10px;
        }
    </style>
    <script>
        window.onload=function (){
            var btnObj1=document.getElementById("button1");
            var label1=document.getElementById("label1");
            var label2=document.getElementById("label2");
            var label3=document.getElementById("label3");
            label1.style.backgroundColor='rgba(255, 0, 0, 0.9)';
            label2.style.backgroundColor='rgba(255, 0, 0, 0)';
            label3.style.backgroundColor='rgba(255, 0, 0, 0)';
            btnObj1.onclick=function (){
                var changeFrame=document.getElementById("frame");
                changeFrame.src="Floyd.jsp";
                label1.style.backgroundColor='rgba(255, 0, 0, 0.9)';
                label2.style.backgroundColor='rgba(255, 0, 0, 0)';
                label3.style.backgroundColor='rgba(255, 0, 0, 0)';
            }
            var btnObj2=document.getElementById("button2");
            btnObj2.onclick=function (){
                var changeFrame=document.getElementById("frame");
                changeFrame.src="Dijkstra.jsp";
                label1.style.backgroundColor='rgba(255, 0, 0, 0)';
                label2.style.backgroundColor='rgba(255, 0, 0, 0.9)';
                label3.style.backgroundColor='rgba(255, 0, 0, 0)';
            }
            var btnObj3=document.getElementById("button3");
            btnObj3.onclick=function (){
                var changeFrame=document.getElementById("frame");
                changeFrame.src="Bellman Ford.jsp";
                label1.style.backgroundColor='rgba(255, 0, 0, 0)';
                label2.style.backgroundColor='rgba(255, 0, 0, 0)';
                label3.style.backgroundColor='rgba(255, 0, 0, 0.9)';
            }
        }
    </script>
</head>
<body>
<div class="container">
    <header>
        <h1>SPA</h1>
    </header>
    <div class="wrapper clearfix">
        <nav class="content">
<%--            <ul>--%>
<%--                <li><a href="https://www.csdn.net/">首页</a></li>--%>
<%--                <li><a href="https://www.csdn.net/company/index.html#about">公司简介</a></li>--%>
<%--                <li><a href="https://www.csdn.net/company/index.html#dsj">CSDN大事记</a></li>--%>
<%--                <li><a href="https://bbs.csdn.net/">CSDN社区</a></li>--%>
<%--                <li><a href="https://blog.csdn.net/m0_68539124">克隆窝的主页</a></li>--%>
<%--                <li><a href="https://edu.csdn.net">CSDN学习</a></li>--%>
<%--            </ul>--%>
            <table class="context" width=100% border=3px cellpadding=0>
                <tr>
                    <td id="td1" height=150%>
                        <form id="form1">
                            <input id="button1" type="button" value="Floyd algorithm">
                        </form>
                        <div id="label1" class="label">

                        </div>
                    </td>
                </tr>
                <tr>
                    <td id="td2" height=150%>
                        <form id="form2">
                            <input id="button2" type="button" value="Dijkstra algorithm">
                        </form>
                        <div id="label2" class="label">

                        </div>
                    </td>
                </tr>
                <tr>
                    <td id="td3" height=150%>
                        <form id="form3">
                            <input id="button3" type="button" value="Bellman Ford algorithm">
                        </form>
                        <div id="label3" class="label">

                        </div>
                    </td>
                </tr>
            </table>
        </nav>
<%--        <section class="content">--%>
            <iframe class="content" id="frame" src="Floyd.jsp" width=80%  frameborder="0"></iframe>
<%--        </section>--%>
    </div>
    <footer>
        <p></p>
    </footer>
</div>
</body>
</html>
