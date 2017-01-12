<#macro banner banneritems>
<style>
    ul.ui-banner-slogans li:hover {
        cursor: pointer;
    }
</style>
<ul class="ui-banner-slides">
    <#list banneritems as bannerItem>
        <li><a href="/news/${bannerItem.id}" target="_blank">
            <#if bannerItem.img??>
                <img src="/upload/${bannerItem.img}" alt="${bannerItem.title}" title="${bannerItem.title}">
            </#if>
            </a>
        </li>
    </#list>
</ul>
<ul class="ui-banner-slogans">
    <#list banneritems as bannerItem>
        <li class="ui-line" onclick="window.location.href='/news/${bannerItem.id}'">
            <div class="ullinehover">
                <div class="ui-bnnerimg floatLeft">
                    <#if bannerItem.img??>
                        <img src="/upload/${bannerItem.img}" alt="" width="103"/>
                    </#if>
                </div>
                <div class="ui-bnnerp floatRight">
                    <p>${bannerItem.overview}</p>
                </div>
            </div>
        </li>
    </#list>
</ul><!--ui-banner-slogans end-->

</#macro>