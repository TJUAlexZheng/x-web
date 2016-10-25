<#include "/front/common/_layout.ftl"/>
<#import "/front/common/_menu.ftl" as m/>
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
            <div class="language"><a href="english/index.html" target="_blank">English</a></div>
        </div>
    <#--渲染菜单头部-->
        <@m.menu menuItems = types/>
    </div>

</div>

<div class="middles" style="margin-top:18px;">
    <div id="sub_left">
        <div id="sub_left_title" style="margin-bottom:5px;">师资队伍&gt;&gt;</div>
        <div class="sub_left_list">
            <a href="/content/24">师资概况</a>
        </div>
        <div class="sub_left_list gray">
            <a href="/teacher/25">教师简介</a>
        </div>
        <div class="sub_left_list">
            <a href="/teacher/29">杰出人才</a>
        </div>
    </div>
    <div id="sub_right">
        <div id="news_position">现在位置：<span class="news_index"><a href="/">首页</a></span>
            &gt;&gt; 简介&gt;&gt; ${teacher.name}
        </div>


        <div class="am-g" style="border-bottom:1px #c7d2eb dotted;margin-top: 22px">
            <div class="am-u-sm-5">
                <img class="am-img-thumbnail" src="http://s.amazeui.org/media/i/demos/bing-1.jpg" alt=""/>
            </div>
            <div class="am-u-sm-7">
                <p>${teacher.name}<#switch teacher.job_title>
                    <#case 1>讲师<#break>
                        <#case 2>副教授<#break>
                        <#case 3>教授<#break>
                    </#switch>    <#switch teacher.mentor_type>
                        <#case 1>硕士生导师<#break>
                        <#case 2>博士生导师<#break>
                    </#switch></p>
                <p>${teacher.department}</p>
                <p>电话： ${teacher.phone}</p>
                <p>email：  ${teacher.email}</p>
                <p>研究所： ${teacher.laboratory()}</p>
            </div>
        </div>

        <div style="border-bottom:1px #c7d2eb dotted">
            <h2>个人简历</h2>
            <div>${teacher.introduction}</div>
        </div>

        <div style="border-bottom:1px #c7d2eb dotted">
            <h2>研究方向</h2>
            <div>${teacher.direction}</div>
        </div>

        <div style="border-bottom:1px #c7d2eb dotted">
            <h2>承担项目</h2>
            <div>${teacher.project}</div>
        </div>

        <div style="border-bottom:1px #c7d2eb dotted">
            <h2>标志性成果</h2>
            <div>${teacher.achievement}</div>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>
<div class="middles">
    <div id="copyRight">版权所有 © 天津大学材料科学与工程学院 2016新版上线<span></span></div>
    <div id="footer">联系地址：天津市海河教育园区雅观道135号31号教学楼 [<a href="http://l.map.qq.com/11222015482?m"
                                                     target="_blank">查看学院地图标注</a>]，邮政编码：300350<br>联系电话：022-27403405
        传真：022-XXXXXXXX 电子邮件：mseic@tju.edu.cn
    </div>
</div>
</@layout>