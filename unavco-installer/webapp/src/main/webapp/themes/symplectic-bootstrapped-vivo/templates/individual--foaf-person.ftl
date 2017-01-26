<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#include "individual-setup.ftl">
<#include "individual-lightboxscripts.ftl">
<#import "lib-vivo-properties.ftl" as vp>
<#--Number of labels present-->
<#if !labelCount??>
	 <#assign labelCount = 0 >
</#if>
<#--Number of available locales-->
<#if !localesCount??>
	<#assign localesCount = 1>
</#if>
<#--Number of distinct languages represented, with no language tag counting as a language, across labels-->
<#if !languageCount??>
	<#assign languageCount = 1>
</#if>
<#assign visRequestingTemplate = "foaf-person-wilma">
<#assign foafFullName>
	<#assign title = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/ARG_2000028","http://www.w3.org/2006/vcard/ns#Title")!>
         <#--<#assign full_name = propertyGroups.pullProperty("http://purl.obolibrary.org/obo/ARG_2000028","http://www.w3.org/2006/vcard/ns#Name")!>
		<#if full_name?has_content>
			<#list full_name.statements as statement>
				<span itemprop="name" class="fn"><@showFullName statement /></span>
			</#list>

		</#if>
          -->
           <@p.label individual editable labelCount localesCount/>
			<#if title?has_content> <#-- true when the property is in the list, even if not populated (when editing) -->
				<#if (title.statements?size < 1) >
					<@p.addLinkWithLabel title editable />
				<#elseif editable>
					${title.name?capitalize!}
					<@p.verboseDisplay title />
				</#if>
				<#list title.statements as statement>
                                   <br/><small class="text-muted">
					<span itemprop="jobTitle" class="display-title<#if editable>-editable</#if>">${statement.preferredTitle}
					</span>
                                      </small>
					<@p.editingLinks "${title.localName}" "${title.name}" statement editable title.rangeUri />
				</#list>
			</#if>
		<#--</#if> -->
		<#-- If preferredTitle is unpopulated, display mostSpecificTypes -->
		<#if ! (title.statements)?has_content>
	              	<@p.mostSpecificTypes individual />
		</#if>
</#assign>

<#--add the VIVO-ORCID interface -->
<#include "individual-orcidInterface.ftl">

	<div class="row person-content">
		<div class="row container">
			<#-- <section itemscope itemtype="http://schema.org/Person" id="individual-intro" class="vcard person" role="region"> -->
			<div class="col-md-8 col-sm-8 col-xs-12">
				<section id="individual-info" ${infoClass!} role="region">
					<#include "individual-adminPanel.ftl">
					<header>
						<h2>
							<span class="class-icon glyphicon glyphicon-user"></span>

							${foafFullName}
						</h2>
							<#if relatedSubject??>
								<h2>${relatedSubject.relatingPredicateDomainPublic} ${i18n().indiv_foafperson_for} ${relatedSubject.name}</h2>
								<p>
									<a href="${relatedSubject.url}" title="${i18n().indiv_foafperson_return}">&larr; ${i18n().indiv_foafperson_return} ${relatedSubject.name}</a>
								</p>
							</#if>
							<!-- Positions -->
							<#include "individual-custom-positions.ftl">
					</header>


				<!-- Overview -->
				 <#-- <#include "individual-overview.ftl">	-->

					<!-- Research Areas -->
					<#include "individual-custom-researchAreas.ftl">

					<!-- Expertise -->
	        <#include "individual-expertise.ftl">

					<!-- Geographic Focus -->
					<#-- <#include "individual-custom-geographicFocus.ftl"> -->

					<#include "individual-openSocial.ftl">
				</section>

	    </div>
			<div class="col-md-4 col-sm-4 col-xs-12">
				<section itemscope itemtype="http://schema.org/Person" id="individual-intro" class="vcard person" role="region">
					<section class="share-contact" role="region">
						<!-- Image -->
						<#assign individualImage>
							<@p.image 	individual=individual
											propertyGroups=propertyGroups
											namespaces=namespaces
											editable=editable
											showPlaceholder="never" />
						</#assign>

						<#if ( individualImage?contains('<img class="img-rounded">') )>
								<#assign infoClass = 'class="withThumb"'/>
						</#if>

						<div id="photo-wrapper">
							${individualImage}
						</div>


						<!-- Contact Info -->
				<#--<div id="individual-tools-people">
							<span id="iconControlsLeftSide">
								<img id="uriIcon" title="${individual.uri}" src="${urls.images}/individual/uriIcon.gif" alt="${i18n().uri_icon}"/>
								<#if checkNamesResult?has_content >
									<img id="qrIcon"  src="${urls.images}/individual/qr_icon.png" alt="${i18n().qr_icon}" />
									<sp an id="qrCodeImage" class="hidden">${qrCodeLinkedImage!}
										<a class="qrCloseLink" href="#"  title="${i18n().qr_code}">
											${i18n().close_capitalized}
										</a>
									</span>
								</#if>
							</span>
						</div> -->
						<#include "individual-custom-contactInfo.ftl">
						<#include "individual-custom-webpage.ftl">
						<#include "individual-custom-visualizationFoafPerson.ftl">
						<#-- Moved Geographic focus under the profile page -->
						<#include "individual-custom-geographicFocus.ftl">
						<!-- Websites -->
					</section>
				</section>
			</div>
