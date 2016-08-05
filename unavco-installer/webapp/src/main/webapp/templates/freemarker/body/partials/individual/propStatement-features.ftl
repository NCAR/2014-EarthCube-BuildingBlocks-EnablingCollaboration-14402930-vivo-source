<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Custom object property statement view for property "features". See the PropertyConfig.3 file for details. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->

<#import "lib-sequence.ftl" as s>
<#import "lib-meta-tags.ftl" as lmt>

<@showAuthorship statement />

<#-- Use a macro to keep variable assignments local; otherwise the values carry over to the
     next statement -->
<#macro showAuthorship statement>
    <#if statement.person??>
    	<#if statement.subclass?? && statement.subclass?contains("vcard")>
			  <#if statement.personName?replace(" ","")?length == statement.personName?replace(" ","")?last_index_of(",") + 1 >
        		${statement.personName?replace(",","")}
			  <#else>
				    ${statement.personName}
			  </#if>
    	<#else>
        	<a href="${profileUrl(statement.uri("person"))}" title="${i18n().person_name}">${statement.personName}</a>
    	</#if>
    <#else>
        <#-- This shouldn't happen, but we must provide for it -->
        <a href="${profileUrl(statement.uri("personship"))}" title="${i18n().missing_person}">${i18n().missing_person}</a>
    </#if>
</#macro>
