<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Contact info on individual profile page -->

<#assign phone = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/ARG_2000028","http://www.w3.org/2006/vcard/ns#Telephone")!>
<#assign primaryEmail = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/ARG_2000028","http://www.w3.org/2006/vcard/ns#Work")!>
<#assign addlEmail = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/ARG_2000028","http://www.w3.org/2006/vcard/ns#Email")!>

 <#if phone?has_content || primaryEmail?has_content || addlEmail?has_content >
    <h5 class="contactInfoHeading">
        ${i18n().contact_info}
    </h5>
</#if>

<#-- Wrapped the emails in a div so we can style them together -->
<#if primaryEmail?has_content || addlEmail?has_content>
    <div class="row emailsContainer">

        <#-- Primary Email -->
        <@emailLinks "primaryEmail" primaryEmail />

        <#-- Additional Emails -->
        <@emailLinks "email" addlEmail />
    </div>
</#if>

<#-- Phone -->

<#if phone?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
    <@p.addLinkWithLabel phone editable />
    <#if phone.statements?has_content> <#-- if there are any statements -->
        <div class="row individual-phone" <#if editable>style="list-style:none;margin-left:0;"</#if>>
            <#list phone.statements as statement>
                <span class="col-lg-4 col-md-4 col-sm-4 col-xs-4 glyphicon glyphicon-phone-alt" aria-hidden="true"></span>
                    <a itemprop="telephone" class="col-lg-8 col-md-8 col-sm-8 col-xs-8 telephone" href="tel:${statement.number!}" title="telephone">${statement.number!}</a>
                    <@p.editingLinks "${phone.localName}" "${phone.name}" statement editable phone.rangeUri />
                </span>
            </#list>
        </div>
    </#if>
</#if>

<#macro emailLinks property email>
    <#if property == "primaryEmail">
        <#local listId = "primary-email">
        <#local label = "${i18n().primary_email_capitalized}">
    <#else>
        <#local listId = "additional-emails">
        <#local label = "${i18n().additional_emails_capitalized}">
    </#if>
    <#if email?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <@p.addLinkWithLabel email editable label/>
        <#if email.statements?has_content> <#-- if there are any statements -->

            <div id="${listId}" class="individual-emails" <#if editable>style="list-style:none;margin-left:0;"</#if>>
                <#list email.statements as statement>
                    <span class="col-lg-4 col-md-4 col-sm-4 col-xs-4 glyphicon glyphicon-envelope" aria-hidden="true"></span>
                        <a itemprop="email" class="col-lg-8 col-md-8 col-sm-8 col-xs-8 email" href="mailto:${statement.emailAddress!}" title="${i18n().email}">
                            ${statement.emailAddress!}
                        </a>
                        <@p.editingLinks "${email.localName}" "${email.name}" statement editable email.rangeUri />
                    </span>
                </#list>
            </div>
        </#if>
    </#if>
</#macro>
