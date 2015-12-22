<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- List of expertise for the individual -->
<#assign expertise = propertyGroups.pullProperty("http://connect.unavco.org/ontology/vlocal#hasExpertise")!> 
<#if expertiseDG?has_content>
    <h2 id="expertise" class="mainPropGroup" style="clear:left" title>
        Expertise
        <img id="expertiseIcon" src="${urls.images}/individual/research-group-icon.png" alt="Click an area to see others with the same expertise" />
    </h2>
    <ul id="individual-hasResearchArea" role="list">
        <#list expertiseDG as resultRow>
            <li role="listitem">
                <a href="${urls.base}/individual?uri=${resultRow["exp"]}" title="expertise">${resultRow["expLabel"]}</a>
            </li>
        </#list>
    </ul>   
</#if>
