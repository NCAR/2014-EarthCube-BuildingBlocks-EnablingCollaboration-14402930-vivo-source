<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->


<#assign webpage = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/ARG_2000028","http://www.w3.org/2006/vcard/ns#URL")!>

    <#if webpage?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
        <@p.addLinkWithLabel webpage editable />
        <#if webpage.statements?has_content> <#-- if there are any statements -->
            <div class="row individual-phone" <#if editable>style="list-style:none;margin-left:0;"</#if>>
                <#list webpage.statements as statement>
                <#assign linkText>
                      <#if statement.label?has_content>${statement.label}<#t>
                      <#elseif statement.url?has_content>${statement.url}<#t>
                      </#if>
                </#assign>

                <span class="col-lg-4 col-md-4 col-sm-4 col-xs-4 glyphicon glyphicon-link" aria-hidden="true"></span>
                    <a itemprop="webpage" class="col-lg-8 col-md-8 col-sm-8 col-xs-8 telephone" href="${statement.link!}" title="webpage">${linkText!}</a>
                    <@p.editingLinks "${webpage.localName}" "${webpage.name}" statement editable webpage.rangeUri />
                </span>
                </#list>
            </div>
        </#if>
    </#if>
