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
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default" style="margin-bottom: 0">
        <div class="container-fluid">

            <div class="navbar-header">
                <a class="navbar-brand" href="#">神奇餐厅后台端</a>
            </div>

            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="#">菜品管理</a></li>
                    <li><a href="#">流水查询</a></li>
                </ul>
            </div><!-- /.container-fluid -->
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
                    <button type="submit" class="btn btn-primary">查询</button>
                    <div style="float:right;">
                        <a href="#" class="btn btn-danger">批量下架</a>
                        <a href="#" class="btn btn-success" data-toggle="modal"
                           data-target="#cookEditDialog" onclick="addCook()">新增菜品</a>
                        <a href="#" class="btn btn-default">重新上架</a>
                    </div>
                </form>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">菜品列表</div>
                    <table class="table table-bordered table-striped table-condensed">
                        <thead>
                        <tr>
                            <td><strong>#</strong></td>
                            <td><strong>菜名</strong></td>
                            <td><strong>口味</strong></td>
                            <td><strong>库存</strong></td>
                            <td><strong>价格</strong></td>
                            <td><strong>菜系</strong></td>
                            <td><strong>操作</strong></td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${bookList}" var="bookItem">
                            <tr>
                                <td></td>
                                <td>${bookItem.cookName}</td>
                                <td>${bookItem.cookFlavor}</td>
                                <td>${bookItem.cookRepertory}</td>
                                <td>${bookItem.cookPrice}</td>
                                <td>${bookItem.cookType}</td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-xs" data-toggle="modal"
                                       data-target="#cookEditDialog" onclick="editCook(${bookItem.cookId})">修改</a>
                                    <a href="#" class="btn btn-danger btn-xs" onclick="soldOutCook(${bookItem.cookId})">下架</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
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
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="btn_submit" onclick="updateCook()">保存修改
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
    var basePath;
    basePath = curPath.substring(0, curPath.indexOf(pathName)) + "/";

    function editCook(id) {
        $("#btn_submit").attr('onclick', '').unbind('click').click(function () {
            updateCook();
        });
        $.ajax({
            type: "GET",
            url: basePath + "editCook.action",
            data: {"id": id},
            success: function (date) {
                $("#edit_cook_id").val(date.cookId);
                $("#edit_cookName").val(date.cookName);
                $("#edit_cookFlavor").val(date.cookFlavor);
                $("#edit_cookRepertory").val(date.cookRepertory);
                $("#edit_cookPrice").val(date.cookPrice);
                $("#edit_cookType").val(date.cookType);
            }
        });
    }

    function updateCook() {

        $.ajax({
            type: "post",
            url: basePath + "update.action",
            data: {
                "cookId": $("#edit_cook_id").val(),
                "cookName": $("#edit_cookName").val(),
                "cookFlavor": $("#edit_cookFlavor").val(),
                "cookRepertory": $("#edit_cookRepertory").val(),
                "cookPrice": $("#edit_cookPrice").val(),
                "cookType": $("#edit_cookType").val()
            },
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
                url: basePath + "soldOut.action",
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
    }

    function saveCook() {
        $.ajax({
            type: "post",
            url: basePath + "save.action",
            data: {
                "cookName": $("#edit_cookName").val(),
                "cookFlavor": $("#edit_cookFlavor").val(),
                "cookRepertory": $("#edit_cookRepertory").val(),
                "cookPrice": $("#edit_cookPrice").val(),
                "cookType": $("#edit_cookType").val()
            },
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