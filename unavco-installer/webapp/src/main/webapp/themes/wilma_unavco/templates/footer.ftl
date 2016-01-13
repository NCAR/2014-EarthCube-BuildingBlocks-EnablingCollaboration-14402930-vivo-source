<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

</div> <!-- #wrapper-content -->

<footer role="contentinfo">
    <p class="copyright">
        <#if copyright??>
            <small>&copy;${copyright.year?c}
            <#if copyright.url??>
                <a href="${copyright.url}" title="${i18n().menu_copyright}">${copyright.text}</a>
            <#else>
                ${copyright.text}
            </#if>
             | <a class="terms" href="${urls.termsOfUse}" title="${i18n().menu_termuse}">${i18n().menu_termuse}</a></small> | 
        </#if>
        ${i18n().menu_powered} <a class="powered-by-vivo" href="http://vivoweb.org" target="_blank" title="${i18n().menu_powered} VIVO"><strong>VIVO</strong></a>
        <#if user.hasRevisionInfoAccess>
             | ${i18n().menu_version} <a href="${version.moreInfoUrl}" title="${i18n().menu_version}">${version.label}</a>
        </#if>
    </p>
    
    <nav role="navigation">
        <ul id="footer-nav" role="list">
            
            <#if urls.contact??>
                <li role="listitem"><a href="${urls.contact}" title="${i18n().menu_contactus}">${i18n().menu_contactus}</a></li>
            </#if> 
            <li role="listitem"><a href="${urls.base}/faq" title="${i18n().menu_support}">${i18n().menu_support}</a></li>
            <#if user.loggedIn>
                <#-- COMMENTING OUT THE EDIT PAGE LINK FOR RELEASE 1.5. WE NEED TO IMPLEMENT THIS IN A MORE 
                     USER FRIENDLY WAY. PERHAPS INCLUDE A LINK ON THE PAGES THEMSELVES AND DISPLAY IF THE
                     USER IS A SITE ADMIN. tlw72
                     
                     <#if (page??) && (page?is_hash || page?is_hash_ex) && (page.URLToEditPage??) >
                        <li role="listitem"><a href="${page.URLToEditPage}" title="${i18n().identity_edit}">${i18n().identity_edit}</a></li>
                     </#if>
                -->
                <#if user.hasSiteAdminAccess>
                    <li role="listitem"><a href="${urls.siteAdmin}" title="${i18n().identity_admin}">${i18n().identity_admin}</a></li>
                </#if>
                    <li>
                        <ul class="footer-dropdown">
                            <li id="footer-user-menu"><a href="#footer-user-menu" title="${i18n().identity_user}">${user.loginName}</a>
                                <ul class="footer-sub_menu">
                                     <#if user.hasProfile>
                                         <li role="listitem"><a href="${user.profileUrl}" title="${i18n().identity_myprofile}">${i18n().identity_myprofile}</a></li>
                                     </#if>
                                     <#if urls.myAccount??>
                                         <li role="listitem"><a href="${urls.myAccount}" title="${i18n().identity_myaccount}">${i18n().identity_myaccount}</a></li>
                                     </#if>
                                     <li role="listitem"><a href="${urls.logout}" title="${i18n().menu_logout}">${i18n().menu_logout}</a></li>
                                </ul>
                            </li>
                         </ul>
                     </li>
                     

                
                ${scripts.add('<script type="text/javascript" src="${urls.base}/js/userMenu/userMenuUtils.js"></script>')}
                
            <#else>
                <li role="listitem"><a class="log-out" title="${i18n().menu_loginfull}" href="${urls.login}">${i18n().menu_login}</a></li>
            </#if>
            
        </ul>
    </nav>
</footer>

<#include "scripts.ftl">
