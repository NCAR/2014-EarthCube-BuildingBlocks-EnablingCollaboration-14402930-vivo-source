<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Individual profile page template for ec:Station individuals (extends individual.ftl in vivo)-->

<#include "individual-setup.ftl">

<script>
var urlsBase = "${urls.base}";
<#if latlongDG?has_content>
  var latitude = ${latlongDG?first.lat}
  var longitude = ${latlongDG?first.long}
  <#assign localID = "${latlongDG?first.localID}">

  <#assign classSpecificExtension>

    <div id="map-wrapper" ${mapWrapperClass!}>
        <#include "individual-map.ftl">
    </div>

  </#assign>


</#if>


</script>

<#if localID??>
    <#assign sideClassSpecificExtension>
    <h5 class="contactInfoHeading">
        Data Access
    </h5>
        <div class="row individual-phone">
            <span class="col-lg-4 col-md-4 col-sm-4 col-xs-4 glyphicon glyphicon-new-window" aria-hidden="true"></span>
            <a itemprop="webpage" class="col-lg-8 col-md-8 col-sm-8 col-xs-8 telephone" href="http://www.unavco.org/data/gps-gnss/data-access-methods/dai2/app/dai2.html#4Char=${localID};scope=Station" target="_blank" title="webpage">Data Archive Interface</a>
        </div>
    </#assign>
</#if>

<#assign classSpecificIcon>
    <span class="class-icon glyphicon glyphicon-map-marker"></span>
</#assign>

<#include "individual.ftl">
