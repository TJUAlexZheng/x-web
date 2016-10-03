<#include "/front/common/_layout.ftl"/>
<#import "/front/common/_menu.ftl" as m/>
<@layout>

<script type="text/javascript" src="../assets/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="../assets/js/jquery-ui-1.8.6.core.widget.js"></script>
<script type="text/javascript" src="../assets/js/jqueryui.bannerize.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('#banners').bannerize({
            shuffle: 0,
            interval: "5"
        });
        $(".ui-line").hover(function(){
            $(this).addClass("ui-line-hover");
            $(this).find(".ui-bnnerp").addClass("ui-bnnerp-hover");
        },function(){
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
            <div class="language"><a href="english/index.html" target="_blank">English</a></div>
        </div>
    <#--渲染菜单头部-->
        <@m.menu menuItems=types/>
    </div>
    <div id="newsarea"><!--图片新闻开始-->
        <div class="indexadd mt50 mb60">
            <div id="banners" class="ui-banner">
                <ul class="ui-banner-slides">
                    <li><a href="news_detail.php-id=342.html" target="_blank"><img
                            src="upload/photo/1473048783E7AoaH.JPG" alt="材料学院优秀校友座谈会成功举办" title="材料学院优秀校友座谈会成功举办"/></a>
                    </li>
                    <li><a href="news_detail.php-id=338.html" target="_blank"><img
                            src="upload/photo/1472519138xmuMDy.JPG" alt="材料学院2016级新生开学典礼隆重举行"
                            title="材料学院2016级新生开学典礼隆重举行"/></a></li>
                    <li><a href="news_detail.php-id=328.html" target="_blank"><img
                            src="upload/photo/1469753584Ux7gkF.JPG" alt="材料学院2017年研究生招生夏令营开营"
                            title="材料学院2017年研究生招生夏令营开营"/></a></li>
                    <li><a href="news_detail.php-id=311.html" target="_blank"><img
                            src="upload/photo/1467595466hw3Wd2.JPG" alt="材料学院召开纪念建党95周年“七一”表彰大会"
                            title="材料学院召开纪念建党95周年“七一”表彰大会"/></a></li>
                    <li><a href="news_detail.php-id=304.html" target="_blank"><img
                            src="upload/photo/1467595516myO0wK.JPG" alt="材料学院师昌绪塑像落成仪式" title="材料学院师昌绪塑像落成仪式"/></a></li>
                </ul><!--ui-banner-slides end-->
                <ul class="ui-banner-slogans">
                    <li class="ui-line">
                        <div class="ullinehover">
                            <div class="ui-bnnerimg floatLeft">
                                <img src="upload/photo/small/1473048783E7AoaH.JPG" alt="" width="103"/>
                            </div>
                            <div class="ui-bnnerp floatRight">
                                <h3 style="margin-top: 10px;">材料学院优秀校友座谈会成功举办</h3>
                                <p>　　为进一步突出各行各业优秀校友的联动作用，搭建优秀校友与在校学生沟通交流平台。9月3日下午2点，天津大学...</p>
                            </div>
                        </div>
                    </li>
                    <li class="ui-line">
                        <div class="ullinehover">
                            <div class="ui-bnnerimg floatLeft">
                                <img src="upload/photo/small/1472519138xmuMDy.JPG" alt="" width="103"/>
                            </div>
                            <div class="ui-bnnerp floatRight">
                                <h3 style="margin-top: 10px;">材料学院2016级新生开学典礼隆重举行</h3>
                                <p>　　8月29日上午，天津大学材料学院2016级新生开学典礼在新校区大通学生活动中心隆重举行。院长胡文彬、院党委...</p>
                            </div>
                        </div>
                    </li>
                    <li class="ui-line">
                        <div class="ullinehover">
                            <div class="ui-bnnerimg floatLeft">
                                <img src="upload/photo/small/1469753584Ux7gkF.JPG" alt="" width="103"/>
                            </div>
                            <div class="ui-bnnerp floatRight">
                                <h3 style="margin-top: 10px;">材料学院2017年研究生招生夏令营开营</h3>
                                <p>

                                    7月9日上午，天津大学材料科学与工程学院2017年研究生招生夏令营开营仪式在31楼2105报告厅举行。此次夏令营活...</p>
                            </div>
                        </div>
                    </li>
                    <li class="ui-line">
                        <div class="ullinehover">
                            <div class="ui-bnnerimg floatLeft">
                                <img src="upload/photo/small/1467595466hw3Wd2.JPG" alt="" width="103"/>
                            </div>
                            <div class="ui-bnnerp floatRight">
                                <h3 style="margin-top: 10px;">材料学院召开纪念建党95周年“七一”表彰大会</h3>
                                <p>

                                    为庆祝建党95周年，深入推进&ldquo;两学一做&rdquo;学习教育，表彰2015&mdash;2016年度为学院改革、发展和稳...</p>
                            </div>
                        </div>
                    </li>
                    <li class="ui-line">
                        <div class="ullinehover">
                            <div class="ui-bnnerimg floatLeft">
                                <img src="upload/photo/small/1467595516myO0wK.JPG" alt="" width="103"/>
                            </div>
                            <div class="ui-bnnerp floatRight">
                                <h3 style="margin-top: 10px;">材料学院师昌绪塑像落成仪式</h3>
                                <p>

                                    2016年5月27日下午，天津大学材料学院师昌绪塑像落成仪式暨师昌绪荣誉学位计划座谈会在天津大学北洋园校区31...</p>
                            </div>
                        </div>
                    </li>
                </ul><!--ui-banner-slogans end-->
            </div>
        </div>

    </div><!--图片新闻结束-->
    <div id="mainContent">
        <div class="mainLeft">
            <div class="recomm floatLeft">
                <div class="recommTitle">推荐站点</div>
                <div class="mod-menu">
                    <ul class="menu-item">
                        <li><a href="index.php.html#">实验研究</a></li>
                        <li><a href="index.php.html#">校内链接</a></li>
                        <li><a href="index.php.html#">友情链接</a></li>
                        <li><a href="index.php.html#">常用下载</a></li>
                        <li><a href="index.php.html#">院长信箱</a></li>
                    </ul><!--一级菜单列表-->
                    <div class="menu-cont" style="display:none;">
                        <div class="menu-cont-list" style="display:none;">
                            <ul>
                                <li><a href="tnjrc/index.html" target="_blank">TU-NIMS联合研究中心</a></li>
                                <li><a href="bgm/index.htm" target="_blank">非晶合金研究中心</a></li>
                                <li><a href="ajt/index.html" target="_blank">现代连接技术重点实验室</a></li>
                                <li><a href="taoci/index.html" target="_blank">先进陶瓷与加工技术教育部重点实验室</a></li>
                                <li><a href="cfm/index.html" target="_blank">材料复合与功能化重点实验室</a></li>
                            </ul>
                        </div>

                        <div class="menu-cont-list" style="display:none;">
                            <ul>
                                <li><a href="http://219.243.39.24/wctju3/index1.aspx" target="_blank">天津大学财务信息网</a></li>
                                <li><a href="http://kj.tju.edu.cn" target="_blank">天津大学科技网</a></li>
                            </ul>
                        </div>
                        <div class="menu-cont-list" style="display:none;">
                            <ul>
                                <li><a href="http://www.nsfc.gov.cn/" target="_blank">国家自然科学基金委</a></li>
                                <li><a href="http://www.tstc.gov.cn/" target="_blank">天津市科委</a></li>
                                <li><a href="http://www.scholarmate.com/scmwebsns/" target="_blank">科研之友</a></li>
                                <li><a href="http:///www.meeting.edu.cn/" target="_blank">中国学术会议在线</a></li>
                            </ul>
                        </div>
                        <div class="menu-cont-list" style="display: none;">
                            <ul>
                                <li><a href="content.php-block=e7.html" target="_blank">本科生教学</a></li>
                                <li><a href="news_list.php-type=f14.html" target="_blank">研究生教学</a></li>
                            </ul>
                        </div>
                        <div class="menu-cont-list" style="display:none;">
                            <ul>
                                <li><a href="index.php.html#%23" target="_blank">院长信箱Email地址</a></li>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
            <div class="newsBox floatRight">
                <div class="mainNewsTitle">通知公告<span>/<a href="news_list.php-type=notice.html" target="_blank">查看更多</a></span>
                </div>
                <div class="mainNewsLine">
                    <div class="mainNewsLineBlue floatLeft"></div>
                    <div class="mainNewsLineGray floatRight" style="width:220px;"></div>
                    <div class="cb"></div>
                </div>
                <div class="mainNewsContent">
                    <div class="mainNewsLi"><a href="news_detail.php-id=340.html" target="_blank"
                                               title="材料学院 2017年接收外校推免研究生的说明">材料学院 2017年接收外校推免研究</a>2016-08-31
                    </div>
                    <div class="mainNewsLi"><a href="news_detail.php-id=303.html" target="_blank"
                                               title="天津大学材料学院2016年本科生招生简章">天津大学材料学院2016年本科生招</a>2016-06-01
                    </div>
                    <div class="mainNewsLi"><a href="news_detail.php-id=302.html" target="_blank"
                                               title="天津大学材料学院2017年研究生招生夏令营通知">天津大学材料学院2017年研究生招</a>2016-05-23
                    </div>
                    <div class="mainNewsLi"><a href="news_detail.php-id=285.html" target="_blank"
                                               title="天津大学材料学院应届毕业生问卷调查">天津大学材料学院应届毕业生问卷</a>2016-05-10
                    </div>
                    <div class="mainNewsLi"><a href="news_detail.php-id=274.html" target="_blank"
                                               title="2016级硕士研究生档案邮寄地址">2016级硕士研究生档案邮寄地址</a>2016-04-18
                    </div>
                    <div class="mainNewsLi"><a href="news_detail.php-id=269.html" target="_blank"
                                               title="2016年研究生招生递补公示">2016年研究生招生递补公示</a>2016-03-29
                    </div>
                    <div class="mainNewsLi"><a href="news_detail.php-id=268.html" target="_blank"
                                               title="材料学院2016年博士研究生拟录取名单">材料学院2016年博士研究生拟录取</a>2016-03-25
                    </div>
                </div>
            </div>
            <div class="cb"></div>
        </div>
        <div class="mainRight">
            <div class="mainNewsTitle">新闻动态<span>/<a href="news_list.php-type=news.html" target="_blank">查看更多</a></span>
            </div>
            <div class="mainNewsLine">
                <div class="mainNewsLineBlue floatLeft"></div>
                <div class="mainNewsLineGray floatRight" style="width:460px;"></div>
                <div class="cb"></div>
            </div>
            <div class="mainNewsContent">
                <div class="mainNewsLi"><a href="news_detail.php-id=342.html" target="_blank" title="材料学院优秀校友座谈会成功举办">材料学院优秀校友座谈会成功举办</a>2016-09-05
                </div>
                <div class="mainNewsLi"><a href="news_detail.php-id=341.html" target="_blank" title="材料学院举办资助工作专题讲座">材料学院举办资助工作专题讲座</a>2016-09-01
                </div>
                <div class="mainNewsLi"><a href="news_detail.php-id=339.html" target="_blank"
                                           title="材料学院开展2016级研究生入学学则教育">材料学院开展2016级研究生入学学则教育</a>2016-08-30
                </div>
                <div class="mainNewsLi"><a href="news_detail.php-id=338.html" target="_blank"
                                           title="材料学院2016级新生开学典礼隆重举行">材料学院2016级新生开学典礼隆重举行</a>2016-08-30
                </div>
                <div class="mainNewsLi"><a href="news_detail.php-id=337.html" target="_blank"
                                           title="材料学院召开2016级本科生“师昌绪荣誉学位计划”宣讲会">材料学院召开2016级本科生“师昌绪荣誉学位计划”宣讲会</a>2016-08-30
                </div>
                <div class="mainNewsLi"><a href="news_detail.php-id=336.html" target="_blank"
                                           title="迎在起点，助力启航――材料学院2016级迎新工作顺利完成">迎在起点，助力启航――材料学院2016级迎新工作顺利完成</a>2016-08-26
                </div>
                <div class="mainNewsLi"><a href="news_detail.php-id=335.html" target="_blank"
                                           title="华为销服体系交流会在材料学院成功举办">华为销服体系交流会在材料学院成功举办</a>2016-08-26
                </div>
            </div>
        </div>
        <div class="cb"></div>
    </div>
    <div id="mainEnter">
        <div class="mainLeft"><a href="content.php-block=a11.html" target="_blank" class="floatLeft"><img
                src="../assets/i/2015_contact.jpg"/></a><a href="index.php.html#%23%23"
                                                      onClick="javascript:alert('院长信箱：dean_smse@tju.edu.cn');"
                                                      class="floatRight"><img src="../assets/i/2015_login.jpg"/></a></div>
        <div class="mainRight"><a href="vote/index.php.html" target="_blank"><img src="../assets/i/mainTip.jpg"/></a></div>
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