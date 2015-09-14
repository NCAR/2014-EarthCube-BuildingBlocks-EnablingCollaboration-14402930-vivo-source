<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Individual profile page template for ec:Station individuals (extends individual.ftl in vivo)-->

<#include "individual-setup.ftl">

<script>
var urlsBase = "${urls.base}";
<#if latlongDG?has_content>
  var latitude = ${latlongDG?first.lat}
  var longitude = ${latlongDG?first.long}
  
  
  <#assign classSpecificExtension>
    <section id="individual-intro" role="region">
    
    <#-- Image -->
    <#assign individualImage>
    <@p.image individual=individual
        propertyGroups=propertyGroups
        namespaces=namespaces
        editable=editable
        showPlaceholder="with_add_link" />
    </#assign>

    <div id="photo-wrapper">${individualImage}</div>
    
    <#if ( individualImage?contains('<img class="individual-photo"') )>
      <#assign mapWrapperClass = 'class="mapWithThumb"'/>
    </#if>
    
    <div id="map-wrapper" ${mapWrapperClass!}>
        <#include "individual-map.ftl">      
    </div>    
    
    </section> <!-- #right-hand-column -->
  </#assign>
  
</#if>


</script>


<#include "individual.ftl">
