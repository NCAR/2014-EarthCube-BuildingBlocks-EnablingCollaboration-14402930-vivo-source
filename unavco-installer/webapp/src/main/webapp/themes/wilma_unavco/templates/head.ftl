<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<meta charset="utf-8" />
<!-- Google Chrome Frame open source plug-in brings Google Chrome's open web technologies and speedy JavaScript engine to Internet Explorer-->
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<#if individual??>
    <#assign claz = individual.clazz>
    <#assign excludeList = ['http://www.w3.org/2006/vcard/ns#Individual','http://www.w3.org/2006/vcard/ns#Name','http://www.w3.org/2006/vcard/ns#email','http://vivoweb.org/ontology/core#Authorship','http://vivoweb.org/ontology/core#AdministratorRole','http://vivoweb.org/ontology/core#PrincipalInvestigatorRole','http://vivoweb.org/ontology/core#CoPrincipalInvestigatorRole','http://www.w3.org/2006/vcard/ns#URL','http://vitro.mannlib.cornell.edu/ns/vitro/public#File','http://vitro.mannlib.cornell.edu/ns/vitro/public#FileByteStream','http://vivoweb.org/ontology/core#ResearcherRole','http://vivoweb.org/ontology/core#AwardedDegree','http://vivoweb.org/ontology/core#NonAcademicPosition','http://vivoweb.org/ontology/core#Position','http://vivoweb.org/ontology/core#DateTimeInterval','http://vivoweb.org/ontology/core#DateTimeValue']>
    <#if excludeList?seq_contains(claz)>
        <meta name="robots" content="noindex">
    </#if>
</#if>

<title>${(title?html)!siteName!}</title>

<#-- VIVO OpenSocial Extension by UCSF -->
<#if openSocial??>
    <#if openSocial.visible>
        <#-- Required to add these BEFORE stylesheets.flt and headScripts.ftl are processed -->
        ${stylesheets.add('<link rel="stylesheet" href="${urls.theme}/css/openSocial/gadgets.css" />')}			
        ${headScripts.add('<script type="text/javascript" src="${openSocial.containerJavascriptSrc}"></script>',
                          '<script type="text/javascript" language="javascript">${openSocial.gadgetJavascript}</script>',
                          '<script type="text/javascript" src="${urls.base}/js/openSocial/orng.js"></script>')}
    </#if>	
</#if>	

<#include "stylesheets.ftl">
<link rel="stylesheet" href="${urls.theme}/css/screen.css" />

<#include "headScripts.ftl">

<!--[if (gte IE 6)&(lte IE 8)]>
<script type="text/javascript" src="${urls.base}/js/selectivizr.js"></script>
<![endif]-->

<#-- Inject head content specified in the controller. Currently this is used only to generate an rdf link on 
an individual profile page. -->
${headContent!}

<link rel="shortcut icon" type="image/x-icon" href="${urls.base}/favicon.ico">
