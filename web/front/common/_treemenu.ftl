<#macro type headType>
<div id="sub_left_title" style="margin-bottom:5px;">${headType.name}&gt;&gt;</div>
    <#local subMenuItems = headType.subContentTypes()>
    <#local index = 0>
    <#if 0 < subMenuItems.size()>
        <#list subMenuItems as subItem>
        <div class="sub_left_list<#if 1 == index%2> gray</#if>">
            <#if subItem.href??>
                <a href="/${subItem.href}/${subItem.id}">${subItem.name}</a>
            <#else>
                <a href="/content/${subItem.id}">${subItem.name}</a>
            </#if>
        </div>
            <#local index = index+1>
            <#if subItem.id != 14>
                <#local subMenuItems2 = subItem.subContentTypes()>
                <#if 0 < subMenuItems2.size()>
                    <#list subMenuItems2 as subItem2>
                    <div class="sub_left_list<#if 1 == index%2> gray</#if>">
                        <img src="/assets/i/<#if subItem2_has_next>tree1.gif<#else >tree2.gif</#if>" border="0">
                        <a href="/content/${subItem2.id}">${subItem2.name}</a>
                    </div>
                        <#local index = index+1>
                    </#list>
                </#if>
            </#if>
        </#list>
    </#if>
</#macro>