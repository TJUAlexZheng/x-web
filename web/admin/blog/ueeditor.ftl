<!DOCTYPE html>
<html lang="en">
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
<body>

<div id="app">
    <el-row :gutter="20">
        <el-col :span="18" :offset="3">
            <h2>新闻内容</h2>
        <#if id??>
            <p>创建于:{{this.blog.createtime | moment}} - 更新时间:{{this.blog.updatetime | moment}}</p>
        </#if>
            <el-form :inline="true" :model="blog" @submit.prevent="onSubmit" class="demo-form-inline">
                <el-form-item>
                    <el-input v-model="blog.title" placeholder="标题"></el-input>
                </el-form-item>
                <el-form-item>
                    <el-select v-model="blog.type" filterable>
                        <el-option
                                v-for="item in categories"
                                :label="item.name"
                                :value="item.id">
                        </el-option>
                    </el-select>
                </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click.native="save">保存</el-button>
                </el-form-item>
            </el-form>
        </el-col>
    </el-row>
    <el-row :gutter="20">
        <el-col :span="18" :offset="3">
            <script id="editor" type="text/plain" style="height:300px;"></script>
        </el-col>
    </el-row>

</div>

<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');

    new Vue({
        el: "#app",
        http: {
            root: '/admin/blog',
        },
        data: {
            blog: {},
            formInline: {
                user: '',
                region: ''
            },
            categories: [],
            value8: '',
            dialogVisible: false
        },
        methods: {
            save: function () {
                this.blog.content = UE.getEditor('editor').getContent();
                this.$http.post('save', this.blog).then(function (json) {
                    this.blog = json.data
                    this.$message('保存成功');
                }, function (json) {
                    this.$message({
                        message: '保存错误，请重试',
                        type: 'error'
                    });
                });
            }
        },
        created: function () {
            this.$http.get("categories").then(
                    function (json) {
                        this.categories = json.data
                    <#if id??>
                        this.$http.get("detail", {params: {id: "${id}"}}).then(
                                function (json) {
                                    this.blog = json.data
                                    UE.getEditor('editor').setContent(this.blog.content)
                                }, function () {
                                    this.$message({
                                        message: '读取数据错误，请重试',
                                        type: 'error'
                                    });
                                }
                        )
                    </#if>
                    }, function () {
                        this.$message({
                            message: '保存错误，请重试',
                            type: 'error'
                        });
                    }
            )

        },
        filters: {
            moment: function (date) {
                return moment(date).format('YYYY-MM-DD HH:mm:ss');
            }
        }
    })
</script>
</body>
</html>