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

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<%=basePath%>static/iconfont/iconfont.css" rel="stylesheet" type="text/css"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/css/fileinput.min.css" media="all"
          rel="stylesheet" type="text/css"/>
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
                    <c:if test="${admin!=null}">
                        <a id="btn_login" href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true"
                           aria-expanded="true"><span class="iconfont icon-user"></span></a>
                        <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <li><a href="#">欢迎您${admin.adminUserName}</a></li>
                            <li><a href="#">更改密码</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#" onclick="loginOutPut()"><span class="iconfont icon-logout"></span>退出</a>
                            </li>
                        </ul>
                    </c:if>
                    <c:if test="${admin==null}">
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
                <form id="select_form" action="list.action" method="post" class="form-inline">
                    <div class="form-group">
                        <label for="productName">菜名</label>
                        <input id="productName" class="form-control" name="productName" type="text"/>
                    </div>
                    <div class="form-group">
                        <label for="productFlavor">口味</label>
                        <select class="form-control" id="productFlavor" name="productFlavor">
                            <option></option>
                            <c:forEach items="${flavorList}" var="flavorItem">
                                <option>${flavorItem.productFlavor}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="productType">菜系</label>
                        <select id="productType" class="form-control" name="productType">
                            <option></option>
                            <c:forEach items="${typeList}" var="typeItem">
                                <option>${typeItem.productType}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">查询</button>
                    <div id="btn_list" style="float:right;">
                        <c:if test="${cookDates.rows.size()>0?cookDates.rows.get(0).productEnableStatus==0:false}">
                            <a href="#" class="btn btn-default" onclick="putAway()">上架</a>
                        </c:if>
                        <c:if test="${cookDates.rows.size()>0?cookDates.rows.get(0).productEnableStatus>0:false}">
                            <a href="#" class="btn btn-danger" onclick="batchSoldOut()">批量下架</a>
                        </c:if>
                        <a href="#" class="btn btn-success" data-toggle="modal"
                           data-target="#cookEditDialog" onclick="addProduct()">新增菜品</a>
                        <a href="#" class="btn btn-default" onclick="putAwaybtn();">重新上架</a>
                    </div>
                </form>
                <form id="form-putAway" action="<%=basePath%>backStage/putAwayProduct.action" method="post"></form>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">菜品列表</div>
                    <table id="table_cookList" class="table table-bordered table-striped table-condensed">
                        <thead>
                        <tr>
                            <c:if test="${cookDates.rows.size()>0?cookDates.rows.get(0).productEnableStatus==0:false}">
                                <td><input type="checkbox" id="checkAll"></td>
                            </c:if>
                            <td><strong>#</strong></td>
                            <td><strong>菜名</strong></td>
                            <td><strong>口味</strong></td>
                            <td><strong>库存</strong></td>
                            <td><strong>价格</strong></td>
                            <td><strong>菜系</strong></td>
                            <td><strong>介绍</strong></td>
                            <td><strong>图片</strong></td>
                            <td><strong>操作</strong></td>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${cookDates.rows}" var="bookItem" varStatus="status">
                            <tr>
                                <c:if test="${bookItem.productEnableStatus == 0}">
                                    <td><input type="checkbox" class="check"/></td>
                                </c:if>
                                <td>${status.index+1}</td>
                                <td>${bookItem.productName}</td>
                                <td>${bookItem.productFlavor}</td>
                                <td>${bookItem.productRepertory}</td>
                                <td>${bookItem.productPrice}</td>
                                <td>${bookItem.productType}</td>
                                <td>${bookItem.productDesc}</td>
                                <td><a name="popover" data-toggle="popover"
                                       data-content="<a href='#' class='thumbnail'>
                                    <img src='${bookItem.productImage}' alt='${bookItem.productImage}'>
                                    </a>
                                    ">${bookItem.productImage}</a>
                                </td>
                                <td>
                                    <c:if test="${bookItem.productEnableStatus > 0}">
                                        <a href="#" id="btn-edit" class="btn btn-primary btn-xs" data-toggle="modal"
                                           data-target="#cookEditDialog" onclick="editProduct(${bookItem.productId})">修改</a>
                                        <a href="#" id="btn-soldOut" class="btn btn-danger btn-xs"
                                           onclick="soldOutProduct(${bookItem.productId})">下架</a>
                                    </c:if>
                                    <c:if test="${bookItem.productEnableStatus == 0}">
                                        <a href="#" id="btn-putAway" class="btn btn-info btn-xs"
                                           onclick="putAwayProduct(${bookItem.productId})">上架</a>
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
                            <a href="?page=${cookConditions.page-1==0?1:cookConditions.page-1}&productName=${cookConditions.productName}&productFlavor=${cookConditions.productFlavor}&productType=${cookConditions.productType}"
                               aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach var="i" begin="1" end="${cookDates.pageNum}" step="1">
                            <li>
                                <a href="?page=${i}&productName=${cookConditions.productName}&productFlavor=${cookConditions.productFlavor}&productType=${cookConditions.productType}">${i}</a>
                            </li>
                        </c:forEach>
                        <li>
                            <a href="?page=${cookConditions.page+1>cookDates.pageNum?cookDates.pageNum:cookConditions.page+1}&productName=${cookConditions.productName}&productFlavor=${cookConditions.productFlavor}&productType=${cookConditions.productType}"
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
                        <form class="form-horizontal" id="edit_product_form">
                            <input type="hidden" id="edit_productId" name="productId"/>
                            <div class="form-group">
                                <label for="edit_productName" style="float:left;padding:7px 15px 0 27px;">菜名</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_productName" placeholder="菜名"
                                           name="productName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_productFlavor" style="float:left;padding:7px 15px 0 27px;">口味</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_productFlavor" placeholder="口味"
                                           name="productFlavor">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_productRepertory" style="float:left;padding:7px 15px 0 27px;">库存</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_productRepertory" placeholder="库存"
                                           name="productRepertory">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_productPrice" style="float:left;padding:7px 15px 0 27px;">价格</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_productPrice" placeholder="价格"
                                           name="productPrice">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_productType" style="float:left;padding:7px 15px 0 27px;">菜系</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_productType" placeholder="菜系"
                                           name="productType">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_productDesc" style="float:left;padding:7px 15px 0 27px;">介绍</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="edit_productDesc" placeholder="介绍"
                                           name="productDesc">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_productImage" style="float:left;padding:7px 15px 0 27px;">图片</label>
                                <div class="col-sm-10">
                                    <input id="edit_productImage" name="file" type="file" class="file"
                                           data-show-preview="false" data-show-upload="false">
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary" id="btn_cook_submit" onclick="updateProduct()">保存修改
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
                        <form class="form-horizontal" id="customer_login_form">
                            <div class="form-group">
                                <label for="edit_adminUserName" style="float:left;padding:7px 15px 0 27px;">账号</label>
                                <div class="col-sm-10">
                                    <input id="productUserName_input" type="text" class="form-control" id="edit_adminUserName"
                                           placeholder="账号"
                                           name="adminUserName">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="edit_adminPassWord" style="float:left;padding:7px 15px 0 27px;">密码</label>
                                <div class="col-sm-10">
                                    <input type="password" class="form-control" id="edit_adminPassWord" placeholder="密码"
                                           name="adminPassWord">
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
<script src="https://cdn.jsdelivr.net/npm/jquery@1.12.4/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/fileinput.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-fileinput/4.4.9/js/locales/zh.js"></script>

