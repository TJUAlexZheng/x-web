<#macro menu menuItems>

<nav>
    <ul>
        <#list menuItems as item>
            <li>
                <a href="/<#if item.id != 1>content/${item.id}</#if>">${item.name}</a>
                <#local subMenuItems = item.getSubContentTypes()>
                <#if 0 < subMenuItems.size()>
                    <ul>
                        <#list subMenuItems as subItem>
                            <li><a href="/content/${subItem.id}">${subItem.name}</a></li>
                        </#list>
                    </ul>
                </#if>
            </li>
        </#list>
    </ul>
</nav>
</#macro>