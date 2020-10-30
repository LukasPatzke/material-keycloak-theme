<#import "template.ftl" as layout>
    <@layout.registrationLayout; section>
        <#if section="header">
            ${msg("doLogIn")}
            <#elseif section="form">
                <form id="kc-otp-login-form" class="${properties.kcFormClass!}" action="${url.loginAction}"
                    method="post">
                    <#if otpLogin.userOtpCredentials?size gt 1>
                        <div class="${properties.kcFormGroupClass!}">
                            <div class="${properties.kcInputWrapperClass!}">
                                <#list otpLogin.userOtpCredentials as otpCredential>
                                    <div class="${properties.kcSelectOTPListClass!}">
                                    <input type="hidden" value="${otpCredential.id}">
                                        <div class="${properties.kcSelectOTPListItemClass!}">
                                            <span class="${properties.kcAuthenticatorOtpCircleClass!}"></span>
                                            <h2 class="${properties.kcSelectOTPItemHeadingClass!}">
                                                ${otpCredential.userLabel}
                                            </h2>
                                        </div>
                                    </div>
                                </#list>
                            </div>
                        </div>
                    </#if>

                    <div class="${properties.kcFormGroupClass!}">
 
                        <div class="${properties.kcInputWrapperClass!}">
                            <div class="mdc-text-field mdc-text-field--outlined mdc-text-field--with-leading-icon ${properties.kcLabelClass!} <#if usernameEditDisabled??>mdc-text-field--disabled</#if>">
                            <i class="material-icons mdc-text-field__icon" tabindex="-1" role="button">person</i>
                            <input required id="otp" class="mdc-text-field__input ${properties.kcInputClass!} kc-otp-input" name="otp" type="text" autofocus autocomplete="off" >
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="username" class="mdc-floating-label ${properties.kcLabelClass!}">
                                    ${msg("loginOtpOneTime")}
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
                            <div class="${properties.kcFormOptionsWrapperClass!}">
                            </div>
                        </div>

                        <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                            <div class="${properties.kcFormButtonsWrapperClass!}">
                                <button class="mdc-button mdc-button--raised ${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" 
                                name="login" id="kc-login" type="submit">
                                    ${msg("doLogIn")}
                                </button>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </form>
            <script type="text/javascript" src="${url.resourcesCommonPath}/node_modules/jquery/dist/jquery.min.js"></script>
            <script type="text/javascript">
            $(document).ready(function() {
                // Card Single Select
                $('.card-pf-view-single-select').click(function() {
                  if ($(this).hasClass('active'))
                  { $(this).removeClass('active'); $(this).children().removeAttr('name'); }
                  else
                  { $('.card-pf-view-single-select').removeClass('active');
                  $('.card-pf-view-single-select').children().removeAttr('name');
                  $(this).addClass('active'); $(this).children().attr('name', 'selectedCredentialId'); }
                });

                var defaultCred = $('.card-pf-view-single-select')[0];
                if (defaultCred) {
                    defaultCred.click();
                }
              });
            </script>
        </#if>
        </@layout.registrationLayout>