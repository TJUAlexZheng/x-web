<#include "/front/common/_layout.ftl"/>
<#import "/front/common/_menu.ftl" as m/>
<#import "/front/common/_detail.ftl" as d/>
<@layout>
<link href="/assets/css/2015_default2.css" rel="stylesheet" type="text/css" media="all">
<!--推荐站点--需JQquery文件-->
<script type="text/javascript">
    $(document).ready(function () {
        var mod_menu = $(".mod-menu");//导航模块区
        var menu = function () {
            var menuItem = $(".menu-item li");//选择导航列表
            menuItem.each(function () {
                var _index = $(this).index();//获取当前选择菜单列表的索引
                $(this).mouseenter(function () {
                    var y = $(this).position().top + 1;//获取当前鼠标滑过的列表的顶部坐标
                    $(".menu-cont").show();
                    $(".menu-cont").css("top", y);//需要显示的对应索引内容
                    $(this).addClass("mouse-bg").siblings().removeClass("mouse-bg");
                    $(".menu-cont>div").eq(_index).show().siblings().hide();
                });
            });
            /*导航菜单菜单*/
            $(".mod-menu").mouseleave(function () {
                $(".menu-cont").hide();
                menuItem.removeClass("mouse-bg");
            })
        }//展开二级菜单
        menu();//执行展开二级菜单函
    });
</script>

<div class="wrap">
    <div class="middles">
        <div id="banner">
            <form action="/news/search" method="get" style="float: right;position: relative;top: 0px;">
                <input type="text" name="searchvalue" class="form-control-inline" placeholder="请输入查询内容">
            </form>
            <div class="language" style="float: right">
                <a href="http://mse.tju.edu.cn/english/" target="_blank">English</a>
            </div>

        </div>
    <#--渲染菜单头部-->
        <@m.menu menuItems = types/>
    </div>

</div>

<script>
    $('nav li').hover(
            function () {
                $('ul', this).stop().slideDown(200);
            },
            function () {
                $('ul', this).stop().slideUp(200);
            }
    );
</script>

<div class="middles" style="margin-top:18px;">
    <div id="sub_right" style="width: 100%">
        <div id="news_position">现在位置：<span class="news_index"><a href="/">首页</a></span> &gt;&gt; 搜索结果</div>
        <!--<div id="news_titles">学院简介</div-->

        <#assign detail = page>
        <#assign action = "news/search?searchvalue=${sv}&">
        <div id="news_contents" style="width: 93%">
            <#list detail.list as item>
                <li>
                    <a href="/news/${item.id}">
                        <#if item.top == 1><span style="color: red">${item.title}<#else >${item.title}</span></#if>
                    </a>
                    <span style="float: right">${item.createtime}</span>
                </li>
            </#list>
        </div>
        <#if detail.totalPage gt 0>
            <div class="manu">共 <b>${detail.totalRow}</b> 条,&nbsp;&nbsp;<b>${detail.pageNumber}</b> 页&nbsp;
                <#if detail.pageNumber != 1>
                    <a href="/${action}page=1" title="首页">«</a>
                    <a href="/${action}page=${detail.pageNumber - 1}" title="上一页">上一页</a>
                </#if>

                <#list 1..detail.totalPage as page>
                    <#if page == detail.pageNumber>
                        <a class="current">${page}</a>
                    <#else >
                        <a href="/${action}page=${page}">${page}</a>
                    </#if>
                </#list>
                <#if detail.pageNumber != 1>

                </#if>
                <#if detail.pageNumber != detail.totalPage>
                    <a href="/${action}page=${detail.pageNumber + 1}" title="下一页">下一页</a>
                    <a href="/${action}page=${detail.totalPage}" title="最后一页">»</a>
                </#if>

            </div>
        <#else >
            <div id="news_contents">
                <h2>没有可显示的内容</h2>
            </div>
        </#if>

    </div>
    <div style="clear:both;"></div>
</div>
<div class="middles">
    <div id="copyRight">版权所有 © 天津大学材料科学与工程学院 2016新版上线<span></span></div>
    <div id="footer">联系地址：天津市海河教育园区雅观道135号31号教学楼 [<a href="http://l.map.qq.com/11222015482?m" target="_blank">查看学院地图标注</a>]，邮政编码：300350<br>联系电话：022-85356661</div>
</div>
</@layout>