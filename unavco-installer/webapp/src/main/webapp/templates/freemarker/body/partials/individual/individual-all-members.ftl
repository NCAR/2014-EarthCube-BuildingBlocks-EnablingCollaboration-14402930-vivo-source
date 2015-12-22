<#-- $This file is distributed under the terms of the license in /doc/license.txt$  -->

<#if associateMembers?has_content>
<h2 id="facultyResearchAreas" class="mainPropGroup">
        UNAVCO Associate Members}
    </h2>
    <ul id="individual-hasResearchArea" role="list">
        <#list associateMembers as resultRow>
<li class="amLink">
<a class="amLink" href="${urls.base}/display/${resultRow["uri"]}" title="associate member">
                    ${resultRow["amLabel"]}
</a> </li>
        </#list>
    </ul>
</#if>
