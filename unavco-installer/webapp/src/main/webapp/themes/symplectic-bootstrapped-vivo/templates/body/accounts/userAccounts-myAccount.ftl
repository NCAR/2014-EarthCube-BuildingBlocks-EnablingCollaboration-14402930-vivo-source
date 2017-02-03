<#-- $This file is distributed under the terms of the license in /doc/license.txt$ -->

<#-- Template for editing a user account -->

<#assign strings = i18n() />

<h3>${strings.myAccount_heading}</h3>

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
    <#elseif errorNoRoleSelected??>
        <#assign errorMessage = strings.error_no_role />
    <#elseif errorPasswordIsEmpty??>
        <#assign errorMessage = strings.error_no_password />
    <#elseif errorPasswordIsWrongLength??>
        <#assign errorMessage = strings.error_password_length(minimumLength, maximumLength) />
    <#elseif errorPasswordsDontMatch??>
        <#assign errorMessage = strings.error_password_mismatch />
    </#if>

    <#if errorMessage?has_content>
        <section id="error-alert" role="alert"><div class="alert alert-warning">
          <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
          <span class="sr-only">Error:</span>
            ${errorMessage}</div>
        </section>
    </#if>

    <#if confirmChange??>
        <#assign confirmMessage = strings.myAccount_confirm_changes />
    </#if>

    <#if confirmEmailSent??>
        <#assign confirmMessage = strings.myAccount_confirm_changes_plus_note(emailAddress) />
    </#if>

    <#if confirmMessage?has_content>
        <section id="account-feedback" role="alert"><div class="alert alert-success">
          <span class="glyphicon glyphicon-ok"></span>
            ${confirmMessage}</div>
        </section>
    </#if>

<section id="my-account" role="region">
    <form id="main-form" method="POST" action="${formUrls.myAccount}" class="form-horizontal" role="my account">
        <#if showProxyPanel?? >
            <#include "userAccounts-myProxiesPanel.ftl">
        </#if>

        <div class="form-group">
            <label class="control-label col-sm-3" for="email-address">${strings.email_address}<span class="requiredHint"> *</span></label>
            <div class="col-sm-9"><input type="text" class="form-control" name="emailAddress" value="${emailAddress}" id="email-address" role="input" />
            ${strings.email_change_will_be_confirmed}</div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-3" for="first-name">${strings.first_name}<span class="requiredHint"> *</span></label>
            <div class="col-sm-9"><input type="text" class="form-control" name="firstName" value="${firstName}" id="first-name" role="input" /></div>
        </div>

        <div class="form-group">
            <label class="control-label col-sm-3" for="last-name">${strings.last_name}<span class="requiredHint"> *</span></label>
            <div class="col-sm-9"><input type="text" class="form-control" name="lastName" value="${lastName}" id="last-name" role="input" /></div>
        </div>

        <#if !externalAuth??>
            <div class="form-group">
                <label class="control-label col-sm-3" for="new-password">${strings.new_password}</label>
                <div class="col-sm-9"><input type="password" class="form-control" name="newPassword" value="${newPassword}" id="new-password" role="input" />
                ${strings.minimum_password_length(minimumLength, maximumLength)}<br />${strings.leave_password_unchanged}</div>
            </div>

            <div class="form-group">
                <label class="control-label col-sm-3" for="confirm-password">${strings.confirm_password}</label>
                <div class="col-sm-9"><input type="password" class="form-control" name="confirmPassword" value="${confirmPassword}" id="confirm-password" role="input" /></div>
            </div>
        </#if>

        <p>
            <input type="submit" id="submitMyAccount" name="submitMyAccount" value="${strings.save_changes}" class="btn btn-success submit" disabled />
            <a class="btn btn-warning cancel" href="${urls.referringPage}" title="${strings.cancel_title}">${strings.cancel_link}</a>
        </p>

        <p class="requiredHint">* ${strings.required_fields}</p>
    </form>
</section>

${stylesheets.add('<link rel="stylesheet" href="${urls.base}/css/account/account.css" />')}
${stylesheets.add('<link rel="stylesheet" href="${urls.base}/edit/forms/css/customForm.css" />')}

${scripts.add('<script type="text/javascript" src="${urls.base}/js/jquery-ui/js/jquery-ui-1.12.1.min.js"></script>',
              '<script type="text/javascript" src="${urls.base}/js/account/accountListenerSetup.js"></script>')}
