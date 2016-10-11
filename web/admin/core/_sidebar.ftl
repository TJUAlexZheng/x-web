<!-- sidebar start -->
<div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
        <ul class="am-list admin-sidebar-list">
            <li><a href="/admin"><span class="am-icon-home"></span> 首页</a></li>

        <#if session.userPrivileges?seq_contains("3")>
            <li><a href="/admin/teacher"><span class="am-icon-home"></span> 教师</a></li>
        </#if>
        <#if session.userPrivileges?seq_contains("11")>
            <li><a href="/admin/news"><span class="am-icon-home"></span> 新闻</a></li>
        </#if>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#admin-collapse'}"><span class="am-icon-file"></span>
                    板块 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub am-in" id="admin-collapse">
                    <li><a href="/admin/blog/verify"><span class="am-icon-table"></span> 文章审核</a></li>
                    <li><a href="/admin/blog"><span class="am-icon-pencil-square-o"></span> 文章发布</a>
                    </li>
                </ul>
            </li>

        <#--<li class="admin-parent">-->
        <#--<a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span>-->
        <#--页面模块 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>-->
        <#--<ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">-->
        <#--<li><a href="admin-user.html" class="am-cf"><span class="am-icon-check"></span> 个人资料<span-->
        <#--class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>-->
        <#--<li><a href="admin-help.html"><span class="am-icon-puzzle-piece"></span> 帮助页</a></li>-->
        <#--<li><a href="admin-gallery.html"><span class="am-icon-th"></span> 相册页面<span-->
        <#--class="am-badge am-badge-secondary am-margin-right am-fr">24</span></a></li>-->
        <#--<li><a href="admin-log.html"><span class="am-icon-calendar"></span> 系统日志</a></li>-->
        <#--<li><a href="admin-404.html"><span class="am-icon-bug"></span> 404</a></li>-->
        <#--</ul>-->
        <#--</li>-->

        <#--超级管理员才能管理后台-->
        <#if session.user.id == 1>
            <li class="admin-parent">
                <a class="am-cf" data-am-collapse="{target: '#admin-collapse'}"><span class="am-icon-file"></span>
                    后台管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
                <ul class="am-list am-collapse admin-sidebar-sub am-in" id="admin-collapse">
                    <li><a href="/admin/administrator"><span class="am-icon-table"></span> 管理员</a></li>
                    <li><a href="/admin/administrator/privileges"><span class="am-icon-pencil-square-o"></span> 权限管理</a>
                    </li>
                </ul>
            </li>
        </#if>


            <li><a href="/admin/logout"><span class="am-icon-sign-out"></span> 注销</a></li>
        </ul>

    <#--<div class="am-panel am-panel-default admin-sidebar-panel">-->
    <#--<div class="am-panel-bd">-->
    <#--<p><span class="am-icon-bookmark"></span> 日期</p>-->
    <#--<p style="text-align: center">${.now?string("yyyy 年 MM 月 dd 日")}</p>-->

    <#--</div>-->
    <#--</div>-->

    </div>
</div>
<!-- sidebar end -->