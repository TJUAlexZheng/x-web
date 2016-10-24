<#include "/front/common/_layout.ftl"/>
<#import "/front/common/_menu.ftl" as m/>
<#import "/front/common/_treemenu.ftl" as tm/>
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
        <div id="news_position">现在位置：<span class="news_index"><a href="/">首页</a></span> &gt;&gt; ${contentType.name}
            &gt;&gt; 正文
        </div>

    <#--<link rel="stylesheet" type="text/css" href="/assets/css/default.css" />-->

        <link rel="stylesheet" type="text/css" href="/assets/css/component.css"/>
        <script src="/assets/js/modernizr.custom.js"></script>
        <div class="container">
            <div class="main">
                <ul class="cbp_tmtimeline">

                    <li>

                        <time class="cbp_tmtime" datetime="2013-04-10 18:30"><span>1952</span></time>

                        <div class="cbp_tmicon cbp_tmicon-phone"></div>

                        <div class="cbp_tmlabel">
                            <h2>天津大学贵烟酸工学专业建立</h2>

                            <p>天津大学贵烟酸工学专业建立</p>

                        </div>

                    </li>

                    <li>

                        <time class="cbp_tmtime" datetime="2013-04-11T12:04"><span>1956</span></time>

                        <div class="cbp_tmicon cbp_tmicon-screen"></div>

                        <div class="cbp_tmlabel">

                            <h2>Greens radish arugula</h2>

                            <p>Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach
                                kombu courgette lettuce. Celery coriander bitterleaf epazote radicchio shallot winter
                                purslane collard greens spring onion squash lentil. Artichoke salad bamboo shoot
                                black-eyed pea brussels sprout garlic kohlrabi.</p>

                        </div>

                    </li>

                    <li>

                        <time class="cbp_tmtime" datetime="2013-04-13 05:36"><span>1958</span></time>

                        <div class="cbp_tmicon cbp_tmicon-mail"></div>

                        <div class="cbp_tmlabel">

                            <h2>Sprout garlic kohlrabi</h2>

                            <p>Parsnip lotus root celery yarrow seakale tomato collard greens tigernut epazote ricebean
                                melon tomatillo soybean chicory broccoli beet greens peanut salad. Lotus root burdock
                                bell pepper chickweed shallot groundnut pea sprouts welsh onion wattle seed pea salsify
                                turnip scallion peanut arugula bamboo shoot onion swiss chard. Avocado tomato peanut
                                soko amaranth grape fennel chickweed mung bean soybean endive squash beet greens carrot
                                chicory green bean. Tigernut dandelion sea lettuce garlic daikon courgette celery maize
                                parsley komatsuna black-eyed pea bell pepper aubergine cauliflower zucchini. Quandong
                                pea chickweed tomatillo quandong cauliflower spinach water spinach.</p>

                        </div>

                    </li>

                    <li>

                        <time class="cbp_tmtime" datetime="2013-04-15 13:15"><span>4/15/13</span> <span>13:15</span>
                        </time>

                        <div class="cbp_tmicon cbp_tmicon-phone"></div>

                        <div class="cbp_tmlabel">

                            <h2>Watercress ricebean</h2>

                            <p>Peanut gourd nori welsh onion rock melon mustard jícama. Desert raisin amaranth kombu
                                aubergine kale seakale brussels sprout pea. Black-eyed pea celtuce bamboo shoot salad
                                kohlrabi leek squash prairie turnip catsear rock melon chard taro broccoli turnip
                                greens. Fennel quandong potato watercress ricebean swiss chard garbanzo. Endive daikon
                                brussels sprout lotus root silver beet epazote melon shallot.</p>

                        </div>

                    </li>

                    <li>

                        <time class="cbp_tmtime" datetime="2013-04-16 21:30"><span>4/16/13</span> <span>21:30</span>
                        </time>

                        <div class="cbp_tmicon cbp_tmicon-earth"></div>

                        <div class="cbp_tmlabel">

                            <h2>Courgette daikon</h2>

                            <p>Parsley amaranth tigernut silver beet maize fennel spinach. Ricebean black-eyed pea maize
                                scallion green bean spinach cabbage jícama bell pepper carrot onion corn plantain
                                garbanzo. Sierra leone bologi komatsuna celery peanut swiss chard silver beet squash
                                dandelion maize chicory burdock tatsoi dulse radish wakame beetroot.</p>

                        </div>

                    </li>

                    <li>

                        <time class="cbp_tmtime" datetime="2013-04-17 12:11"><span>4/17/13</span> <span>12:11</span>
                        </time>

                        <div class="cbp_tmicon cbp_tmicon-screen"></div>

                        <div class="cbp_tmlabel">

                            <h2>Greens radish arugula</h2>

                            <p>Caulie dandelion maize lentil collard greens radish arugula sweet pepper water spinach
                                kombu courgette lettuce. Celery coriander bitterleaf epazote radicchio shallot winter
                                purslane collard greens spring onion squash lentil. Artichoke salad bamboo shoot
                                black-eyed pea brussels sprout garlic kohlrabi.</p>

                        </div>

                    </li>

                    <li>

                        <time class="cbp_tmtime" datetime="2013-04-18 09:56"><span>4/18/13</span> <span>09:56</span>
                        </time>

                        <div class="cbp_tmicon cbp_tmicon-phone"></div>

                        <div class="cbp_tmlabel">

                            <h2>Sprout garlic kohlrabi</h2>

                            <p>Parsnip lotus root celery yarrow seakale tomato collard greens tigernut epazote ricebean
                                melon tomatillo soybean chicory broccoli beet greens peanut salad. Lotus root burdock
                                bell pepper chickweed shallot groundnut pea sprouts welsh onion wattle seed pea salsify
                                turnip scallion peanut arugula bamboo shoot onion swiss chard. Avocado tomato peanut
                                soko amaranth grape fennel chickweed mung bean soybean endive squash beet greens carrot
                                chicory green bean. Tigernut dandelion sea lettuce garlic daikon courgette celery maize
                                parsley komatsuna black-eyed pea bell pepper aubergine cauliflower zucchini. Quandong
                                pea chickweed tomatillo quandong cauliflower spinach water spinach.</p>

                        </div>

                    </li>

                </ul>

            </div>

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