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
    <title>我的订单</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>static/iconfont/iconfont.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div>
    <nav class="navbar navbar-default" style="margin-bottom: 0">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="<%=basePath%>restaurant/welcome.action">神奇餐厅</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <c:if test="${customer!=null}">
                        <a id="btn_login" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="true"><span class="iconfont icon-user"></span></a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <li><a href="#">欢迎您<em>${customer.customerName}</em></a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="<%=basePath%>customer/changePassWord.action">更改密码</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#" onclick="loginOutPut()"><span class="iconfont icon-logout"></span>退出</a>
                            </li>
                        </ul>
                    </c:if>
                    <c:if test="${customer==null}">
                        <a id="btn_login" href="#" data-toggle="modal"
                           data-target="#userLoginDialog"><span class="iconfont icon-user"></span></a>
                    </c:if>
                </li>
            </ul>
        </div>
    </nav>

    <div style="padding-left: 20px;">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header"><em>${customer.customerName}</em>的订单</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <form id="select_form" action="<%=basePath%>order/myOrder.action" method="post" class="form-inline">
                    <div class="form-group">
                        <label for="date">日期</label>
                        <input id="date" class="form-control" name="date" type="date"/>
                    </div>
                    <div class="form-group">
                        <label for="time">时间</label>
                        <select class="form-control" id="time" name="time">
                            <option></option>
                            <option>一周以内</option>
                            <option>一月以内</option>
                            <option>一年以内</option>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">订单列表</div>
                    <table id="table_cookList" class="table table-bordered table-striped table-condensed">
                        <thead>
                        <tr>
                            <td><strong>下单日期</strong></td>
                            <td><strong>菜名</strong></td>
                            <td><strong>口味</strong></td>
                            <td><strong>库存</strong></td>
                            <td><strong>价格</strong></td>
                            <td><strong>菜系</strong></td>
                            <td><strong>介绍</strong></td>
                            <td><strong>图片</strong></td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orderDates.rows}" var="orderItem" varStatus="status">
                            <c:forEach items="${orderItem.products}" var="productItem" varStatus="productItemStatus">
                                <tr>
                                    <c:if test="${productItemStatus.index == 0}">
                                        <td rowspan="${orderItem.products.size()}">${orderItem.createTime}</td>
                                    </c:if>
                                    <td>${productItem.productName}</td>
                                    <td>${productItem.productFlavor}</td>
                                    <td>${productItem.productRepertory}</td>
                                    <td>${productItem.productPrice}</td>
                                    <td>${productItem.productType}</td>
                                    <td>${productItem.productDesc}</td>
                                    <td><a name="popover" data-toggle="popover"
                                           data-content="<a href='#' class='thumbnail'>
                                    <img src='${productItem.productImage}' alt='${productItem.productImage}'>
                                    </a>
                                    ">${productItem.productImage}</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <c:if test="${orderDates.pageNum>0}">
            <div class="col-md-12 text-center">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="?page=${orderConditions.page-1==0?1:orderConditions.page-1}&date=${orderConditions.date}&time=${orderConditions.time}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach var="i" begin="1" end="${orderDates.pageNum}" step="1">
                            <li>
                                <a href="?page=${i}&date=${orderConditions.date}&time=${orderConditions.time}">${i}</a>
                            </li>
                        </c:forEach>
                        <li>
                            <a href="?page=${orderConditions.page+1>orderDates.pageNum?orderDates.pageNum:orderConditions.page+1}&date=${orderConditions.date}&time=${orderConditions.time}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </c:if>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $("a[name = popover]").popover({
            trigger: 'hover',//鼠标以上时触发弹出提示框
            html: true, //开启html 为true的话，data-content里就能放html代码了
            placement: 'top'
        });
        $("#select_form").change(function () {
            if ($("#date").val() != "") {
                console.log("date not null");
                $("#time").attr("disabled", "");
            } else if ($("#time").val() != "") {
                console.log("time not null");
                $("#date").attr("disabled", "");
            } else {
                $("#date").removeAttr("disabled");
                $("#time").removeAttr("disabled");
            }
        })
    });
</script>
</body>
</html>
