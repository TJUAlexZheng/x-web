<#macro content newsContentType>
<#local newsContent = newsContentType.getNewsContent()>
<div id="news_contents" style="margin-top:15px;">${newsContent}</div>
</#macro>