<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/6/27/0027
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
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
    <title>神奇餐厅</title>

    <link href="<%=basePath%>static/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>static/iconfont/iconfont.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default" style="margin-bottom: 0">
        <div class="container-fluid">

            <div class="navbar-header">
                <a class="navbar-brand" href="#">神奇餐厅后台端</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <c:if test="${user!=null}">
                        <a id="btn_login" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="true"><span class="iconfont icon-user"></span></a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <li><a href="#">欢迎您${user.userName}</a></li>
                            <li><a href="#">更改密码</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#" onclick="loginOutPut()"><span class="iconfont icon-logout"></span>退出</a>
                            </li>
                        </ul>
                    </c:if>
                    <c:if test="${user==null}">
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
                <h1 class="page-header">菜品管理</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <div class="panel panel-default">
            <div class="panel-body">
                <form action="list.action" method="post" class="form-inline">
                    <div class="form-group">
                        <label for="cookName">菜名</label>
                        <input id="cookName" class="form-control" name="cookName" type="text"/>
                    </div>
                    <div class="form-group">
                        <label for="cookFlavor">口味</label>
                        <select class="form-control" id="cookFlavor" name="cookFlavor">
                            <option></option>
                            <c:forEach items="${flavorList}" var="flavorItem">
                                <option>${flavorItem.cookFlavor}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="cookType">菜系</label>
                        <select id="cookType" class="form-control" name="cookType">
                            <option></option>
                            <c:forEach items="${typeList}" var="typeItem">
                                <option>${typeItem.cookType}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary" onclick="selectbtn()">查询</button>
                    <div id="btn_list" style="float:right;">
                        <c:if test="${cookDates.rows.size()>0?cookDates.rows.get(0).cookEnableStatus==0:1==1}">
                            <a href="#" class="btn btn-default" onclick="putAway()">上架</a>
                        </c:if>
                        <a href="#" class="btn btn-danger" onclick="batchSoldOut()">批量下架</a>
                        <a href="#" class="btn btn-success" data-toggle="modal"
                           data-target="#cookEditDialog" onclick="addCook()">新增菜品</a>
                        <a href="#" class="btn btn-default" onclick="putAwaybtn();">重新上架</a>
                    </div>
                </form>
                <form id="form-putAway" action="<%=basePath%>BackStage/putAway.action" method="post"></form>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">菜品列表</div>
                    <table id="table_cookList" class="table table-bordered table-striped table-condensed">
                        <thead>
                        <tr>
                            <c:if test="${cookDates.rows.size()>0?cookDates.rows.get(0).cookEnableStatus==0:1==2}">
                                <td><input type="checkbox" id="checkAll"></td>
                            </c:if>
                            <td><strong>#</strong></td>
                            <td><strong>菜名</strong></td>
                            <td><strong>口味</strong></td>
                            <td><strong>库存</strong></td>
                            <td><strong>价格</strong></td>
                            <td><strong>菜系</strong></td>
                            <td><strong>介绍</strong></td>
                            <td><strong>操作</strong></td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${cookDates.rows}" var="bookItem" varStatus="status">
                            <tr>
                                <c:if test="${bookItem.cookEnableStatus == 0}">
                                    <td><input type="checkbox"  class="check"/></td>
                                </c:if>
                                <td>${status.index+1}</td>
                                <td>${bookItem.cookName}</td>
                                <td>${bookItem.cookFlavor}</td>
                                <td>${bookItem.cookRepertory}</td>
                                <td>${bookItem.cookPrice}</td>
                                <td>${bookItem.cookType}</td>
                                <td>${bookItem.cookDesc}</td>
                                <td>
                                    <c:if test="${bookItem.cookEnableStatus > 0}">
                                        <a href="#" id="btn-edit" class="btn btn-primary btn-xs" data-toggle="modal"
                                           data-target="#cookEditDialog" onclick="editCook(${bookItem.cookId})">修改</a>
                                        <a href="#" id="btn-soldOut" class="btn btn-danger btn-xs"
                                           onclick="soldOutCook(${bookItem.cookId})">下架</a>
                                    </c:if>
                                    <c:if test="${bookItem.cookEnableStatus == 0}">
                                        <a href="#" id="btn-putAway" class="btn btn-info btn-xs"
                                           onclick="putAwayCook(${bookItem.cookId})">上架</a>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <c:if test="${cookDates.pageNum>0}">
            <div class="col-md-12 text-center">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="?page=${cookConditions.page-1==0?1:cookConditions.page-1}&cookName=${cookConditions.cookName}&cookFlavor=${cookConditions.cookFlavor}&cookType=${cookConditions.cookType}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach var="i" begin="1" end="${cookDates.pageNum}" step="1">
                            <li>
                                <a href="?page=${i}&cookName=${cookConditions.cookName}&cookFlavor=${cookConditions.cookFlavor}&cookType=${cookConditions.cookType}">${i}</a>
                            </li>
                        </c:forEach>
                        <li>
                            <a href="?page=${cookConditions.page+1>cookDates.pageNum?cookDates.pageNum:cookConditions.page+1}&cookName=${cookConditions.cookName}&cookFlavor=${cookConditions.cookFlavor}&cookType=${cookConditions.cookType}"
                               aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </c:if>

        <div class="modal fade" id="cookEditDialog" tabindex="-1" role="dialog"
             aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="myModalLabel">修改菜品</h4>
                    </div>
                    <div class="modal-body">
                        <form class="form-horizontal" id="edit_cook_form">
                            <input type="hidden" id="edit_cook_id" name="cookId"/>
                            <div class="form-group">
                                <label for="edit_cookName" style="float:left;padding:7px 15px 0 27px;">菜名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_cookName" placeholder="菜名"
                                           name="cookName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_cookFlavor" style="float:left;padding:7px 15px 0 27px;">口味</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_cookFlavor" placeholder="口味"
                                           name="cookFlavor">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_cookRepertory" style="float:left;padding:7px 15px 0 27px;">库存</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_cookRepertory" placeholder="库存"
                                           name="cookRepertory">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_cookPrice" style="float:left;padding:7px 15px 0 27px;">价格</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_cookPrice" placeholder="价格"
                                           name="cookPrice">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_cookType" style="float:left;padding:7px 15px 0 27px;">菜系</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_cookType" placeholder="菜系"
                                           name="cookType">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_cookDesc" style="float:left;padding:7px 15px 0 27px;">介绍</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_cookDesc" placeholder="介绍"
                                           name="cookDesc">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="btn_cook_submit" onclick="updateCook()">保存修改
                        </button>
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
                        <form class="form-horizontal" id="user_login_form">
                            <div class="form-group">
                                <label for="edit_cookName" style="float:left;padding:7px 15px 0 27px;">账号</label>
                                <div class="col-sm-10">
                                    <input id="userName_input" type="text" class="form-control" id="edit_userName"
                                           placeholder="账号"
                                           name="userName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_cookFlavor" style="float:left;padding:7px 15px 0 27px;">密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="edit_passWord" placeholder="密码"
                                           name="passWord">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="btn_user_submit" onclick="userLogin()">登陆
                        </button>
                    </div>
                </div>
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
    var addCheckAllBox = $("#table_cookList thead tr");
    var addCheckBoxs = $("#table_cookList tbody tr");
    var checkAllBox = $("#checkAll");
    var checkBoxs = $(".check");


    $(function () {
        if (${user==null}) {
            if (${msg != null}) {
                alert("${msg}");
                $("#btn_login").trigger("click");
            }
        }
        addCheckAllBox.on("click", checkAllBox, function () {
            $(".check").prop("checked", $("#checkAll").prop("checked"));
        });
        addCheckBoxs.on("click", checkBoxs, function () {
            var flag = $(".check:checked").length == $(".check").length;
            $("#checkAll").prop("checked", flag);
        });
    });

    function batchSoldOut() {
        if ($("#checkAll").length <= 0) {
            $("#btn_list").prepend('<a href="#" class="btn btn-danger" onclick="SoldOut()">下架</a>')
            addCheckAllBox.prepend('<td><input type="checkbox" id="checkAll"></td>');
            addCheckBoxs.prepend("<td><input type='checkbox' class='check'></td>");
        } else {
            $("#btn_list a:first").remove();
            addCheckAllBox.children("td:first").remove();
            addCheckBoxs.children("td:first-child").remove();
        }
    }

    function SoldOut() {
        if (confirm("确定要下架商品吗")) {
            $.each($(".check:checked"), function () {
                var cookName = $(this).parents("tr").find("td:eq(2)").text();
                $.ajax({
                    type: "post",
                    url: basePath + "BackStage/batchSoldOut.action",
                    data: {
                        "cookName": cookName
                    },
                    contentType: "application/x-www-form-urlencoded;charset=utf-8",
                    success:function () {
                        window.location.reload();
                    }
                });
            });
        }
    }

    function putAwaybtn() {
        $("#form-putAway").submit();
    }


    function putAway() {
        if (confirm("确定要上架商品吗")) {
            $.each($(".check:checked"), function () {
                var cookName = $(this).parents("tr").find("td:eq(2)").text();
                $.ajax({
                    type: "post",
                    url: basePath + "BackStage/batchPutAway.action",
                    data: {
                        "cookName": cookName
                    },
                    contentType: "application/x-www-form-urlencoded;charset=utf-8",
                    success:function () {
                        window.location.reload();
                    }
                });
            });
        }
    }

    function loginOutPut() {
        $.ajax({
            type: "get",
            url: basePath + "user/loginOutPut.action",
            success: function () {
                window.location.reload();
            }
        });
        // window.location.reload();
    }


    function userLogin() {
        $.ajax({
            type: "post",
            url: basePath + "user/login.action",
            data: $("#user_login_form").serialize(),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (date) {
                if (date.msg == "loginSuccess") {
                    alert("登陆成功");
                } else {
                    alert("登陆失败");
                }
                window.location.reload();
            }
        });
    }

    function putAwayCook(id) {
        if (confirm('确实要重新上架该菜品吗?')) {
            $.ajax({
                type: "post",
                url: basePath + "BackStage/editEnableStatus.action",
                data: {"id": id},
                success: function (date) {
                    if (date > 0) {
                        alert("菜品上架成功")
                    } else {
                        alert("菜品上架失败")
                    }
                    window.location.reload();
                }
            });
        }
    }

    function editCook(id) {
        $("#btn_submit").attr('onclick', '').unbind('click').click(function () {
            updateCook();
        });
        $.ajax({
            type: "GET",
            url: basePath + "BackStage/editCook.action",
            data: {"id": id},
            success: function (date) {
                $("#edit_cook_id").val(date.cookId);
                $("#edit_cookName").val(date.cookName);
                $("#edit_cookFlavor").val(date.cookFlavor);
                $("#edit_cookRepertory").val(date.cookRepertory);
                $("#edit_cookPrice").val(date.cookPrice);
                $("#edit_cookType").val(date.cookType);
                $("#edit_cookDesc").val(date.cookDesc);
            }
        });
    }

    function updateCook() {

        $.ajax({
            type: "post",
            url: basePath + "BackStage/update.action",
            data: $("#edit_cook_form").serialize(),
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                if (data > 0) {
                    alert("菜品信息更新成功！");
                } else {
                    alert("菜品信息更新失败！");
                }
                window.location.reload();
            },
            error: function () {
                alert("菜品信息更新失败! ");
            }
        });
    }

    function soldOutCook(id) {
        if (confirm('确实要下架该菜品吗?')) {
            $.ajax({
                type: "post",
                url: basePath + "BackStage/soldOut.action",
                data: {"cookId": id},
                success: function (data) {
                    if (data > "0") {
                        alert("菜品信息下架成功！");
                    } else {
                        alert("菜品信息下架失败！");
                    }
                    window.location.reload();
                }
            });
        }
    }

    function addCook() {
        $("#btn_submit").attr('onclick', '').unbind('click').click(function () {
            saveCook();
        });
        $("#myModalLabel").text("新增菜品");
        $("#edit_cook_id").val("");
        $("#edit_cookName").val("");
        $("#edit_cookFlavor").val("");
        $("#edit_cookRepertory").val("");
        $("#edit_cookPrice").val("");
        $("#edit_cookType").val("");
        $("#edit_cookDesc").val("");
    }

    function saveCook() {
        $.ajax({
            type: "post",
            url: basePath + "BackStage/save.action",
            data: {
                "cookName": $("#edit_cookName").val(),
                "cookFlavor": $("#edit_cookFlavor").val(),
                "cookRepertory": $("#edit_cookRepertory").val(),
                "cookPrice": $("#edit_cookPrice").val(),
                "cookType": $("#edit_cookType").val(),
                "cookDesc": $("#edit_cookDesc").val()
            },
            contentType: "application/x-www-form-urlencoded;charset=utf-8",
            success: function (data) {
                if (data > 0) {
                    alert("菜品信息新增成功！");
                } else {
                    alert("菜品信息新增失败！");
                }
                window.location.reload();
            },
            error: function () {
                alert("菜品信息更新失败! ");
            }
        });
    }
</script>
</body>
</html>