<#include "../core/_layout.ftl"/>
<@layout>
<head>
<#--<link rel="stylesheet" href="/assets/css/bootstrap.min.css">-->
    <link rel="stylesheet" href="/assets/js/element.css">
<#--<script src="/assets/js/jquery.min.js"></script>-->
<#--<script src="/assets/js/bootstrap.min.js"></script>-->
    <script src="/assets/js/moment.js"></script>

    <script type="text/javascript" charset="utf-8" src="/assets/ueeditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="/assets/ueeditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="/assets/ueeditor/lang/zh-cn/zh-cn.js"></script>
    <script src="/assets/js/vue2.0.js"></script>
    <script type="text/javascript" charset="utf-8" src="/assets/js/vue-resource.min.js"></script>
    <script src="/assets/js/element.js"></script>
</head>
<div class="am-cf admin-main">

<#--渲染左侧菜单-->
    <#include "/admin/core/_sidebar.ftl"/>

    <!-- content start -->
    <div class="admin-content">

        <div class="admin-content-body">
            <div class="am-cf am-padding am-padding-bottom-0">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">板块管理</strong> /
                    <small>总览</small>
                </div>
            </div>

            <hr/>

            <div class="am-g">
                <div class="am-u-sm-3" style="border-right: 1px solid #eeeeee;">
                <#--树形菜单的渲染-->
                    <ul class="am-tree am-tree-folder-select" role="tree" id="categoryTree">
                        <li class="am-tree-branch am-hide" data-template="treebranch" role="treeitem"
                            aria-expanded="false">
                            <div class="am-tree-branch-header">
                            <#--<button class="am-tree-icon am-tree-icon-caret am-icon-caret-right"><span class="am-sr-only">Open</span></button>-->
                                <button class="am-tree-branch-name">
                                    <span class="am-tree-icon am-tree-icon-folder"></span>
                                    <span class="am-tree-label"></span>
                                </button>
                            </div>
                            <ul class="am-tree-branch-children" role="group"></ul>
                            <div class="am-tree-loader" role="alert">加载中...</div>
                        </li>
                        <li class="am-tree-item am-hide" data-template="treeitem" role="treeitem">
                            <button class="am-tree-item-name">
                            <#--<span class="am-tree-icon am-tree-icon-item"></span>-->
                                <span class="am-tree-label"></span>
                            </button>
                        </li>
                    </ul>
                </div>
                <div class="am-u-sm-9">
                    <div class="am-g" id="blog-form" style="display: none" :style="{display:show}">
                        <div class="am-u-sm-12 am-u-md-12">
                            <form class="am-form am-form-inline">
                                <fieldset>
                                    <legend>新闻详情</legend>
                                    <div class="am-form-group" style="display: none">
                                        <input type="text" v-model="currentItem.id">
                                    </div>

                                    <div class="am-form-group am-form-icon am-form-feedback"
                                         :class="{'am-form-error':!currentItem.account, 'am-form-success':!!currentItem.account}">
                                        <label>账号</label>
                                        <input class="am-form-field am-input-sm" type="text"
                                               v-model="currentItem.account"
                                               placeholder="输入账号" :disabled="currentItem.id">
                                        <span :class="{'am-icon-check':!!currentItem.account, 'am-icon-times':!currentItem.account}"></span>
                                    </div>

                                    <div class="am-form-group am-form-icon am-form-feedback"
                                         :class="{'am-form-error':!currentItem.name, 'am-form-success':!!currentItem.name}">
                                        <label>标题</label>
                                        <input class="am-form-field am-input-sm" type="text" v-model="currentItem.name"
                                               placeholder="教师姓名">
                                        <span :class="{'am-icon-check':!!currentItem.name, 'am-icon-times':!currentItem.name}"></span>
                                    </div>

                                    <p>
                                        <button type="button" class="am-btn am-btn-primary" @click="saveItem">保存
                                        </button>
                                        <button type="button" class="am-btn am-btn-danger" @click="deleteItem">删除
                                        </button>
                                        <button type="button" class="am-btn am-btn-default" @click="clearItem">取消
                                        </button>
                                    </p>
                                </fieldset>
                            </form>
                        </div>
                    </div>

                    <div class="am-g">
                    <#--table内容-->
                        <div class="am-u-sm-12">
                            <div id="app">
                                <el-row :gutter="20">
                                    <el-col :span="18">
                                        <el-form :inline="true" :model="blog" @submit.prevent="onSubmit"
                                                 class="demo-form-inline">
                                            <el-form-item>
                                                <el-input id="input" v-model="blog.title" placeholder="标题"></el-input>
                                            </el-form-item>
                                            <el-form-item>
                                                <el-button type="primary" @click.native="save">保存</el-button>
                                            </el-form-item>
                                        </el-form>
                                    </el-col>
                                </el-row>
                                <el-row :gutter="20">
                                    <el-col :span="18">
                                        <script id="editor" type="text/plain" style="height:300px;"></script>
                                    </el-col>
                                </el-row>

                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="/assets/dataTables/amazeui.datatables.min.css">
