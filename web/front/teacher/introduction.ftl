<!doctype html>
<html class="no-js">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="天津大学材料科学与工程学院主页">
    <meta name="keywords" content="天津大学材料科学与工程学院主页">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>天津大学材料科学与工程学院主页</title>

    <!-- Set render engine for 360 browser -->
    <meta name="renderer" content="webkit">

    <!-- No Baidu Siteapp-->
    <meta http-equiv="Cache-Control" content="no-siteapp"/>

    <link rel="icon" type="image/png" href="/assets/i/favicon.png">

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <link rel="icon" sizes="192x192" href="/assets/i/app-icon72x72@2x.png">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="apple-touch-icon-precomposed" href="/assets/i/app-icon72x72@2x.png">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="/assets/i/app-icon72x72@2x.png">
    <meta name="msapplication-TileColor" content="#0e90d2">

    <link rel="stylesheet" href="/assets/css/amazeui.flat.min.css">
    <link rel="stylesheet" href="/assets/css/app.css">
    <script src="/assets/js/jquery-1.12.4.min.js"></script>

    <script type="text/javascript" charset="utf-8" src="/assets/ueeditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/assets/ueeditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="/assets/ueeditor/lang/zh-cn/zh-cn.js"></script>
    <script src="/assets/js/vue2.0.js"></script>
    <script type="text/javascript" charset="utf-8" src="/assets/js/vue-resource.min.js"></script>
</head>
<body>

<div class="wrap">
    <div class="middles">
        <div id="banner"></div>
        <nav>
            <ul>
                <li>
                    <a href="profile">个人基本信息</a>
                </li>
                <li>
                    <a href="introduction">简介管理</a>
                </li>
                <li>
                    <a href="/teacher/logout">退出</a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="newsarea">
        <h1>简历</h1>
        <hr>
        <div>
            <script id="editor" type="text/plain" style="height:300px;"></script>
            <script type="text/javascript">
                var ue = UE.getEditor('editor');
            </script>
        </div>
        <hr>
        <div id="app">
            <button type="button" class="am-btn am-btn-primary am-center" @click="save">保存</button>
        </div>
    </div>
</div>


<div class="middles">
    <div id="copyRight">版权所有 © 天津大学材料科学与工程学院 2016新版上线<span></span></div>
    <div id="footer">联系地址：天津市海河教育园区雅观道135号31号教学楼 [<a href="http://l.map.qq.com/11222015482?m"
                                                     target="_blank">查看学院地图标注</a>]，邮政编码：300350<br>联系电话：022-27403405
        传真：022-XXXXXXXX 电子邮件：mseic@tju.edu.cn
    </div>
</div>

<script type="text/javascript">
    $(function () {

        //init vue share data
        var ue = UE.getEditor('editor');

        ue.ready(function () {
            new Vue({
                el: "#app",
                http: {
                    root: '/teacher'
                },
                data: {
                    introduction: ''
                },
                methods: {
                    save: function () {
                        this.introduction = UE.getEditor('editor').getContent();
                        this.$http.post('saveIntroduction', this.introduction).then(function (json) {
                            this.introduction = json.data;
                            alert('保存成功');
                        }, function (json) {
                            alert('保存错误，请重试');
                        });
                    }
                },
                created: function () {
                    this.$http.get("getTeacher").then(
                            function (json) {
                                this.introduction = json.data.introduction;
                                UE.getEditor('editor').setContent(this.introduction);
                            }
                    );
                }
            });
        });
    });
</script>

