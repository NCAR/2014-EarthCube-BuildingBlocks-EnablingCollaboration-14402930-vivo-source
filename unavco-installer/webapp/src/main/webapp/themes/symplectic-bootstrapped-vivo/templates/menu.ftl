<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

</header>

<#include "developer.ftl">


<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand hidden-sm hidden-md hidden-lg">Browse</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <div class="col-sm-12">

            <form
              class="navbar-form hidden-sm hidden-lg hidden-md"
              role="search"
              action='${urls.base}/esearch'
              method="get"
              name="search"
            >
              <div class="input-group">
                <input
                  type="text"
                  class="form-control hidden-sm hidden-lg hidden-md"
                  name="query_in"
                  class="search-vivo"
                  value="${query_in!}"
                  
                >
                <span class="input-group-btn">

                  <button type="submit" class="btn btn-default hidden-sm hidden-lg hidden-md">
                    <span class="glyphicon glyphicon-search" role="submit"></span>
                  </button>
                </span></div>
          </form>

    </div>
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



<!-- The below div was removed to make styles easy to apply on specific pages -->
<div class="container"> <#--This container has to be left open to contain all search result pages, however it must be closed at the top of footer.ftl or the footer will not extend the width of the browser. -->
	<#if flash?has_content>
		<#if flash?starts_with(i18n().menu_welcomestart) >
			<section  id="welcome-msg-container" role="container">
				<section  id="welcome-message" role="alert"><div class="alert alert-success">${flash}</div></section>
			</section>
		<#else>
			<section id="flash-message" role="alert">
			<div class="alert alert-info">	${flash} </div>
			</section>
		</#if>
	</#if>

	<!--[if lte IE 8]>
	<noscript>
		<p class="ie-alert">This site uses HTML elements that are not recognized by Internet Explorer 8 and below in the absence of JavaScript. As a result, the site will not be rendered appropriately. To correct this, please either enable JavaScript, upgrade to Internet Explorer 9, or use another browser. Here are the <a href="http://www.enable-javascript.com"  title="java script instructions">instructions for enabling JavaScript in your web browser</a>.</p>
	</noscript>
	<![endif]-->