</div>
<#-- </section>
	</div> --> <#-- this is closed in individual-foaf-property-group-tabs -->

<#assign nameForOtherGroup = "${i18n().other}">

<#-- Ontology properties -->
<#if !editable>
	<#-- We don't want to see the first name and last name unless we might edit them. -->
	<#assign skipThis = propertyGroups.pullProperty("http://xmlns.com/foaf/0.1/firstName")!>
	<#assign skipThis = propertyGroups.pullProperty("http://xmlns.com/foaf/0.1/lastName")!>
</#if>

<!-- Property group menu or tabs -->
<#--
		 With release 1.6 there are now two types of property group displays: the original property group
		 menu and the horizontal tab display, which is the default. If you prefer to use the property
		 group menu, simply substitute the include statement below with the one that appears after this
		 comment section.

		 <#include "individual-property-group-menus.ftl">
-->
<#-- <#include "individual-property-group-tabs.ftl"> -->
<#include "individual--foaf-property-group-tabs.ftl">
<#assign rdfUrl = individual.rdfUrl>

<#if rdfUrl??>
		<script>
				var individualRdfUrl = '${rdfUrl}';
		</script>
</#if>
<script>
	var imagesPath = '${urls.images}';
	var individualUri = '${individual.uri!}';
	var individualPhoto = '${individual.thumbNail!}';
	var exportQrCodeUrl = '${urls.base}/qrcode?uri=${individual.uri!}';
	var baseUrl = '${urls.base}';
	var i18nStrings = {
			displayLess: '${i18n().display_less}',
			displayMoreEllipsis: '${i18n().display_more_ellipsis}',
			showMoreContent: '${i18n().show_more_content}',
			verboseTurnOff: '${i18n().verbose_turn_off}',
			researchAreaTooltipOne: '${i18n().research_area_tooltip_one}',
			researchAreaTooltipTwo: '${i18n().research_area_tooltip_two}'
		};
	var i18nStringsUriRdf = {
			shareProfileUri: '${i18n().share_profile_uri}',
			viewRDFProfile: '${i18n().view_profile_in_rdf}',
			closeString: '${i18n().close}'
		};
</script>

<#-- ${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/individual/individual.css" />',
									'<link rel="stylesheet" href="${urls.base}/css/individual/individual-vivo.css" />',
									'<link rel="stylesheet" href="${urls.base}/js/jquery-ui/css/smoothness/jquery-ui-1.12.1.css" />')}
-->

		 ${stylesheets.add('<link rel="stylesheet" href="${urls.base}/js/jquery-ui/css/smoothness/jquery-ui-1.12.1.css" />')}
${headScripts.add('<script type="text/javascript" src="${urls.base}/js/tiny_mce/tiny_mce.js"></script>',
									'<script type="text/javascript" src="${urls.base}/js/jquery_plugins/qtip/jquery.qtip.min.js"></script>',
									'<script type="text/javascript" src="${urls.base}/js/jquery_plugins/jquery.truncator.js"></script>',
									'<script type="text/javascript" src="https://d1bxh8uas1mnw7.cloudfront.net/assets/embed.js"></script>')}

${scripts.add('<script type="text/javascript" src="${urls.base}/js/individual/individualUtils.js"></script>',
							'<script type="text/javascript" src="${urls.base}/js/individual/individualQtipBubble.js"></script>',
							'<script type="text/javascript" src="${urls.base}/js/individual/individualUriRdf.js"></script>',
				'<script type="text/javascript" src="${urls.base}/js/individual/moreLessController.js"></script>',
							'<script type="text/javascript" src="${urls.base}/js/jquery-ui/js/jquery-ui-1.12.1.min.js"></script>',
							'<script type="text/javascript" src="${urls.base}/js/imageUpload/imageUploadUtils.js"></script>')}

<#macro showFullName statement>

		<#if statement.fullName?has_content>
				<#if statement.prefix??><span itemprop="honorificPrefix">${statement.prefix!}</span></#if>
				<span itemprop="givenName">${statement.firstName!}</span>
				<span itemprop="additionalName">${statement.middleName!}</span>
				<span itemprop="familyName">${statement.lastName!}</span><#if statement.suffix??>, ${statement.suffix!}</#if>
		</#if>

</#macro>
