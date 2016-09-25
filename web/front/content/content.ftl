<#include "/common/_layout.ftl"/>
<#import "/common/_menu.ftl" as m/>
<#import "/common/_treemenu.ftl" as tm/>
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

<script>
    $('nav li').hover(
            function () {3
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
        <div id="news_position">现在位置：<span class="news_index"><a href="/">首页</a></span> &gt;&gt; ${contentType.name} &gt;&gt; 正文        </div>
        <!--<div id="news_titles">学院简介</div-->
        <div id="news_contents" style="margin-top:15px;">&nbsp; &nbsp;天津大学材料科学与工程学院是我国成立最早、学科方向最为齐全的材料类院系之一。学院所属“材料科学与工程”一级学科为国家重点学科，设有材料科学与工程一级学科博士点和博士后流动站。学院下设金属材料系、高分子材料系、无机非金属材料系、材料加工系四个教学单位，以及先进金属材料研究所、先进高分子材料研究所、先进陶瓷研究所、焊接与先进制造技术研究所、新能源材料研究所、天津大学-日本国立物质材料研究所（NIMS）联合研究中心六个科研单位。<br>
            &nbsp;&nbsp;&nbsp;&nbsp; 学院师资力量雄厚，现有专任教师109人，其中教授54人，副教授35人。教师中有国家级“千人计划”入选者3人，国家“外专千人”1人、国家“青年千人”2人、长江学者”讲座教授1人、国家杰出青年科学基金获得者（A类）7人、国家优秀青年科学基金获得者1人，国家教学名师1人，天津市“千人计划”入选者6人、“青年千人”6人、教育部新世纪优秀人才入选者15人，天津市教学名师3人，天津大学北洋学者32人。在站博士后15人，专职科研队伍12人。<br>
            &nbsp;&nbsp;&nbsp;学院教风学风严谨，现有全日制在校本科生1000余名，博士、硕士研究生700余名。设有“国家卓越工程师教育培养计划”专业“材料科学与工程”、“材料成型及控制工程”以及“国家战略新兴产业”专业“功能材料”三个本科专业，实施“师昌绪荣誉学位计划”等高层次人才培养举措。学院建有材料科学与工程“国家级实验教学示范中心”。近年来，获得国家级教学成果奖1项，国家精品课程4门，国家精品资源共享课程3门。学生一次就业率已经连续多年超过99%，本科毕业读研和出国深造的比例近60%。<br>
            &nbsp; &nbsp;学院科研环境优越，拥有先进陶瓷与加工技术教育部重点实验室、教育部材料复合与功能化工程研究中心，天津市材料复合与功能化重点实验室、天津市现代连接技术重点实验室等省部级重点科研基地。近5年，学院承担了一批国家级科研项目，其中包括国家973基础研究计划首席科学家项目1项，973项目课题7 项，863计划项目与课题 10 项，国家自然科学基金项目 120余项，发表SCI论文800余篇，获得省部级科技奖励 8项，其中一等奖5项。<br>
            &nbsp; &nbsp;学院对外交流活跃，分别与日本国立物质材料研究机构（NIMS）、美国弗吉尼亚理工大学成立了联合研究机构，与美国、英国、澳大利亚、日本等多个国家以及港澳台地区的高校开展密切的教学科研合作和师生交流互访。<br>
            <br>
        </div>
    </div>
    <div style="clear:both;"></div>
</div>
<!-- 以上页面内容 开发时删除 -->
</@layout>