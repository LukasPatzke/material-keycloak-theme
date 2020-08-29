<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=true; section>
    <#if section = "header">
        ${kcSanitize(msg("webauthn-error-title"))?no_esc}
    <#elseif section = "form">

        <script type="text/javascript">
            refreshPage = () => {
                document.getElementById('isSetRetry').value = 'retry';
                document.getElementById('executionValue').value = '${execution}';
                document.getElementById('kc-error-credential-form').submit();
            }
        </script>

        <form id="kc-error-credential-form" class="${properties.kcFormClass!}" action="${url.loginAction}"
              method="post">
            <input type="hidden" id="executionValue" name="authenticationExecution"/>
            <input type="hidden" id="isSetRetry" name="isSetRetry"/>
        </form>

        <#if authenticators??>
            <div id="kc-error-available-list" class="mdc-list-group">
                <h3 class="mdc-list-group__subheader">${kcSanitize(msg("webauthn-available-authenticators"))?no_esc}</h3>
                <ul class="mdc-list mdc-list--icon-list">
                    <#list authenticators.authenticators as authenticator>
                        <li class="mdc-list-item" tabindex="0">
                            <span class="mdc-list-item__ripple"></span>
                            <span class="mdc-list-item__graphic">
                                 <i class="material-icons mdc-text-field__icon" tabindex="-1" role="button">vpn_key</i>
                            </span>
                            <span class="mdc-list-item__text" id="kc-webauthn-authenticator">${kcSanitize(authenticator.label)?no_esc}</span>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>

        <div class="${properties.kcFormGroupClass!}">
            <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                <div id="kc-form-buttons" class="col-xs-5 ${properties.kcFormButtonsClass!}">
                    <div class="${properties.kcFormButtonsWrapperClass!}">
                        <input tabindex="4" onclick="refreshPage()" type="button"
                            class="mdc-button mdc-button--raised ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                            name="try-again" id="kc-try-again" value="${kcSanitize(msg("doTryAgain"))?no_esc}"
                        />
                    </div>
                    <div class="clearfix"></div>
                </div> 
            </div>
        </div>
        

        <#if isAppInitiatedAction??>
            <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-webauthn-settings-form" method="post">
                <button type="submit"
                        class="mdc-button mdc-button--raised ${properties.kcButtonClass!} ${properties.kcButtonDefaultClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                        id="cancelWebAuthnAIA" name="cancel-aia" value="true">
                        ${msg("doCancel")}
                </button>
            </form>
        </#if>

    </#if>
</@layout.registrationLayout>