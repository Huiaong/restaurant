<%--
  Created by IntelliJ IDEA.
  User: Huiaong
  Date: 2018/10/1
  Time: 21:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Bootstrap 附加导航（Affix）插件</title>
    <link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
    <div class="jumbotron">
        <h1>Bootstrap Affix</h1>
    </div>
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="125">
                <li class="active"><a href="#section-1">第一部分</a></li>
                <li><a href="#section-2">第二部分</a></li>
                <li><a href="#section-3">第三部分</a></li>
                <li><a href="#section-4">第四部分</a></li>
                <li><a href="#section-5">第五部分</a></li>
            </ul>
        </div>
        <div class="col-xs-9">
            <h2 id="section-1">第一部分</h2>
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <h2 id="section-2">第二部分</h2>
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <h2 id="section-3">第三部分</h2>
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <h2 id="section-4">第四部分</h2>
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <hr>
            <h2 id="section-5">第五部分</h2>
            <div class="row">
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3">
                    <div class="thumbnail">
                        <img src="http://www.runoob.com/wp-content/uploads/2014/06/bs-thumbnails.jpg"
                             alt="通用的占位符缩略图">
                        <div class="caption">
                            <h3>缩略图标签</h3>
                            <p>一些示例文本。一些示例文本。</p>
                            <p>
                                <a href="#" class="btn btn-primary" role="button">
                                    按钮
                                </a>
                                <a href="#" class="btn btn-default" role="button">
                                    按钮
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>