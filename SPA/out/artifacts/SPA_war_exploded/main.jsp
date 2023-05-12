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
        }
        footer {
            background: #acb3b9;
            text-align: center;
            padding: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <header>
        <h1>CSDN</h1>
    </header>
    <div class="wrapper clearfix">
        <nav class="content">
            <ul>
                <li><a href="https://www.csdn.net/">首页</a></li>
                <li><a href="https://www.csdn.net/company/index.html#about">公司简介</a></li>
                <li><a href="https://www.csdn.net/company/index.html#dsj">CSDN大事记</a></li>
                <li><a href="https://bbs.csdn.net/">CSDN社区</a></li>
                <li><a href="https://blog.csdn.net/m0_68539124">克隆窝的主页</a></li>
                <li><a href="https://edu.csdn.net">CSDN学习</a></li>
            </ul>
        </nav>
        <section class="content">
            <h2>网站简介</h2>
            <p>CSDN（中国开发者网络）创立于1999年，是全球知名<b>中文开发者</b>网站。秉承成就一亿技术人的使命，为IT技术人成长及科技企业发展，提供开发者生态的全方位服务。</p>
            <p><b>人人都是开发者，家家都是技术公司，CSDN全力前行，共建中国十万亿技术大生态！</b></p>
        </section>
    </div>
    <footer>
        <p>By 克隆窝 ©www.csdn.net</p>
    </footer>
</div>
</body>
</html>
