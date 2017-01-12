<#include "/front/common/_layout.ftl"/>
<#import "/front/common/_menu.ftl" as m/>
<#import "/front/common/_treemenu.ftl" as tm/>
<#import "/front/common/_detail.ftl" as d/>
<#import "/front/common/_blogdetail.ftl" as bd/>
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
            <div class="language"><a href="http://mse.tju.edu.cn/english/" target="_blank">English</a></div>
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
    <div id="sub_left">
        <@tm.type headType = headType/>
    </div>
    <div id="sub_right">
        <div id="news_position">现在位置 : <span class="news_index"><a href="/">首页</a></span>
            &gt;&gt; ${contentType.name} &gt;&gt; 正文
        </div>
        <!--<div id="news_titles">学院简介</div-->
        <#if contentType.type == 1>
            <#if !blog?has_content>
                <p>暂无内容</p>
            <#else >
                <@bd.blog blog=blog/>
            </#if>
        <#elseif contentType.type == 3>
            <#if !page?has_content>
                <p>暂无内容</p>
            <#else >
                <@d.detail detail=page action="content/${contentType.id}?"/>
            </#if>
        </#if>
    </div>
    <div style="clear:both;"></div>
</div>
<div class="middles">
    <div id="copyRight">版权所有 © 天津大学材料科学与工程学院 2016新版上线<span></span></div>
    <div id="footer">联系地址：天津市海河教育园区雅观道135号31号教学楼 [<a href="http://l.map.qq.com/11222015482?m"
                                                     target="_blank">查看学院地图标注</a>]，邮政编码：300350<br>联系电话：022-85356663
        传真：022-XXXXXXXX 电子邮件：dean_smse@tju.edu.cn
    </div>
</div>
</@layout>