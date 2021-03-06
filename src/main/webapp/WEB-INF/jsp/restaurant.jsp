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
    <link href="<%=basePath%>static/iconfont/iconfont.css" rel="stylesheet" type="text/css"/>
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

        .cart-trigger {
            box-shadow: 0 0 14px -1px #9d9d9d;
            position: fixed;
            bottom: 5%;
            right: 5%;
            background-color: #fff;
            z-index: 3;
            height: 72px;
            width: 72px;
            border-radius: 5px;
            text-indent: 100%;
            color: transparent;
            white-space: nowrap;
        }

        .count {
            position: absolute;
            display: none;
            top: -10px;
            right: -10px;
            height: 28px;
            width: 28px;
            background: #e94b35;
            color: #ffffff;
            font-size: 1.5rem;
            font-weight: bold;
            border-radius: 50%;
            text-indent: 0;
            transition: transform .2s .5s, -webkit-transform .2s .5s;
        }

        .count li {
            position: absolute;
            left: 50%;
            top: 50%;
            bottom: auto;
            right: auto;
            transform: translateX(-50%) translateY(-50%);
        }

        .row {
            position: relative;
        }

        .btn-delete {
            position: absolute;
            right: -35px;
            top: 10px;
        }

        .row span {
            position: absolute;
            right: 65px;
            top: 25px;
        }
    </style>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
<nav class="navbar navbar-default" style="margin-bottom: 0">
    <div class="container-fluid">

        <div class="navbar-header">
            <a class="navbar-brand" href="#">神奇餐厅</a>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <c:if test="${customer!=null}">
                    <a id="btn_login" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="true"><span class="iconfont icon-user"></span></a>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                        <li><a href="#">欢迎您<strong>${customer.customerName}</strong></a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" onclick="myOrder()">我的订单</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="<%=basePath%>customer/changePassWord.action">更改密码</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#" onclick="loginOutPut()"><span class="iconfont icon-logout"></span>退出</a>
                        </li>
                    </ul>
                    <form id="myOrder" action="<%=basePath%>order/myOrder.action" method="post"></form>
                    <input type="hidden" id="customerId" name="customerId" value="${customer.customerId}"/>
                </c:if>
                <c:if test="${customer==null}">
                    <a id="btn_login" href="#" data-toggle="modal"
                       data-target="#userLoginDialog"><span class="iconfont icon-user"></span></a>
                </c:if>
            </li>
        </ul>
    </div>
</nav>
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
        <div class="col-xs-2" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="550">
                <c:forEach items="${typeList}" var="typeItem" varStatus="status">
                    <li <c:if test="${status.index == 0}"> class="active"</c:if>>
                        <a href="#section-${status.index+1}">${typeItem.productType}</a>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="col-xs-10">
            <c:forEach items="${typeList}" var="typeItem" varStatus="productType">
            <c:if test="${!productType.first}">
                <hr>
            </c:if>
            <h2 id="section-${productType.index+1}">${typeItem.productType}</h2>
            <c:set var="number" scope="session" value="${0}"/>
            <c:forEach items="${productDates}" var="dateItem" varStatus="productNum">
            <c:set var="flag" value="${productNum.last}"/>
            <c:if test="${dateItem.productType == typeItem.productType }">
                <c:if test="${number % 4 == 0}">
                    <div class="row">
                </c:if>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="${dateItem.productImage}"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>${dateItem.productName}</h3>
                            <p>${dateItem.productType}</p>
                            <p>
                                <a href="javascript:void(0);" class="btn btn-primary btn_addToCart" role="button"
                                   onclick="addToCart(${dateItem.productId})">
                                    加入购物车
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <c:if test="${(number + 1) % 4 == 0}">
                    </div>
                </c:if>
                <c:set var="number" scope="session" value="${number + 1}"/>
            </c:if>
            <c:if test="${productNum.last && number % 4 != 0}">
        </div>
        </c:if>
        </c:forEach>
        </c:forEach>
    </div>
</div>
<div class="" data-toggle="modal" data-target="#myModal">
    <a href="javascript:void(0);" class="cart-trigger" onclick="getCartList()"
       style="background-image: url('<%=basePath%>static/imgs/cart.png')">
        <ul class="count">
            <li>2</li>
        </ul>
    </a>
