<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for creating an account for the first time an external user logs in. -->

<#assign strings = i18n() />

<h3>${strings.first_time_login}</h3>

    <#if errorEmailIsEmpty??>
        <#assign errorMessage = strings.error_no_email />
    <#elseif errorEmailInUse??>
        <#assign errorMessage = strings.error_email_already_exists />
    <#elseif errorEmailInvalidFormat??>
        <#assign errorMessage = strings.error_invalid_email(emailAddress) />
    <#elseif errorFirstNameIsEmpty??>
        <#assign errorMessage = strings.error_no_first_name />
    <#elseif errorLastNameIsEmpty??>
        <#assign errorMessage = strings.error_no_last_name />
    </#if>

    <#if errorMessage?has_content>
        <section id="error-alert" role="alert"><div class="alert alert-warning">
            <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
            <span class="sr-only">${strings.alt_error_alert}</span>
            ${errorMessage}</div>
        </section>
    </#if>

<section id="first-time-login" role="region">
    <p>${strings.please_provide_contact_information}</p>

    <form method="POST" action="${formUrls.firstTimeExternal}" class="customForm" role="my account">

        <input type="hidden" name="externalAuthId" value="${externalAuthId}" role="input" />
        <input type="hidden" name="afterLoginUrl" value="${afterLoginUrl}" role="input" />

      <div class="form-group">
        <label for="first-name">${strings.first_name}<span class="requiredHint"> *</span></label>
        <input class="form-control" type="text" name="firstName" value="${firstName}" id="first-name" role="input" />
      </div>
      <div class="form-group">
        <label for="last-name">${strings.last_name}<span class="requiredHint"> *</span></label>
        <input class="form-control" type="text" name="lastName" value="${lastName}" id="last-name" role="input" />
      </div>
      <div class="form-group">
        <label for="email-address">${strings.email_address}<span class="requiredHint"> *</span></label>
        <input class="form-control" type="text" name="emailAddress" value="${emailAddress}" id="email-address" role="input" />
      </div>
        <#if emailIsEnabled??>
            <p class="note">${strings.first_time_login_note}</p>
        </#if>

        <p><input class="btn btn-success" type="submit" name="submit" value="${strings.create_account}" class="submit"/>
            ${strings.or}
            <a class="cancel" href="${urls.home}" title="${strings.cancel_title}">${strings.cancel_link}</a>
        </p>

        <p class="requiredHint">* ${strings.required_fields}</p>
    </form>
</section>

${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/account/account.css" />')}
${stylesheets.add('<link rel="stylesheet" href="${urls.base}/edit/forms/css/customForm.css" />')}
