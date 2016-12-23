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
            <div class="language"><a href="http://211.81.54.98/english/" target="_blank">English</a></div>
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
            <div class="am-u-sm-5" style="text-align: center">
                <img class="am-img-thumbnail" src="${photo}" style="max-width: 12rem;"/>
            </div>
            <div class="am-u-sm-7">
            <p>${teacher.name}
                <#if teacher.id == 175>
                </p><p>院党委副书记</p>
                <#elseif  teacher.id == 176>
                    </p><p>院党委书记</p>
                <#else >
                    <#switch teacher.job_title>
                        <#case 1>讲师<#break>
                        <#case 2>副教授<#break>
                        <#case 3>教授<#break>
                    </#switch>
                </#if>
                </p>

                <#if teacher.id == 175 >
                    <p>主管工作：学生思想政治教育、工会工作</p>
                <#elseif teacher.id == 176>
                    <p>主管工作：负责学院党委工作</p>
                <#elseif teacher.id == 93>
                    <p>主管工作：本科教学工作、学院大型仪器测试平台、教学平台工作</p>
                <#elseif teacher.id == 151>
                    <p>主管工作：纵向科研和军工项目</p>
                <#elseif teacher.id == 62>
                    <p>主管工作：研究生教学、横向科研、新校区工程中心建设</p>
                <#elseif teacher.id == 127>
                    <p>主管工作：行政工作,人事安全、财务工作等</p>
                <#elseif teacher.id == 137>
                    <p>主管工作：负责统筹学院整体工作</p>
                <#else>
                    <p>${teacher.department!'暂无'}</p>
                </#if>
                <p>电话： ${teacher.phone!'暂无'}</p>
                <p>Email：  ${teacher.email!'暂无'}</p>
                <#if teacher.id == 175>
                    办公地点: 材料学院 31-345(北洋园)
                <#elseif  teacher.id == 176>
                    办公地点: 材料学院 31-348(北洋园)
                <#else >
                    <p>研究所： ${teacher.laboratory()!'暂无'}</p>
                </#if>
            </div>
        </div>

        <#if (teacher.introduction)?has_content>
            <div style="border-bottom:1px #c7d2eb dotted">
                <h2>个人简历</h2>
                <div>${teacher.introduction!'暂无'}</div>
            </div>
        </#if>

        <#if (teacher.direction)?has_content>
            <div style="border-bottom:1px #c7d2eb dotted">
                <h2>研究方向</h2>
                <div>${teacher.direction!'暂无'}</div>
            </div>
        </#if>

        <#if (teacher.project)?has_content>
            <div style="border-bottom:1px #c7d2eb dotted">
                <h2>承担项目</h2>
                <div>${teacher.project!'暂无'}</div>
            </div>
        </#if>

        <#if (teacher.achievement)?has_content>
            <div style="border-bottom:1px #c7d2eb dotted">
                <h2>标志性成果</h2>
                <div>${teacher.achievement!'暂无'}</div>
            </div>
        </#if>

        <#if (teacher.attachment)?has_content>
            <div style="border-bottom:1px #c7d2eb dotted">
                <h2>上传资料</h2>
                <div>${teacher.attachment!'暂无'}</div>
            </div>
        </#if>

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