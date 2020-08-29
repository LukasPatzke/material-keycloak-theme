<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "title">
        ${msg("loginProfileTitle")?no_esc}
    <#elseif section = "header">
        ${msg("loginProfileTitle")?no_esc}
    <#elseif section = "form">
        <form id="kc-update-profile-form" class="form update-profile ${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <#if user.editUsernameAllowed>
                <div class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon update-profile-field ${properties.kcLabelClass!}">
                    <i class="material-icons mdc-text-field__icon" tabindex="-1" role="button">person</i>
                    <input id="username" class="mdc-text-field__input form-control ${properties.kcInputClass!}" name="username" type="text" autofocus value="${(user.username!'')}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("username")}</label>
                    </div>
                    <div class="mdc-notched-outline">
                        <svg>
                            <path class="mdc-notched-outline__path"/>
                        </svg>
                    </div>
                    <div class="mdc-notched-outline__idle"></div>
                </div>

            </#if>
            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon update-profile-field ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon" tabindex="-1" role="button">email</i>
                <input id="email" class="mdc-text-field__input form-control ${properties.kcInputClass!}" name="email" type="text" autofocus value="${(user.email!'')}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="email" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("email")}</label>
                </div>
                <div class="mdc-notched-outline">
                    <svg>
                        <path class="mdc-notched-outline__path"/>
                    </svg>
                </div>
                <div class="mdc-notched-outline__idle"></div>
            </div>

            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon update-profile-field ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon" tabindex="-1" role="button">person</i>
                <input id="firstName" class="mdc-text-field__input form-control ${properties.kcInputClass!}" name="firstName" type="text" value="${(user.firstName!'')}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="firstName" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("firstName")}</label>
                </div>
                <div class="mdc-notched-outline">
                    <svg>
                        <path class="mdc-notched-outline__path"/>
                    </svg>
                </div>
                <div class="mdc-notched-outline__idle"></div>
            </div>

            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon update-profile-field ${properties.kcLabelClass!}">
                <i class="material-icons mdc-text-field__icon" tabindex="-1" role="button">person</i>
                <input id="lastName" class="mdc-text-field__input form-control ${properties.kcInputClass!}" name="lastName" type="text" value="${(user.lastName!'')}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="lastName" class="mdc-floating-label ${properties.kcLabelClass!}">${msg("lastName")}</label>
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