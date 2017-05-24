<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->
<header id="unavco-branding" role="banner">
  <a href="http://unavco.org" title="main unavco website"><img src="${urls.theme}/images/unavco-logo-red-black-shadow.png" style="width: 150px;float:left;margin: 10px 10px 10px 20px;"></a>
  <nav>
    <ul id="unavco-header-nav" role="list">
      <li role="listitem"><a href="http://unavco.org" title="main unavco website">UNAVCO.ORG</a></li>
  </ul>
  </nav>
</header>

<header id="branding" role="banner">
	<div class="header">
		<div class="hgroup">
			<div class="container">
				<div class="row">

					<div class="col-md-6 col-sm-6 hidden-xs logo-sm vcenter">
						<img src="${urls.theme}/images/Connect-UNAVCO-logo.png" alt="Institution Logo-beta" />
					</div><!--
					--><div class="col-xs-12 visible-xs-block">
						<img src="${urls.theme}/images/Connect-UNAVCO-logo.png" alt="Institution Logo" />
					</div><!--
					--><div class="col-md-6 col-sm-6 hidden-xs vcenter">

						<section id="search" role="region">
									<form
										class="navbar-form navbar-right"
										role="search"
										action='${urls.base}/esearch'
										method="get"
										name="search"
									>
										<div class="form-group">
											<input
												type="text"
												class="form-control"
												name="query_in"
												class="search-vivo"
												value="${query_in!}"
												
											>
										</div>

									<#-- Search button for search form in navbar -->
									<button type="submit" class="btn btn-default sympl-search hidden-xs">
										<span class="glyphicon glyphicon-search" role="submit"></span>
									</button>

									<#-- Button for submitting search has been repeated with btn-block and hidden on lg and md devices to fix mobile support -->
									<button type="submit" class="btn btn-default btn-block sympl-search hidden-sm hidden-lg hidden-md">
										<span class="glyphicon glyphicon-search" role="submit"></span>
									</button>
								</form>
				    </section>


					</div>

				</div>
			</div>
		</div>
	</div>
</header>

	<#--<!--<h1 class="vivo-logo"><a title="${i18n().identity_title}" href="${urls.home}"><span class="displace">${siteName}</span></a></h1>
	<#-- Since we are using a graphic text for the tagline, we won't render ${siteTagline}
	<#if siteTagline?has_content>
		<em>${siteTagline}</em>
	</#if>-->

<#--<!--    <nav role="navigation">
		<ul id="header-nav" role="list">
			<#include "languageSelector.ftl">
			<li role="listitem"><a href="${urls.index}" title="${i18n().identity_index}">${i18n().identity_index}</a></li>
			<#if user.loggedIn>
				<#if user.hasSiteAdminAccess>
					<li role="listitem"><a href="${urls.siteAdmin}" title="${i18n().identity_admin}">${i18n().identity_admin}</a></li>
				</#if>
					<li>
						<ul class="dropdown">
							<li id="user-menu"><a href="#" title="${i18n().identity_user}">${user.loginName}</a>
								<ul class="sub_menu">
									 <#if user.hasProfile>
										 <li role="listitem"><a href="${user.profileUrl}" title="${i18n().identity_myprofile}">${i18n().identity_myprofile}</a></li>
									 </#if>
									 <#if urls.myAccount??>
										 <li role="listitem"><a href="${urls.myAccount}" title="${i18n().identity_myaccount}">${i18n().identity_myaccount}</a></li>
									 </#if>
									 <li role="listitem"><a href="${urls.logout}" title="${i18n().menu_logout}">${i18n().menu_logout}</a></li>
								</ul>
							</li>
						 </ul>
					 </li>



				${scripts.add('<script type="text/javascript" src="${urls.base}/js/userMenu/userMenuUtils.js"></script>')}

			<#else>
				<li role="listitem"><a class="log-out" title="${i18n().menu_loginfull}" href="${urls.login}">${i18n().menu_login}</a></li>
			</#if>
		</ul>

	</nav>
-->
