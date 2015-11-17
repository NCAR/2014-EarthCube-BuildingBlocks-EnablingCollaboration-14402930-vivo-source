<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- VIVO-specific default data property statement template. 
    
     This template must be self-contained and not rely on other variables set for the individual page, because it
     is also used to generate the property statement during a deletion.  
 -->
<@showStatement statement />

<#macro showStatement statement>
  <a href="${profileUrl(statement.uri("person"))}" title="${statement.personName!}">${statement.personName!}</a> - liaison to <a href="${profileUrl(statement.uri("org"))}" title="${statement.orgLabel!}">${statement.orgLabel!}</a> 
</#macro>
