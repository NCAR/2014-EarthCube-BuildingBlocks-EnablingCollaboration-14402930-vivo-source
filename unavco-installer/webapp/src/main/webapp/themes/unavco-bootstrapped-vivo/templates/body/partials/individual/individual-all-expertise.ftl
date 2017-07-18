<#-- $This file is distributed under the terms of the license in /doc/license.txt$  -->

<#if conceptLabel?has_content>
<h2 id="facultyResearchAreas" class="mainPropGroup">
        Community Expertise and Research Area Index
    </h2>
	You can help build our expertise and research area database by filling out <a href="https://www.surveymonkey.com/r/connect_unavco_expertise" target="_blank">this short form</a>.


<h3 style="clear:left">Research Areas</h3>

    <ul class="list-unstyled list-inline" id="individual-hasResearchArea" role="list">
        <#list conceptLabel as resultRow>

		<#if resultRow["researchArea"]??>
<li role="listitem">


<a class="amLink" href="${urls.base}/display/${resultRow["uri"]}" title="list of people with this research area">
                    ${resultRow["conceptLabel"]}
</a> </li>
</#if>
        </#list>
    </ul>


<h3 style="clear:left">Expertise</h3>

    <ul class="list-unstyled list-inline" id="individual-hasResearchArea" role="list">
        <#list conceptLabel as resultRow>

		<#if resultRow["expertise"]??>
<li role="listitem">


<a class="amLink" href="${urls.base}/display/${resultRow["uri"]}" title="list of people with this expertise">
                    ${resultRow["conceptLabel"]}
</a> </li>
</#if>
        </#list>
    </ul>

<h3 style="clear:left">Instruments and Techniques</h3>

    <ul class="list-unstyled list-inline" id="individual-hasResearchArea" role="list">
        <#list conceptLabel as resultRow>

		<#if resultRow["technique"]??>
<li class="amLink">


<a class="amLink" href="${urls.base}/display/${resultRow["uri"]}" title="list of people that use this technique">
                    ${resultRow["conceptLabel"]}
</a> </li>
</#if>
        </#list>
    </ul>

<h3 style="clear:left">Software</h3>

    <ul class="list-unstyled list-inline" id="individual-hasResearchArea" role="list">
        <#list conceptLabel as resultRow>

		<#if resultRow["software"]??>
<li class="amLink">


<a class="amLink" href="${urls.base}/display/${resultRow["uri"]}" title="list of people that use this software">
                    ${resultRow["conceptLabel"]}
</a> </li>
</#if>
        </#list>
    </ul>
	<p style="clear:left"></p>

</#if>
