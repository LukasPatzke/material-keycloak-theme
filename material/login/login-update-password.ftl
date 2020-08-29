<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("updatePasswordTitle")?no_esc}
    <#elseif section = "header">
        ${msg("updatePasswordTitle")?no_esc}
    <#elseif section = "form">
        <form id="kc-passwd-update-form" class="form update-password ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <input type="text" readonly value="this is not a login form" style="display: none;">
            <input type="password" readonly value="this is not a login form" style="display: none;">

            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon update-password-field ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon" tabindex="-1" role="button">lock</i>
                <input required id="password-new" class="mdc-text-field__input ${properties.kcInputClass!}" name="password-new" type="password" autofocus autocomplete="off">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-new" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("passwordNew")}</label>
                </div>
                <div class="mdc-notched-outline">
                    <svg>
                        <path class="mdc-notched-outline__path"/>
                    </svg>
                </div>
                <div class="mdc-notched-outline__idle"></div>
            </div>

            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon update-password-field ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon" tabindex="-1" role="button">lock</i>
                <input required id="password-confirm" class="mdc-text-field__input ${properties.kcInputClass!}" name="password-confirm" type="password" autofocus autocomplete="off">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="password-confirm" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                </div>
                <div class="mdc-notched-outline">
                    <svg>
                        <path class="mdc-notched-outline__path"/>
                    </svg>
                </div>
                <div class="mdc-notched-outline__idle"></div>
            </div>

            <div id="kc-form-buttons" class="col-xs-5 ${properties.kcFormButtonsClass!}">
                <div class="${properties.kcFormButtonsWrapperClass!}">
                    <button class="mdc-button mdc-button--raised ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-submit" type="submit">
                        ${msg("doSubmit")}
                    </button>
                </div>
                <div class="clearfix"></div>
            </div> 
        </form>
    </#if>
</@layout.registrationLayout>