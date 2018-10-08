<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta charset="UTF-8">
    <title>神奇餐厅</title>
    <link rel="stylesheet" href="<%=basePath%>static/bootstrap/bootstrap.min.css">
    <style>
        /* Custom Styles */
        ul.nav-tabs {
            width: 140px;
            margin-top: 20px;
            border-radius: 4px;
            border: 1px solid #ddd;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
        }

        ul.nav-tabs li {
            margin: 0;
            border-top: 1px solid #ddd;
        }

        ul.nav-tabs li:first-child {
            border-top: none;
        }

        ul.nav-tabs li a {
            margin: 0;
            padding: 8px 16px;
            border-radius: 0;
        }

        ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover {
            color: #fff;
            background: #0088cc;
            border: 1px solid #0088cc;
        }

        ul.nav-tabs li:first-child a {
            border-radius: 4px 4px 0 0;
        }

        ul.nav-tabs li:last-child a {
            border-radius: 0 0 4px 4px;
        }

        ul.nav-tabs.affix {
            top: 30px; /* Set the top position of pinned element */
        }
    </style>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
<div class="container">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner" role="listbox">
            <div class="item active">
                <img data-src="holder.js/900x500/auto/#777:#555/text:First slide" alt="First slide [900x500]"
                     src="<%=basePath%>static/imgs/meishi.jpg"
                     data-holder-rendered="true">
            </div>
            <div class="item">
                <img data-src="holder.js/900x500/auto/#666:#444/text:Second slide" alt="Second slide [900x500]"
                     src="<%=basePath%>static/imgs/meishi.jpg"
                     data-holder-rendered="true">
            </div>
            <div class="item">
                <img data-src="holder.js/900x500/auto/#555:#333/text:Third slide" alt="Third slide [900x500]"
                     src="<%=basePath%>static/imgs/meishi.jpg"
                     data-holder-rendered="true">
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
            <span class="iconfont icon-prev" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
            <span class="iconfont icon-next" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="500">
                <c:forEach items="${typeList}" var="typeItem" varStatus="status">
                    <li <c:if test="${status.index == 0}"> class="active"</c:if>>
                        <a href="#section-${status.index+1}">${typeItem.cookType}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="col-xs-9">
            <c:forEach items="${typeList}" var="typeItem" varStatus="cookType">
                <c:if test="${!cookType.first}">
                    <hr>
                </c:if>
                <h2 id="section-${cookType.index+1}">${typeItem.cookType}</h2>
                <c:set var="cookNum" scope="session" value="${0}"/>
                <c:forEach items="${cookDates}" var="dateItem" varStatus="cookNumber">
                    <c:set var="flag" value="${cookNumber.last}"/>
                    <%--<c:forEach items="${cookDates}" var="date">--%>
                    <c:if test="${dateItem.cookType == typeItem.cookType }">
                        <c:if test="${cookNum % 4 == 0}">
                            <div class="row">
                        </c:if>
                        <div class="col-sm-6 col-md-3">
                            <div class="thumbnail">
                                <img src="<%=basePath%>static/imgs/kittens.jpg"
                                     alt="通用的占位符缩略图">
                                <div class="caption">
                                    <h3>${dateItem.cookName}</h3>
                                    <p>${dateItem.cookType}</p>
                                    <p>
                                        <a href="#" class="btn btn-primary" role="button">
                                            加入购物车
                                        </a>
                                    </p>
                                </div>
                            </div>
                        </div>
                        <c:if test="${(cookNum + 1) % 4 == 0}">
                            </div>
                        </c:if>
                        <c:set var="cookNum" scope="session" value="${cookNum + 1}"/>
                    </c:if>
                    <c:if test="${cookNumber.last}">
                        </div>
                    </c:if>
                    <%--</c:forEach>--%>
                </c:forEach>
            </c:forEach>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=basePath%>static/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/bootstrap/bootstrap.min.js"></script>
</body>
</html>
