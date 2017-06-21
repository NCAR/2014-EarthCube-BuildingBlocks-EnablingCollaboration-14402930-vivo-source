<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Contact form processing errors -->

<h2>${title!}</h2>

<#if errorMessage?has_content>
            <section id="error-alert" role="alert"><div class="alert alert-warning">
               <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
               <span class="sr-only">Error:</span>
                 ${errorMessage}</div>
              </section>
</#if>

<p class="contactUsReturnHome">${i18n().return_to_the}
    <a href="${urls.home}" title="${i18n().home_page}">${i18n().home_page}</a>.
</p>