<script type="text/javascript">
    var curPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var basePath = curPath.substring(0, curPath.indexOf(pathName)) + "/";
    var addCheckAllBox = $("#table_cookList thead tr");
    var addCheckBoxs = $("#table_cookList tbody tr");
    var checkAllBox = $("#checkAll");
    var checkBoxs = $(".check");


    $(function () {
        if (${admin==null}) {
            if (${msg != null}) {
                alert("${msg}");
                $("#btn_login").trigger("click");
            }
        } else {
            if (${msg != null}) {
                alert("${msg}");
                loginOutPut();
            }
        }
        addCheckAllBox.on("click", checkAllBox, function () {
            $(".check").prop("checked", $("#checkAll").prop("checked"));
        });
        addCheckBoxs.on("click", checkBoxs, function () {
            var flag = $(".check:checked").length == $(".check").length;
            $("#checkAll").prop("checked", flag);
        });
        $("a[name = popover]").popover({
            trigger: 'hover',//鼠标以上时触发弹出提示框
            html: true, //开启html 为true的话，data-content里就能放html代码了
            placement: 'top'
        });
    });

    function batchSoldOut() {
        if ($("#btn_SoldOut").length <= 0) {
            $("#btn_list").prepend('<a href="#" id="btn_SoldOut" class="btn btn-danger" onclick="SoldOut()">下架</a>')
            addCheckAllBox.prepend('<td><input type="checkbox" id="checkAll"></td>');
            addCheckBoxs.prepend("<td><input type='checkbox' class='check'></td>");
        } else {
            $("#btn_SoldOut").remove();
            addCheckAllBox.children("td:first").remove();
            addCheckBoxs.children("td:first-child").remove();
        }
    }

    function SoldOut() {
        if ($(".check:checked").length > 0) {
            if (confirm("确定要下架商品吗")) {
                $.each($(".check:checked"), function () {
                    var productName = $(this).parents("tr").find("td:eq(2)").text();
                    $.ajax({
                        type: "post",
                        url: basePath + "backStage/batchSoldOutProduct.action",
                        data: {
                            "productName": productName
                        },
                        contentType: "application/x-www-form-urlencoded;charset=utf-8",
                        success: function () {
                            window.location.reload();
                        }
                    });
                });
            }
        }else {
            alert("请先勾选想要下架的菜品！");
        }
    }

    function putAwaybtn() {
        if (${cookDates.rows.get(0).productEnableStatus!=0}) {
            $("#form-putAway").submit();
        } else {
            $("#select_form").submit();
        }
    }


    function putAway() {
        if ($(".check:checked").length > 0) {
            if (confirm("确定要上架商品吗")) {
                $.each($(".check:checked"), function () {
                    var productName = $(this).parents("tr").find("td:eq(2)").text();
                    $.ajax({
                        type: "post",
                        url: basePath + "backStage/batchPutAwayProduct.action",
                        data: {
                            "productName": productName
                        },
                        contentType: "application/x-www-form-urlencoded;charset=utf-8",
                        success: function () {
                            window.location.reload();
                        }
                    });
                });
            }
        }
    }

    function loginOutPut() {
        $.ajax({
            type: "get",
            url: basePath + "admin/loginOutPut.action",
            success: function () {
                window.location.reload();
            }
        });
        // window.location.reload();
    }


    function userLogin() {
        $.ajax({
            type: "post",
            url: basePath + "admin/login.action",
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

    function putAwayProduct(id) {
        if (confirm('确实要重新上架该菜品吗?')) {
            $.ajax({
                type: "post",
                url: basePath + "backStage/editProductEnableStatus.action",
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

    function editProduct(id) {
        $("#btn_submit").attr('onclick', '').unbind('click').click(function () {
            updateProduct();
        });
        $.ajax({
            type: "GET",
            url: basePath + "backStage/getProduct.action",
            data: {"id": id},
            success: function (date) {
                $("#edit_productId").val(date.productId);
                $("#edit_productName").val(date.productName);
                $("#edit_productFlavor").val(date.productFlavor);
                $("#edit_productRepertory").val(date.productRepertory);
                $("#edit_productPrice").val(date.productPrice);
                $("#edit_productType").val(date.productType);
                $("#edit_productDesc").val(date.productDesc);
            }
        });
    }

    function updateProduct() {
        var formData = new FormData($("#edit_product_form")[0]);
        $.ajax({
            type: "post",
            url: basePath + "backStage/updateProduct.action",
            data: formData,
            async: false,
            contentType: false,
            processData: false,
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

    function soldOutProduct(id) {
        if (confirm('确实要下架该菜品吗?')) {
            $.ajax({
                type: "post",
                url: basePath + "backStage/soldOutProduct.action",
                data: {"productId": id},
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

    function addProduct() {
        $("#btn_submit").attr('onclick', '').unbind('click').click(function () {
            saveProduct();
        });
        $("#myModalLabel").text("新增菜品");
        $("#edit_productId").val("");
        $("#edit_productName").val("");
        $("#edit_productFlavor").val("");
        $("#edit_productRepertory").val("");
        $("#edit_productPrice").val("");
        $("#edit_productType").val("");
        $("#edit_productDesc").val("");
    }

    function saveProduct() {
        var formData = new FormData($("#edit_product_form")[0]);
        $.ajax({
            type: "post",
            url: basePath + "backStage/saveProduct.action",
            data: formData,
            async: false,
            contentType: false,
            processData: false,
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