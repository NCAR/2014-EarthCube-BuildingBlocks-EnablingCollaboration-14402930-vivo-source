<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->
<#import "lib-microformats.ftl" as mf>
<#include "individual-lightboxscripts.ftl">

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

<#assign individualImage>
	<@p.image 	individual=individual
					propertyGroups=propertyGroups
					namespaces=namespaces
					editable=editable
					showPlaceholder="with_add_link" />
</#assign>

<#-- Default individual profile page template -->
<#--@dumpAll /-->
<div class="row">
	<#if sideClassSpecificExtension?? || individualImage?trim?has_content>
			<div class="col-md-8 col-sm-8 col-xs-12">
	<#else>
			<div class="col-md-12 col-sm-12 col-xs-12">
	</#if>
		<section id="individual-intro" class="vcard" role="region" <@mf.sectionSchema individual/>>

				<#-- Image -->
				<#-- <#assign individualImage>
				<@p.image individual=individual
					propertyGroups=propertyGroups
					namespaces=namespaces
					editable=editable
					showPlaceholder="with_add_link" />
				</#assign>

				<#if ( individualImage?contains('<img class="individual-photo"') )>
					<#assign infoClass = 'class="withThumb"'/>
				</#if>
				<div id="photo-wrapper">${individualImage}</div>
			</section> -->
			<!-- start section individual-info -->
			<section id="individual-info" ${infoClass!} role="region">
				<#include "individual-adminPanel.ftl">

				<#if individualProductExtensionPreHeader??>
					${individualProductExtensionPreHeader}
				</#if>

				<header class="individual-objectHeader">
					<#if relatedSubject??>
						<h2>${relatedSubject.relatingPredicateDomainPublic} for ${relatedSubject.name}</h2>
						<p>
							<a href="${relatedSubject.url}" title="${i18n().return_to(relatedSubject.name)}">&larr; ${i18n().return_to(relatedSubject.name)}</a>
						</p>
					<#else>
						<h2>
							<#if classSpecificIcon??>
								${classSpecificIcon!}
							<#else>
									<span class="class-icon glyphicon glyphicon-asterisk"></span>
							</#if>

							<#-- Label of object -->
							<@p.label individual editable labelCount localesCount languageCount/>

						<#--  Most-specific types -->
						<@p.mostSpecificTypes individual />
						<#-- This isn't linked to anything right now.... so commenting out -->
						<#-- <span id="iconControlsVitro" class="glyphicon glyphicon-link" title="${individual.uri}"></span>--></h2>
					</#if>
				</header>

				<#if individualProductExtension??>
					${individualProductExtension}
				</#if>

	</div>
					</section> <!-- individual-info -->
			<#if sideClassSpecificExtension?? || individualImage?trim?has_content>
					<div class="col-md-4 col-sm-4 col-xs-12">
					<section class="share-contact" role="region">
			</#if>

						<!-- Image -->
						<#if ( individualImage?contains('<img class="img-rounded">') )>
								<#assign infoClass = 'class="withThumb"'/>
						</#if>

						<div id="photo-wrapper">
							${individualImage}
						</div>

					<#if sideIndividualProductExtension??>
						${sideIndividualProductExtension}
					</#if>


					<#if sideClassSpecificExtension?? || individualImage?trim?has_content>
			</div>
		</section>
					</#if>
	</section> <!-- individual-intro-->

</div>
<#assign nameForOtherGroup = "${i18n().other}">

<!-- Property group menu or tabs -->
<#--
	With release 1.6 there are now two types of property group displays: the original property group
	 menu and the horizontal tab display, which is the default. If you prefer to use the property
	 group menu, simply substitute the include statement below with the one that appears after this
	 comment section.

	 <#include "individual-property-group-menus.ftl">
-->

<#include "individual-property-group-tabs.ftl">

<#assign rdfUrl = individual.rdfUrl>

<#if rdfUrl??>
	<script>
		var individualRdfUrl = '${rdfUrl}';
	</script>
</#if>
<script>
	var i18nStringsUriRdf = {
		shareProfileUri: '${i18n().share_profile_uri}',
		viewRDFProfile: '${i18n().view_profile_in_rdf}',
		closeString: '${i18n().close}'
	};
	var i18nStrings = {
		displayLess: '${i18n().display_less}',
		displayMoreEllipsis: '${i18n().display_more_ellipsis}',
		showMoreContent: '${i18n().show_more_content}',
	};

</script>


${headScripts.add('<script type="text/javascript" src="${urls.base}/js/jquery_plugins/qtip/jquery.qtip.min.js"></script>',
				  '<script type="text/javascript" src="${urls.base}/js/tiny_mce/tiny_mce.js"></script>')}

${scripts.add('<script type="text/javascript" src="${urls.base}/js/imageUpload/imageUploadUtils.js"></script>',
			  '<script type="text/javascript" src="${urls.base}/js/individual/moreLessController.js"></script>',
			  '<script type="text/javascript" src="${urls.base}/js/individual/individualUriRdf.js"></script>')}
<script type="text/javascript" src="${urls.theme}/js/readers.js"></script>
<script type="text/javascript">
	i18n_confirmDelete = "${i18n().confirm_delete}"
</script>
