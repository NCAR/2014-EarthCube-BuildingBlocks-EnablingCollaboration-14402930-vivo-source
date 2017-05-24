<#-- $This file is distributed under the terms of the license in /doc/license.txt$	-->

<@widget name="login" include="assets" />
<#import "lib-home-page.ftl" as lh>

<!DOCTYPE html>
<html lang="en">
	<head>
		<#include "head.ftl">
		<script type="text/javascript" src="${urls.theme}/js/homePageUtils.js?version=x"></script>
		<script type="text/javascript" src="${urls.base}/js/d3.min.js"></script>
		<script type="text/javascript" src="${urls.base}/js/visualization/d3.layout.cloud.js"></script>
	</head>

	<#-- REMOVE <body class="${bodyClasses!}" onload="${bodyOnload!}">-->
	<body class="no-logo fae">
		<#include "identity-home.ftl">

		<#-- Hero image with search on top -->
		<div class="container-fluid">
				<div class="row hero">
					<nav class="navbar transparent navbar-inverse">
						<div class="container-fluid">
							<#-- because row hero also has a -15 margin, rethink this maybe -->
							<div class="navbar-header" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
								<button type="button" class="navbar-toggle collapsed">
									<span class="sr-only">Toggle navigation</span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
									<span class="icon-bar"></span>
								</button>
								<a class="navbar-brand hidden-sm hidden-md hidden-lg">Browse</a>
							</div>

							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
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
									action='${urls.base}/esearch'
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

				<div class="row explore">
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

		</div>


	<#-- Include the footer template after the statistics-->
	<#include "footer.ftl">

	<script>
		var i18nStrings = {
			viewAllString: '${i18n().view_all}'
		};
		// set the 'limmit search' text and alignment
		if	( $('input.search-homepage').css('text-align') == "right" ) {
			 $('input.search-homepage').attr("value","${i18n().limit_search} \u2192");
		}
	</script>
	</body>
</html>
