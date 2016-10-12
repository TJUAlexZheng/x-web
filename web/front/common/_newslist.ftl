<#macro list newsList>
<#if newsList??>
    <#local news = newsList>
<div class="mainNewsContent">
    <#list news as newsitem>
        <div class="mainNewsLi"><a href="/news/${newsitem.id}" target="_blank"
                                   title="${newsitem.title}">
            <#if newsitem.title?length gt 17>${newsitem.title[0..17]}<#else >${newsitem.title}</#if></a>
        ${newsitem.updatetime?keep_before(" ")}
        </div>
    </#list>
</div>
</#if>

</#macro>