<#include "../core/_layout.ftl"/>
<@layout>

<div class="am-cf admin-main">

<#--渲染左侧菜单-->
    <#include "/admin/core/_sidebar.ftl"/>

    <!-- content start -->
    <div class="admin-content">

        <div class="admin-content-body">
            <div class="am-cf am-padding am-padding-bottom-0">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">新闻管理</strong> /
                    <small>总览</small>
                </div>
            </div>

            <hr/>

            <div class="am-g">
                <div class="am-u-sm-3" style="border-right: 1px solid #eeeeee;">
                    <h3 style="text-align: center">类型</h3>
                    <hr>
                    <#--树形菜单的渲染-->
                    <ul class="am-tree am-tree-folder-select" role="tree" id="categoryTree">
                        <li class="am-tree-branch am-hide" data-template="treebranch" role="treeitem" aria-expanded="false">
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
                            <table id="dt"
                                   class="am-table am-table-striped am-table-bordered am-table-compact am-text-nowrap display">
                                <thead>
                                <tr>
                                    <th class="table-check">编号</th>
                                    <th class="table-id">标题</th>
                                    <th class="table-title">标题</th>
                                    <th class="table-type">操作</th>
                                <#--<th class="table-author am-hide-sm-only">作者</th>-->
                                <#--<th class="table-date am-hide-sm-only">修改日期</th>-->
                                <#--<th class="table-set">操作</th>-->
                                </tr>
                                </thead>
                                <tbody>
                                <#--<tr>-->
                            <#--<td><input type="checkbox"/></td>-->
                            <#--<td>1</td>-->
                            <#--<td><a href="#">Business management</a></td>-->
                            <#--<td>default</td>-->
                            <#--<td class="am-hide-sm-only">测试1号</td>-->
                            <#--<td class="am-hide-sm-only">2014年9月4日 7:28:47</td>-->
                            <#--<td>-->
                                <#--<div class="am-btn-toolbar">-->
                                    <#--<div class="am-btn-group am-btn-group-xs">-->
                                        <#--<button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span-->
                                                <#--class="am-icon-pencil-square-o"></span> 编辑-->
                                        <#--</button>-->
                                        <#--<button class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span-->
                                                <#--class="am-icon-copy"></span> 复制-->
                                        <#--</button>-->
                                        <#--<button class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only">-->
                                            <#--<span class="am-icon-trash-o"></span> 删除-->
                                        <#--</button>-->
                                    <#--</div>-->
                                <#--</div>-->
                            <#--</td>-->
                        <#--</tr>-->

                                </tbody>
                            </table>
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
<script type="text/javascript" charset="utf-8" src="/assets/js/vue.min.js"></script>
<script type="text/javascript" charset="utf-8" src="/assets/js/vue-resource.min.js"></script>

<script type="text/javascript">
    $(function () {

        //init vue share data
        var teacherData = {
            currentItem: null
        };

        $('#categoryTree').tree({
            dataSource: function(options, callback) {
                $.getJSON("categories", {id:options.id}, function (data) {
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
        //init jquery datagrid
        var table = $('#dt').DataTable({
            "ajax": {
                "url": "/admin/blog/list",
                "dataSrc": function (json) {
                    json.data = json.list
                    json.recordsTotal = json.totalRow
                    json.recordsFiltered = json.totalRow
                    return json.data;
                }
            },
            searchDelay: 350,
            processing: true,
            serverSide: true,
            "dom": '<"am-g am-datatable-hd" <"am-u-sm-6" <"am-btn-toolbar">> <"am-u-sm-6"f>>lrt<"am-g am-datatable-footer" <"am-u-sm-5"i> <"am-u-sm-7"p>>',
            "autoWidth": true,
            "columns": [
                {"data": "id"},
                {"data": "title"},
                {"data": "type"},
                {"data": ""}
            ],
            "columnDefs": [{
                "targets": -1,
                "data": null,
                "defaultContent": '<div class="am-btn-toolbar"> <div class="am-btn-group am-btn-group-xs"> <button class="am-btn am-btn-default am-btn-xs am-text-secondary"><span class="am-icon-pencil-square-o"></span> 查看详情 </button></div>'
            }]
        });

        $('#categoryTree').on('selected.tree.amui', function (event, data) {
            // do something with data: { selected: [array], target: [object] }
            table.columns(3).search(data.target.id).draw()
        });

        $('#categoryTree').on('deselected.tree.amui', function (event, data) {
            // do something with data: { selected: [array], target: [object] }
            console.log(data.target.id)
            table.columns(3).search("").draw()
        });

        $('#dt tbody').on('click', 'tr', function () {
//                teacherData.currentItem = table.row($(this).parents('tr')).data();
            if ($(this).hasClass('selected')) {
//                    teacherData.currentItem =null;
                $(this).removeClass('selected');
            }
            else {
                table.$('tr.selected').removeClass('selected');
                $(this).addClass('selected');
            }
        });

        $('#dt tbody').on('click', 'button', function (event) {
            event.stopPropagation();
            event.preventDefault();
            var data = table.row($(this).parents('tr')).data();
            teacherData.currentItem = data;
            window.open("content?id=" + data.id)
            console.log(data)
        });

        $("div.am-btn-toolbar").html('<div class="am-btn-group am-btn-group-xs"><button id="btn-add" type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span>新增 </button></div>');

        $("#btn-add").on('click', function () {
            teacherData.currentItem = {};
        })


        //init vue component
        new Vue({
            http: {
                root: '/admin/teacher',
            },
            el: "#blog-form",
            data: teacherData,
            methods: {
                "saveItem": function () {
                    this.$http.post('save', this.currentItem).then(function (json) {
                        this.currentItem = null;
                        table.draw();
                        layer.alert('操作成功');
                    }, function (json) {
                        layer.alert('操作失败，请重试');
                    });

                },
                "deleteItem": function () {
                    this.$http.get('delete', {
                        params: {id: this.currentItem.id}
                    }).then(function (json) {
                        this.currentItem = null;
                        table.draw();
                        layer.alert('操作成功');
                    }, function (json) {
                        layer.alert('操作失败，请重试');
                    });

                },
                "clearItem": function () {
                    this.currentItem = null;
                }
            },
            computed: {
                show: function () {
                    return !this.currentItem ? 'none' : 'block';
                }
            }
        });
    });
</script>
</@layout>
