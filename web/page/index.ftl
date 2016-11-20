<#include "/front/common/_layout.ftl"/>
<#import "/front/common/_menu.ftl" as m/>
<#import "/front/common/_newslist.ftl" as nl/>
<#import "/front/common/_sitemenu.ftl" as hm/>
<#import "/front/common/_newsbanner.ftl" as nb/>
<@layout>

<script type="text/javascript" src="../assets/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery-ui-1.8.6.core.widget.js"></script>
<script type="text/javascript" src="../assets/js/jqueryui.bannerize.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('#banners').bannerize({
            shuffle: 0,
            interval: "5"
        });
        $(".ui-line").hover(function () {
            $(this).addClass("ui-line-hover");
            $(this).find(".ui-bnnerp").addClass("ui-bnnerp-hover");
        }, function () {
            $(this).removeClass("ui-line-hover");
            $(this).find(".ui-bnnerp").removeClass("ui-bnnerp-hover");
        });
    });
</script>

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
            <div class="language">
                <a href="http://211.81.54.98/english/" target="_blank">English</a>
            </div>

        </div>
    <#--渲染菜单头部-->
        <@m.menu menuItems=types/>
    </div>
    <div id="newsarea"><!--图片新闻开始-->
        <div class="indexadd mt50 mb60">
            <div id="banners" class="ui-banner">
                <@nb.banner banneritems=banner_news/>

            </div>
        </div>

    </div><!--图片新闻结束-->
    <div id="mainContent">
        <div class="mainLeft">
            <div class="recomm floatLeft">
                <div class="recommTitle">推荐站点</div>
                <div class="mod-menu">
                    <ul class="menu-item">
                        <li><a>实验研究</a></li>
                        <li><a>精品课程</a></li>
                        <li><a>常用下载</a></li>
                        <li><a>校内链接</a></li>
                        <li><a>校外链接</a></li>
                    </ul><!--一级菜单列表-->
                    <div class="menu-cont" style="display:none;">
                        <@hm.site siteList=recommended_site type=1/>

                        <@hm.site siteList=recommended_site type=2/>

                        <@hm.site siteList=recommended_site type=3/>

                        <@hm.site siteList=recommended_site type=4/>

                        <@hm.site siteList=recommended_site type=5/>
                    </div>
                </div>
            </div>
            <div class="newsBox floatRight">
                <div class="mainNewsTitle">通知公告<span><a href="/content/83" target="_blank" style="font-size: 1.3rem">>>more</a></span>
                </div>
                <div class="mainNewsLine">
                    <div class="mainNewsLineBlue floatLeft"></div>
                    <div class="mainNewsLineGray floatRight" style="width:220px;"></div>
                    <div class="cb"></div>
                </div>
                <@nl.list newsList = notice_news width=18.4/>
                <div class="mainNewsTitle">活动预报<span><a href="/content/86" target="_blank" style="font-size: 1.3rem">>>more</a></span>
                </div>
                <div class="mainNewsLine">
                    <div class="mainNewsLineBlue floatLeft"></div>
                    <div class="mainNewsLineGray floatRight" style="width:460px;"></div>
                    <div class="cb"></div>
                    <@nl.list newsList = predict_news width=18.4/>
                </div>
            </div>
            <div class="cb"></div>
        </div>
        <div class="mainRight">
            <div class="mainNewsTitle">新闻动态<span><a href="/content/82" target="_blank"
                                                    style="font-size: 1.3rem">>>more</a></span>
            </div>
            <div class="mainNewsLine">
                <div class="mainNewsLineBlue floatLeft"></div>
                <div class="mainNewsLineGray floatRight" style="width:460px;"></div>
                <div class="cb"></div>
                <@nl.list newsList = dynamic_news width=37/>
            </div>
        </div>
        <div class="cb"></div>
    </div>
    <div id="mainEnter">
        <div class="mainLeft">
            <a href="/content/23" target="_blank" class="floatLeft"><img src="../assets/i/2015_contact.jpg"/>
            </a>
            <a href="/mail" class="floatRight"><img src="../assets/i/2015_login.jpg"/>
            </a>

        </div>
        <div class="mainRight"><a href="/content/89" target="_blank"><img src="../assets/i/mainTip.png"/></a>
        </div>
        <div class="cb"></div>
    </div>

    <div class="middles">
        <div id="copyRight">版权所有 &copy; 天津大学材料科学与工程学院 2016新版上线</div>
        <div id="footer">联系地址：天津市海河教育园区雅观道135号31号教学楼 [<a href="http://l.map.qq.com/11222015482?m" target="_blank">查看学院地图标注</a>]，邮政编码：300350<br>联系电话：022-27403405
            传真：022-XXXXXXXX 电子邮件：mseic@tju.edu.cn
        </div>
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
<!-- 以上页面内容 开发时删除 -->
</@layout>
