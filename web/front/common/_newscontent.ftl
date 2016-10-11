<#macro content blogContentType>
<#local blogContent = blogContentType.getBlogContent>
<div id="news_contents" style="margin-top:15px;">${blogContent.content}</div>
</#macro>