<#macro banner banneritems>
<ul class="ui-banner-slides">
    <#list banneritems as bannerItem>
        <li><a href="/news/${bannerItem.id}" target="_blank"><img src="/upload/${bannerItem.img}"
                                                                  alt="${bannerItem.title}" title="${bannerItem.title}"></a>
        </li>
    </#list>
</ul>
<ul class="ui-banner-slogans">
    <#list banneritems as bannerItem>
        <li class="ui-line">
            <div class="ullinehover">
                <div class="ui-bnnerimg floatLeft">
                    <img src="/upload/${bannerItem.img}" alt="" width="103"/>
                </div>
                <div class="ui-bnnerp floatRight">
                    <h3 style="margin-top: 10px;">${bannerItem.title}</h3>
                    <p>${bannerItem.content}</p>
                </div>
            </div>
        </li>
    </#list>
</ul><!--ui-banner-slogans end-->

</#macro>