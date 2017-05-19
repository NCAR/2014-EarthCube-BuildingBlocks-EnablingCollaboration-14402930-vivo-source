<#-- $This file is distributed under the terms of the license in /doc/license.txt$	-->

<@widget name="login" include="assets" />

<#--
		With release 1.6, the home page no longer uses the "browse by" class group/classes display.
		If you prefer to use the "browse by" display, replace the import statement below with the
		following include statement:

			<#include "browse-classgroups.ftl">

		Also ensure that the homePage.geoFocusMaps flag in the runtime.properties file is commented
		out.
-->
<#import "lib-home-page.ftl" as lh>

<!DOCTYPE html>
<html lang="en">
	<head>
		<#include "head.ftl">
		<#if geoFocusMapsEnabled >
			<#include "custom-geoFocusMapScripts.ftl">
		</#if>
		<script type="text/javascript" src="${urls.theme}/js/homePageUtils.js?version=x"></script>
		<script type="text/javascript" src="${urls.base}/js/d3.min.js"></script>
		<script type="text/javascript" src="${urls.base}/js/visualization/d3.layout.cloud.js"></script>
	</head>

	<#-- REMOVE <body class="${bodyClasses!}" onload="${bodyOnload!}">-->
	<body class="no-logo fae">
	<#-- supplies the faculty count to the js function that generates a random row number for the search query -->
		<@lh.facultyMemberCount	 vClassGroups! />
		<#include "identity-home.ftl">

		<#-- Hero image with search on top -->
		<div class="container-fluid">
				<div class="row hero">
					<nav class="navbar transparent navbar-inverse" style="margin-bottom: 0;">
						<div class="container-fluid">
							<div class="navbar-header" style="margin: 0px;"> 	<#-- because row hero also has a -15 margin, rethink this maybe -->
								<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
								<a class="navbar-brand hidden-sm hidden-md hidden-lg">Browse</a>
							</div>

							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1" style="margin: 0;">
								<ul class="nav navbar-nav">

									<#list menu.items as item>
										<li>
											<a href="${item.url}" title="${item.linkText} ${i18n().menu_item}"
												<#if item.active> class="active"</#if>>
													${item.linkText}
											</a>
										</li>
									</#list>



							</div><!-- /.navbar-collapse -->
						</div><!-- /.container-fluid -->
					</nav>

					<div class="theme-showcase">
						<div class="col-md-12">
							<div class="container" role="main">

								<div class="jumbotron">
									<h1>${i18n().intro_title}</h1>
								</div>

								<form
									id="search-homepage"
									role="search"
									action='esearch'
									method="get"
									name="search"
								>
									<div class="input-group input-group-lg">
										<input
											type="text"
											class="form-control"
											name="query_in"
											value="${query_in!}"
											placeholder="Find people, data, or research..."
										/>
										<div class="input-group-btn">
											<button type="submit" class="btn btn-default btn-lg sympl-search" role="submit">
												<span class="glyphicon glyphicon-search" aria-hidden="true"></span>
											</button>
										</div>
									</div>
								</form>
							</div>
						</div>

						<div class="col-md-12">
							<div class="container">
								<div class="jumbotron">
									<p>${i18n().intro_para1}</p>
									<p>${i18n().intro_para2}</p>
								</div>
							</div>
						</div>
					</div>
				</div>


				<#-- Moved menu nav below hero search
				<#include "menu.ftl"> -->
				<#-- The large icons below hero search -->
				<#--
				<div class="row icons-home">
					<div class="col-md-4">
						<a href="/s/search.html?collection=vivo-lilliput&form=lilliputsimple#collaborator" id="icon1">
							<span class="glyphicon glyphicon-user"></span>
							<h3>Search for a collaborator</h3>
						</a>
					</div>
					<div class="col-md-4">
						<a href="/s/search.html?collection=vivo-lilliput&form=lilliputsimple#supervisor" id="icon2">
							<span class="glyphicon glyphicon-pencil"></span>
							<h3>Find a supervisor</h3>
						</a>
					</div>
					<div class="col-md-4">
					 <a href="/s/search.html?collection=vivo-lilliput&form=lilliputsimple#consultancy" id="icon3">
						<span class="glyphicon glyphicon-education"></span>
						<h3>Locate expert opinion</h3>
					 </a>
					</div>
				</div>
		-->
				<div class="row explore">
				<#-- This section abandons the randomizer for faculty/depts in favour of a static approach so that institutions have better control over which ones they showcase. A script could still be deployed to explout the id's to change the departments with page load -->
					<div class="container">

						<#--The title row extends the full width -->
						<div class="col-md-12">
							<h2 class="h1">Explore our community expertise</h2>
						</div>

						<div class="col-md-12">
							<#include "wordCloudTerms.ftl">
								<div id="wordMap">
								</div>
						</div>


					</div>
				</div>

		<#--
				<div class="row faculty-home">
					<div class="container">
						<div class="col-md-12">
							<h2 class="h1">Meet our experts</h2>
							<div class="gap20"></div>
							<p>The UNAVCO community is dedicated to changing the nature of scholarship, Meet some of our experts ready to share thier knowledge.</p>  -->
							<!-- Use bootstrap carousel to showcase faculty members, edited in lib-home-page.ftl and homePageUtils.js -->
						<#--	<@lh.facultyMbrHtml />
						</div>
					</div>
				</div> -->


				<#-- <@widget name="login" /> -->

				<!-- List of research classes: e.g., articles, books, collections, conference papers -->
				<div class="row research-count">
					<div class="container">
						<div class="col-md-6">
							<h2 class="h1">About Connect UNAVCO</h2>
							<div class="gap20"></div>
								<p>${i18n().intro_para1}</p>
								<div class="gap30"></div>
								<button type="button" class="btn btn-default">
								<a href="${urls.base}/about">Read more about Connect UNAVCO</a>
								</button>
						</div>
						<div class="col-md-6" id="research-classes">
							<@lh.researchClasses />
						</div>
					</div>
				</div>

				<#-- List of four randomly selected faculty members
					<@lh.facultyMbrHtml /> -->

				<#-- List of randomly selected academic departments -->
			<#--<div class="row dept-home">
					<div class="container">
						<div class="col-md-12" id="academic-depts">
							<@lh.academicDeptsHtml />
						</div>
					</div>
				</div> -->
				<#if geoFocusMapsEnabled >
				<div class="row geo-home">
					<div class="container-fluid">
						<div class="col-md-12 hidden-xs hidden-sm" id="geo-map">
							<#-- Map display of researchers' areas of geographic focus. Must be enabled in runtime.properties -->
								<@lh.geographicFocusHtml />
						</div>
					</div>
				</div>
				</#if>

		</div>

		<#-- builds a json object that is used by js to render the academic departments section -->
		 <@lh.listAcademicDepartments />

	<#-- Include the footer template after the statistics-->
	<#include "footer.ftl">

	<script>
		var i18nStrings = {
			researcherString: '${i18n().researcher}',
			researchersString: '${i18n().researchers}',
			currentlyNoResearchers: '${i18n().currently_no_researchers}',
			countriesAndRegions: '${i18n().countries_and_regions}',
			countriesString: '${i18n().countries}',
			regionsString: '${i18n().regions}',
			statesString: '${i18n().map_states_string}',
			stateString: '${i18n().map_state_string}',
			statewideLocations: '${i18n().statewide_locations}',
			researchersInString: '${i18n().researchers_in}',
			inString: '${i18n().in}',
			noFacultyFound: '${i18n().no_faculty_found}',
			placeholderImage: '${i18n().placeholder_image}',
			viewAllFaculty: '${i18n().view_all_faculty}',
			viewAllString: '${i18n().view_all}',
			viewAllDepartments: '${i18n().view_all_departments}',
			noDepartmentsFound: '${i18n().no_departments_found}'
		};
		// set the 'limmit search' text and alignment
		if	( $('input.search-homepage').css('text-align') == "right" ) {
			 $('input.search-homepage').attr("value","${i18n().limit_search} \u2192");
		}
	</script>
	</body>
</html>