<link rel="stylesheet" href="/assets/amazeui-tree/amazeui.tree.min.css">
<script type="text/javascript" charset="utf8" src="/assets/dataTables/amazeui.datatables.min.js"></script>
<script src="/assets/amazeui-tree/amazeui.tree.min.js"></script>
<script src="/assets/js/moment.js"></script>

<script type="text/javascript">
    $(function () {

        //init vue share data
        var data = {
            blog: {
                title: ""
            },
            formInline: {
                user: '',
                region: ''
            },
            value8: '',
            dialogVisible: false
        };

        $('#categoryTree').tree({
            dataSource: function (options, callback) {
                $.getJSON("/admin/blog/categories", {id: options.id}, function (data) {
                    for (var d in data) {
                        data[d].title = data[d].name;
                        data[d].type = data[d].subContentTypes.length > 0 ? "folder" : "item"
                    }
                    console.log(data)
                    callback({data: data});
                });
            },
            cacheItems: true,
            folderSelect: false
        });

        $('#categoryTree').on('selected.tree.amui', function (event, d) {
            // do something with data: { selected: [array], target: [object] }
//            table.columns(3).search(data.target.id).draw()
            $.get("/admin/blog/detail?id=" + d.target.id).then(
                    function (json) {
                        if (json != null) {
                            data.blog = json;
                            UE.getEditor('editor').setContent(json.content);
                        } else {
                            data.blog = null;
                            data.blog.type = d.target.id;
                            UE.getEditor('editor').setContent("");
                        }
//                        document.getElementById("input").value = data.title;
                    }, function () {
                        this.$message({
                            message: '读取数据错误，请重试',
                            type: 'error'
                        });
                    }
            )
        });

        $('#categoryTree').on('deselected.tree.amui', function (event, data) {
            console.log(data.target.id);
        });

        $('#dt tbody').on('click', 'button', function (event) {
            var data = table.row($(this).parents('tr')).data();
            if ($(this).hasClass("am-btn-danger")) {
                layer.confirm('确定删除？', {
                    btn: ['确定', '取消'] //按钮
                }, function () {
                    $.get("/admin/blog/delete?id=" + data.id, function (data) {
                        layer.msg('删除成功', {icon: 1});
                        table.draw();
                    })
                });
            } else if ($(this).hasClass("am-btn-default")) {
                layer.open({
                    type: 2,
                    title: '修改新闻',
                    shadeClose: true,
                    shade: 0.8,
                    area: ['80%', '90%'],
                    content: '/admin/blog/content?id=' + data.id,
                })
            } else if ($(this).hasClass("am-btn-success")) {
                layer.confirm('确定审核通过？', {
                    btn: ['确定', '取消'] //按钮
                }, function () {
                    $.get("/admin/blog/verified?id=" + data.id, function (data) {
                        layer.msg('成功通过审核', {icon: 1});
                        table.draw();
                    })
                });
            }
        });

        var ue = UE.getEditor('editor');

        new Vue({
            el: "#app",
            http: {
                root: '/admin/blog'
            },
            data: data,
            methods: {
                save: function () {
                    this.blog.content = UE.getEditor('editor').getContent();
                    this.$http.post('save', this.blog).then(function (json) {
                        this.blog = json.data;
                        this.$message('保存成功');
                    }, function (json) {
                        this.$message({
                            message: '保存错误，请重试',
                            type: 'error'
                        });
                    });
                }
            },
            filters: {
                moment: function (date) {
                    return moment(date).format('YYYY-MM-DD HH:mm:ss');
                }
            },
            watch: {
                blog: function (newvalue) {
                    console.log(newvalue)
                }
            }
        })
    })
    ;
</script>
</@layout>
