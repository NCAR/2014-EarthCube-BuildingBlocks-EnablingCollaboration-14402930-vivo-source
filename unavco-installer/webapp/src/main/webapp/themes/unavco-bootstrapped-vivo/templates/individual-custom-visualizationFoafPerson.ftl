<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for sparkline visualization on individual profile page -->

<#-- Determine whether this person is an author -->
<#assign isAuthor = p.hasVisualizationStatements(propertyGroups, "${core}relatedBy", "${core}Authorship") />

<#-- Determine whether this person is involved in any grants -->
<#assign obo_RO53 = "http://purl.obolibrary.org/obo/RO_0000053">

<#assign isInvestigator = ( p.hasVisualizationStatements(propertyGroups, "${obo_RO53}", "${core}InvestigatorRole") ||
                            p.hasVisualizationStatements(propertyGroups, "${obo_RO53}", "${core}PrincipalInvestigatorRole") ||
                            p.hasVisualizationStatements(propertyGroups, "${obo_RO53}", "${core}CoPrincipalInvestigatorRole") ) >

<#if (isAuthor || isInvestigator)>

    ${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/visualization/visualization.css" />')}
    <#assign standardVisualizationURLRoot ="/visualization">

        <#if isAuthor>
            <#assign coAuthorIcon = "${urls.images}/visualization/coauthorship/co_author_icon.png">
            <#assign mapOfScienceIcon = "${urls.images}/visualization/mapofscience/scimap_icon.png">
            <#assign coAuthorVisUrl = individual.coAuthorVisUrl()>
            <#assign mapOfScienceVisUrl = individual.mapOfScienceUrl()>

            <h5>Visualizations</h5>
            <div id="coauthorship_link_container" class="collaboratorship-link-container">
				<#-- Replaced co author icon with glyphicon-->
                <div class="collaboratorship-link">
                    <a href="${coAuthorVisUrl}" title="${i18n().co_author_network}" class="btn btn-default">
                        <span class="glyphicon glyphicon-education" aria-hidden="true"></span>
                        ${i18n().co_author_network}
                    </a>
                </div>
            </div>
            <#-- Another useless div -->
            <#-- <div class="collaboratorship-link-separator"></div> -->

  	      	<div id="mapofscience_link_container" class="collaboratorship-link-container">
            	<#-- Replaced map of science icon with glyphicon -->
                <div class="collaboratorship-link">
                    <a href="${mapOfScienceVisUrl}" title="${i18n().map_of_science}" class="btn btn-default">
                        <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                        ${i18n().map_of_science_capitalized}
                    </a>
                </div>
            </div>

            ${scripts.add('<script type="text/javascript" src="${urls.base}/js/visualization/visualization-helper-functions.js"></script>')}

            <script type="text/javascript">
                var visualizationUrl = '${urls.base}/visualizationAjax?uri=${individual.uri?url}&template=${visRequestingTemplate!}';
                var infoIconSrc = '${urls.images}/iconInfo.png';
            </script>


        </#if>

        <#if isInvestigator>
            <#assign coInvestigatorVisUrl = individual.coInvestigatorVisUrl()>
            <#assign coInvestigatorIcon = "${urls.images}/visualization/coauthorship/co_investigator_icon.png">

            <div id="coinvestigator_link_container" class="collaboratorship-link-container">
                <#-- Replaced co-investigator icon with glyphicon -->
                <div class="collaboratorship-link">
                    <a href="${coInvestigatorVisUrl}" title="${i18n().co_investigator_network}" class="btn btn-default">
                        <span class="glyphicon glyphicon-screenshot" aria-hidden="true"></span>
                        ${i18n().co_investigator_network_capitalized}
                    </a>
                </div>
            </div>
        </#if>
</#if>
