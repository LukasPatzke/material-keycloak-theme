<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo; section>

    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))?no_esc}
    <#elseif section = "header">
	<div class="title">
            ${msg("loginTitleHtml",(realm.displayNameHtml!''))?no_esc}
    </div>
    <#elseif section = "form">
        <#if realm.password>
            <form id="kc-form-login" class="form ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                <div class="username-container ${properties.kcFormGroupClass!}">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!} <#if usernameEditDisabled??>mdc-text-field--disabled</#if>">
                            <i class="material-icons mdc-text-field__icon" tabindex="-1" role="button">person</i>
                            <input required id="username" class="mdc-text-field__input ${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off" <#if usernameEditDisabled??>disabled</#if>>
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="username" class="mdc-floating-label ${properties.kcLabelClass!}">
                                    <#if !realm.loginWithEmailAllowed>
                                        ${msg("username")}
                                    <#elseif !realm.registrationEmailAsUsername>
                                        ${msg("usernameOrEmail")}
                                    <#else>
                                        ${msg("email")}
                                    </#if>
                                </label>
                            </div>
                            <div class="mdc-notched-outline">
                                <svg>
                                    <path class="mdc-notched-outline__path"/>
                                </svg>
                            </div>
                            <div class="mdc-notched-outline__idle"></div>
                        </div>
                    </div>
                </div>
                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div id="kc-form-buttons" class="col-xs-5 ${properties.kcFormButtonsClass!}">
                            <div class="${properties.kcFormButtonsWrapperClass!}">
                                <button class="mdc-button mdc-button--raised ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit">
                                    ${msg("doLogIn")}
                                </button>
                            </div>
                            <div class="clearfix"></div>
                        </div> 
                    </div>
                    <#if (realm.password && realm.registrationAllowed && !usernameEditDisabled??) || realm.resetPasswordAllowed>
                        <div>
                            <div class="col-xs-12">
                                <hr class="separator" />
                            </div>
                        </div>
                        <div>
                            <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
                                <div id="kc-registration" class="col-xs-12" <#if realm.password && realm.registrationAllowed && !usernameEditDisabled?? && realm.resetPasswordAllowed>style="margin-bottom: 15px;"</#if>>
                                    <span>${msg("noAccount")} <a href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                                </div>
                            </#if>
                        </div>
                        <div>
                            <div class="${properties.kcFormOptionsWrapperClass!} col-xs-12">
                                <#if realm.resetPasswordAllowed>
                                    <span><a class="mdc-button" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                                </#if>
                            </div>
                        </div>
                    </#if>
                </div>
            </form>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && social.providers??>
            <div id="kc-social-providers">
                <ul>
                    <#list social.providers as p>
                        <li><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span class="text">${p.displayName}</span></a></li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