</div>
<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myModalLabel">购物车</h4>
            </div>
            <div class="modal-body cart">
            </div>
            <div class="modal-footer">
                <label for="price">合计:</label>
                <em id="price"></em>
                <em>元</em>
                <button type="button" class="btn btn-primary" onclick="submitOrder()">提交订单</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="userLoginDialog" tabindex="-1" role="dialog"
     aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title" id="myLoginLabel">登陆</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="customer_login_form">
                    <div class="form-group">
                        <label for="edit_userName" style="float:left;padding:7px 15px 0 27px;">账号</label>
                        <div class="col-sm-10">
                            <input id="userName_input" type="text" class="form-control" id="edit_userName"
                                   placeholder="账号"
                                   name="customerUserName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="edit_passWord" style="float:left;padding:7px 15px 0 27px;">密码</label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="edit_passWord" placeholder="密码"
                                   name="customerPassWord">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <a class="btn btn-primary" href="<%=basePath%>customer/register.action">注册</a>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="btn_user_submit" onclick="userLogin()">登陆
                </button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=basePath%>static/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>static/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript">
    var curPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var basePath = curPath.substring(0, curPath.indexOf(pathName)) + "/";
    var CookList = new Array();
    var customerId = $("#customerId").val();
    var price = 0;

    $(function () {
        if (${customer==null}) {
            alert("您还没有登陆，请先登录！");
            $("#btn_login").trigger("click");
        } else {
            $.ajax({
                type: "post",
                url: basePath + "restaurant/getCart.action",
                data: {
                    "customerId": customerId
                },
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                success: function (data) {
                    if (data.length > 0) {
                        $(".count").show();
                        CookList = data;
                        $(".count li").text(CookList.length);
                    }
                }
            });
        }
    });

    function userLogin() {
        $.ajax({
            type: "post",
            url: basePath + "customer/login.action",
            data: $("#customer_login_form").serialize(),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (date) {
                if (date.msg == "loginSuccess") {
                    alert("登陆成功");
                } else {
                    alert(date.msg);
                }
                window.location.reload();
            }
        });
    }

    function loginOutPut() {
        $.ajax({
            type: "get",
            url: basePath + "customer/loginOutPut.action",
            success: function () {
                window.location.reload();
            }
        });
    }

    function getCartList() {
        price = 0;
        $.ajax({
            type: "post",
            url: basePath + "restaurant/getCartList.action",
            data: {
                "productIds": CookList.toString()
            },
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                $(".cart").html("");
                $.each(data, function (i, item) {
                    $(".cart").append('<div class="row item' + item.productId + '"><div class="col-xs-6 col-md-3"><a href="javascript:void(0);" class="thumbnail"><img src="' + item.productImage + '" alt="' + "err:" + item.productImage + '"></a></div><h3>' + item.productName + '</h3><p>' + item.productDesc + '</p><span>' + item.productPrice + '元</span><button type="button" class="close btn-delete"><span onclick="deleteCartList(' + item.productId + ',' + item.productPrice + ')">&times;</span></button></div>');
                    price = price + item.productPrice;
                });
                $("#price").text(price);
            }
        });
    }

    function addToCart(productId) {
        CookList[CookList.length] = productId;
        $.ajax({
            type: "post",
            url: basePath + "restaurant/addToCart.action",
            data: {
                "customerId": customerId,
                "productIds": CookList.toString()
            },
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (date) {
                if (date > 0) {
                    $(".count").show();
                    $(".count li").text(CookList.length);
                } else {
                    CookList.splice(CookList.length - 1, 1);
                }
            }

        });
    }


    function deleteCartList(id, i) {
        console.log(CookList.toString(), id);
        var cookIndex = CookList.indexOf(id);
        CookList.splice(cookIndex, 1);
        $(".item" + id).remove();
        $.ajax({
            type: "post",
            url: basePath + "restaurant/deleteCartList.action",
            data: {
                "customerId": customerId,
                "productIds": id
            },
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (date) {
                if (date > 0) {
                    $(".count").show();
                    $(".count li").text(CookList.length);
                    price = price - i;
                    $("#price").text(price);
                } else {
                    CookList.splice(cookIndex, 0, id);
                }
            }
        })
    }

    function submitOrder() {
        console.log(CookList.toString());
        $.ajax({
            type: "post",
            url: basePath + "restaurant/submitOrder.action",
            data: {
                "customerId": customerId,
                "productIds": CookList.toString()
            },
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (date) {
                if (date > 0) {
                    CookList = [];
                    window.location.reload();
                } else {
                    alert("订单提交失败！");
                }
            }
        });
    }

    function myOrder() {
        $("#myOrder").submit();
    }

</script>
</body>
</html>
