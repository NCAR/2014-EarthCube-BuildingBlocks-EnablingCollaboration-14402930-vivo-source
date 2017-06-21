<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for leaflet map on individual profile page -->
<div id="timeIndicatorGeo">
   <span>${i18n().loading_map_information}&nbsp;&nbsp;&nbsp;
        <img src="${urls.images}/indicatorWhite.gif">
    </span>
</div>
<#include "indivMapScripts.ftl">
<div id="mapSmall" class="mapArea"></div>
