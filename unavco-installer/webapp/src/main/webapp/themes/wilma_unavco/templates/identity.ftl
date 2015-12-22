<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<header id="branding" role="banner">

    <h1 class="vivo-logo"><a title="${i18n().identity_title}" href="${urls.home}"><span class="displace">${siteName}</span></a></h1>
    <#-- Since we are using a graphic text for the tagline, we won't render ${siteTagline}
    <#if siteTagline?has_content>
        <em>${siteTagline}</em>
    </#if>-->

    <nav role="navigation">
        <ul id="header-nav" role="list">
            <#include "languageSelector.ftl">
            <li role="listitem"><a href="${urls.index}" title="${i18n().identity_index}">${i18n().identity_index}</a></li>
            <#if urls.contact??>
                <li role="listitem"><a href="${urls.contact}" title="${i18n().menu_feedback}">${i18n().menu_feedback}</a></li>
            </#if> 
            <li role="listitem"> <a href="${urls.about}" class="log-out" title="${i18n().menu_about}">${i18n().menu_about}</a></li>
            
        </ul>
        
    </nav>

    <section id="search" role="region">
        <fieldset>
            <legend>${i18n().search_form}</legend>
            
            <form id="search-form" action="${urls.search}" name="search" role="search" accept-charset="UTF-8" method="POST"> 
                <div id="search-field">
                    <input type="text" name="querytext" class="search-vivo" value="${querytext!}" autocapitalize="off" />
                    <input type="submit" value="${i18n().search_button}" class="search">
                </div>
            </form>
        </fieldset>
    </section>
