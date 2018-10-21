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
    <div class="htmleaf-container">
        <div class="demo form-bg" style="padding: 50px 0;">
            <div class="container">
                <div class="row">
                    <div class="col-md-offset-3 col-md-6">
                        <form class="form-horizontal" action="<%=basePath%>customer/registerCustomer.action"
                              method="post">
                            <span class="heading">注册账号</span>
                            <div class="form-group">
                                <input type="text" name="customerUserName" id="customerUserName" class="form-control"
                                       placeholder="账号">
                                <i class="fa fa-user"></i>
                            </div>
                            <div class="form-group">
                                <input type="text" name="customerPassWord" id="customerPassWord" class="form-control"
                                       placeholder="密码">
                                <i class="fa fa-user"></i>
                            </div>
                            <div class="form-group">
                                <input type="text" name="customerName" id="customerName" class="form-control"
                                       placeholder="昵称">
                                <i class="fa fa-user"></i>
                            </div>
                            <div class="form-group">
                                <input type="text" name="customerGender" id="customerGender" class="form-control"
                                       placeholder="性别">
                                <i class="fa fa-user"></i>
                            </div>
                            <div class="form-group">
                                <input type="text" name="customerAddress" id="customerAddress" class="form-control"
                                       placeholder="住址">
                                <i class="fa fa-user"></i>
                            </div>

                            <div class="form-group">
                                <input type="submit" id="btn-submit" class="btn btn-default" value="注册"/>
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
        var customerUserName = $("#customerUserName");
        var customerPassWord = $("#customerPassWord");
        var customerName = $("#customerName");
        var customerGender = $("#customerGender");
        var customerAddress = $("#customerAddress");
        var btnSubmit = $("#btn-submit");

        customerUserName.blur(function () {
            if (customerUserName.val() != "") {
                $.ajax({
                    type: "post",
                    url: basePath + "customer/checkCustomerUserName.action",
                    data: {
                        "customerUserName": customerUserName.val()
                    },
                    contentType: "application/x-www-form-urlencoded;charset=utf-8",
                    success: function (data) {
                        if (data < 0) {
                            customerPassWord.attr("disabled", "disabled");
                            customerName.attr("disabled", "disabled");
                            customerGender.attr("disabled", "disabled！");
                            customerAddress.attr("disabled", "disabled！");
                            btnSubmit.attr("disabled", "disabled！");

                            customerPassWord.attr("placeholder", "账号已存在！");
                            customerName.attr("placeholder", "账号已存在！");
                            customerGender.attr("placeholder", "账号已存在！！");
                            customerAddress.attr("placeholder", "账号已存在！！");
                            btnSubmit.attr("value", "账号已存在！！");
                        } else {
                            customerPassWord.removeAttr("disabled");
                            customerName.removeAttr("disabled");
                            customerGender.removeAttr("disabled");
                            customerAddress.removeAttr("disabled");
                            btnSubmit.removeAttr("disabled");

                            customerPassWord.attr("placeholder", "密码");
                            customerName.attr("placeholder", "昵称");
                            customerGender.attr("placeholder", "性别");
                            customerAddress.attr("placeholder", "住址");
                            btnSubmit.attr("value", "注册");
                        }
                    }

                });
            }
        });

        customerPassWord.blur(function () {
            if (customerPassWord.val() != "") {
                if (customerPassWord.val().length < 6) {
                    customerName.attr("disabled", "disabled");
                    customerGender.attr("disabled", "disabled");
                    customerAddress.attr("disabled", "disabled");
                    btnSubmit.attr("disabled", "disabled");

                    customerName.attr("placeholder", "密码长度不能低于6！");
                    customerGender.attr("placeholder", "密码长度不能低于6！");
                    customerAddress.attr("placeholder", "密码长度不能低于6！");
                    btnSubmit.attr("value", "密码长度不能低于6！");
                } else {
                    customerName.removeAttr("disabled");
                    customerGender.removeAttr("disabled");
                    customerAddress.removeAttr("disabled");
                    btnSubmit.removeAttr("disabled");

                    customerName.attr("placeholder", "昵称");
                    customerGender.attr("placeholder", "性别");
                    customerAddress.attr("placeholder", "住址");
                    btnSubmit.attr("value", "注册");
                }
            }
        });
    });
</script>
</body>
</html>
