<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for the main Site Administration page -->

<#-- ${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/admin.css" />')} -->

<div class="tab">
    <h2>${i18n().site_administration}</h2>
</div>

<div id="adminDashboard">
  <div class="row">
      <div class="col-md-5"><#include "siteAdmin-dataInput.ftl"></div>
    <div class="col-md-5"><#include "siteAdmin-siteConfiguration.ftl"></div>
  </div>
  <div class="row">
    <div class="col-md-5"><#include "siteAdmin-ontologyEditor.ftl"></div>

<div class="col-md-5">

    <#include "siteAdmin-advancedDataTools.ftl">
     <#include "siteAdmin-siteMaintenance.ftl">

</div>
  </div>
</div>
