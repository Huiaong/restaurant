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

    <link href="../../static/bootstrap/bootstrap.min.css" rel="stylesheet">
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

    <div style="padding-left: 35px">
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
                        <label for="cookFlavour">口味</label>
                        <select class="form-control" id="cookFlavour" name="cookFlavour">
                            <option></option>
                            <c:forEach items="${cookFlavour}" var="typeitem">
                                <option>${typeitem.cookFlavour}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="cookType">菜系</label>
                        <select id="cookType" class="form-control" name="cookType">
                            <option></option>
                            <c:forEach items="${cookType}" var="typeitem">
                                <option>${typeitem.cookType}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
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
                        <c:forEach items="${cookBooks}" var="row">
                            <tr>
                                <td></td>
                                <td>${row.cookName}</td>
                                <td>${row.cookFlavour}</td>
                                <td>${row.cookRepertory}</td>
                                <td>${row.cookPrice}</td>
                                <td>${row.cookType}</td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-xs">修改</a>
                                    <a href="#" class="btn btn-danger btn-xs">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../../static/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="../../static/bootstrap/bootstrap.min.js"></script>

<script type="text/javascript">
    $(function () {
        var btn_delete = $('#btn_delete');
        var btn_update = $('#btn_update');
        var form = $('#du_Form');
        btn_delete.click(function deleteAction() {
            form.attr("action", "delete.action");
        });

        btn_update.click(function updateAction() {
            form.attr("action", "update.action");
        });
    });
</script>
</body>
</html>