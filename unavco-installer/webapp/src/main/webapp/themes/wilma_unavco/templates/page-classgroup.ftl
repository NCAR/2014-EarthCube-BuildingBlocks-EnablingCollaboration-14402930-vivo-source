<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#include "menupage-checkForData.ftl">

<#if !noData>
    <section id="menupage-intro" role="region">
        <h2>${page.title}</h2>

      <#assign classGroupDescription = "class_group_description_" + classGroupUri?replace("http://vivoweb.org/ontology#vitroClassGroup", "")>
      <#if !i18n()[classGroupDescription]?starts_with("ERROR: Text bundle")>

          <div style="clear:both"></div>
            <div id="class-group-description">

              ${i18n()[classGroupDescription]}

          </div>
      </#if>
    </section>



    <#include "menupage-browse.ftl">

    ${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/menupage/menupage.css" />')}

    <#include "menupage-scripts.ftl">
<#else>
    ${noDataNotification}
</#if>
