<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->
<header id="unavco-branding" role="banner">
  <a href="http://unavco.org" title="main unavco website"><img src="/vivo/themes/wilma_unavco/images/unavco-logo-red-black-shadow.png" style="width: 150px;float:left;padding: 10px 10px 10px 20px;"></a>
  <nav>
    <ul id="unavco-header-nav" role="list">
      <li role="listitem"><a href="http://unavco.org" title="main unavco website">UNAVCO.ORG</a></li>
  </ul>
  </nav>
</header>

<header id="branding" role="banner">

    <h1 class="connect-unavco-logo"><a title="${i18n().identity_title}" href="${urls.home}"><span class="displace">${siteName}</span></a></h1>
    <#-- Since we are using a graphic text for the tagline, we won't render ${siteTagline}
    <#if siteTagline?has_content>
        <em>${siteTagline}</em>
    </#if>-->

    <nav role="navigation">
        <ul id="header-nav" role="list">
            <#include "languageSelector.ftl">
            <li role="listitem"><a href="${urls.index}" title="${i18n().identity_index}">${i18n().identity_index}</a></li>
            <#if urls.contact??>
                <li role="listitem"><a href="${urls.contact}" title="${i18n().menu_contactus}">${i18n().menu_contactus}</a></li>
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
