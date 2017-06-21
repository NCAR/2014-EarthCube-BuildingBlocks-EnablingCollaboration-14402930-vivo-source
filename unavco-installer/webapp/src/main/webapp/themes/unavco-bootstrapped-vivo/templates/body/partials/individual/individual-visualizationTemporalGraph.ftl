<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Temporal graph visualization -->

<div id="mapofscience_link_container" class="collaboratorship-link-container">
  <#-- Replaced map of science icon with glyphicon -->
    <div class="collaboratorship-link">
        <a href="${individual.temporalGraphUrl()}" title="${i18n().temporal_graph}" class="btn btn-default">
            <span class="glyphicon glyphicon-random" aria-hidden="true"></span>
            ${i18n().temporal_graph_capitalized}
        </a>
    </div>
</div>
