<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Individual profile page template for ec:Station individuals (extends individual.ftl in vivo)-->

<script>
var urlsBase = "${urls.base}";

<#if latlongDG?has_content>
  var latitude = ${latlongDG?first.lat}
  var longitude = ${latlongDG?first.long}
  
  
  <#assign classSpecificExtension>
    <section id="right-hand-column" role="region">
        <#include "individual-map.ftl">
    </section> <!-- #right-hand-column -->
  </#assign>
  
</#if>


</script>


<#include "individual.ftl">
