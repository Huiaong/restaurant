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
    <title>修改密码</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
        .form-bg {
            background: #00b4ef;
        }

        .form-horizontal {
            background: #fff;
            padding-bottom: 40px;
            border-radius: 15px;
            text-align: center;
        }

        .form-horizontal .heading {
            display: block;
            font-size: 35px;
            font-weight: 700;
            padding: 35px 0;
            border-bottom: 1px solid #f0f0f0;
            margin-bottom: 30px;
        }

        .form-horizontal .form-group {
            padding: 0 40px;
            margin: 0 0 25px 0;
            position: relative;
        }

        .form-horizontal .form-control {
            background: #f0f0f0;
            border: none;
            border-radius: 20px;
            box-shadow: none;
            padding: 0 20px 0 45px;
            height: 40px;
            transition: all 0.3s ease 0s;
        }

        .form-horizontal .form-control:focus {
            background: #e0e0e0;
            box-shadow: none;
            outline: 0 none;
        }

        .form-horizontal .form-group i {
            position: absolute;
            top: 12px;
            left: 60px;
            font-size: 17px;
            color: #c8c8c8;
            transition: all 0.5s ease 0s;
        }

        .form-horizontal .form-control:focus + i {
            color: #00b4ef;
        }

        .form-horizontal .fa-question-circle {
            display: inline-block;
            position: absolute;
            top: 12px;
            right: 60px;
            font-size: 20px;
            color: #808080;
            transition: all 0.5s ease 0s;
        }

        .form-horizontal .fa-question-circle:hover {
            color: #000;
        }

        .form-horizontal .main-checkbox {
            float: left;
            width: 20px;
            height: 20px;
            background: #11a3fc;
            border-radius: 50%;
            position: relative;
            margin: 5px 0 0 5px;
            border: 1px solid #11a3fc;
        }

        .form-horizontal .main-checkbox label {
            width: 20px;
            height: 20px;
            position: absolute;
            top: 0;
            left: 0;
            cursor: pointer;
        }

        .form-horizontal .main-checkbox label:after {
            content: "";
            width: 10px;
            height: 5px;
            position: absolute;
            top: 5px;
            left: 4px;
            border: 3px solid #fff;
            border-top: none;
            border-right: none;
            background: transparent;
            opacity: 0;
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
        }

        .form-horizontal .main-checkbox input[type=checkbox] {
            visibility: hidden;
        }

        .form-horizontal .main-checkbox input[type=checkbox]:checked + label:after {
            opacity: 1;
        }

        .form-horizontal .text {
            float: left;
            margin-left: 7px;
            line-height: 20px;
            padding-top: 5px;
            text-transform: capitalize;
        }

        .form-horizontal .btn {
            float: right;
            font-size: 14px;
            color: #fff;
            background: #00b4ef;
            border-radius: 30px;
            padding: 10px 25px;
            border: none;
            text-transform: capitalize;
            transition: all 0.5s ease 0s;
        }

        @media only screen and (max-width: 479px) {
            .form-horizontal .form-group {
                padding: 0 25px;
            }

            .form-horizontal .form-group i {
                left: 45px;
            }

            .form-horizontal .btn {
                padding: 10px 20px;
            }
        }
    </style>
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
                            <li><a href="#">更改密码</a></li>
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

    <div class="htmleaf-container">
        <div class="demo form-bg" style="padding: 50px 0;">
            <div class="container">
                <div class="row">
                    <div class="col-md-offset-3 col-md-6">
                        <form class="form-horizontal" action="<%=basePath%>customer/updatePassWord.action"
                              method="post">
                            <span class="heading">修改密码</span>
                            <div class="form-group oldPassWord">
                                <input type="password" name="oldPassWord" id="oldPassWord" class="form-control"
                                       placeholder="旧密码">
                                <i class="fa fa-user"></i>
                            </div>
                            <div class="form-group newPassWord">
                                <input type="password" name="customerPassWord" id="newPassWord" class="form-control"
                                       placeholder="新密码">
                                <i class="fa fa-lock"></i>
                            </div>
                            <div class="form-group rePassWord">
                                <input type="password" name="rePassWord" id="rePassWord" class="form-control"
                                       placeholder="新密码">
                                <i class="fa fa-lock"></i>
                            </div>
                            <div class="form-group">
                                <input type="submit" id="btn-submit" class="btn btn-default" value="修改"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script>
    var curPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var basePath = curPath.substring(0, curPath.indexOf(pathName)) + "/";

    $(function () {
        var oldPassWord = $("#oldPassWord");
        var newPassWord = $("#newPassWord");
        var rePassWord = $("#rePassWord");
        var btn_submit = $("#btn-submit");

        oldPassWord.blur(function () {
            if (oldPassWord.val() != "") {
                $.ajax({
                    type: "post",
                    url: basePath + "customer/checkPassWord.action",
                    data: {
                        "customerPassWord": $("#oldPassWord").val()
                    },
                    contentType: "application/x-www-form-urlencoded;charset=utf-8",
                    success: function (data) {
                        if (data < 0) {
                            newPassWord.attr("disabled", "disabled");
                            rePassWord.attr("disabled", "disabled");
                            btn_submit.attr("disabled", "disabled");
                            newPassWord.attr("placeholder", "旧密码错误！");
                            rePassWord.attr("placeholder", "旧密码错误！");
                            btn_submit.attr("value", "旧密码错误！");
                        } else {
                            newPassWord.removeAttr("disabled");
                            rePassWord.removeAttr("disabled");
                            btn_submit.removeAttr("disabled");
                            newPassWord.attr("placeholder", "新密码");
                            rePassWord.attr("placeholder", "新密码");
                            btn_submit.attr("value", "修改");
                        }
                    }

                });
            }
        });

        newPassWord.blur(function () {
            if (newPassWord.val() != "") {
                if (newPassWord.val() == oldPassWord.val()) {
                    rePassWord.attr("disabled", "disabled");
                    btn_submit.attr("disabled", "disabled");
                    rePassWord.attr("placeholder", "新旧密码不能相同！");
                    btn_submit.attr("value", "新旧密码不能相同！");
                } else {
                    rePassWord.removeAttr("disabled");
                    btn_submit.removeAttr("disabled");
                    rePassWord.attr("placeholder", "新密码");
                    btn_submit.attr("value", "修改");
                }
            }
        });

        rePassWord.blur(function () {
            if (rePassWord.val() != "") {
                if (newPassWord.val() != rePassWord.val()) {
                    btn_submit.attr("disabled", "disabled");
                    btn_submit.attr("value", "两次输入的密码不一致！");
                }else {
                    btn_submit.removeAttr("disabled");
                    btn_submit.attr("value", "修改");
                }
            }
        });

    });
</script>
</body>
</html>
