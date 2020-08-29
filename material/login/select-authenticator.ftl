<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header" || section = "show-username">
        <script type="text/javascript">
            function fillAndSubmit(authExecId) {
                document.getElementById('authexec-hidden-input').value = authExecId;
                document.getElementById('kc-select-credential-form').submit();
            }
        </script>
        <#if section = "header">
            ${msg("loginChooseAuthenticator")}
        </#if>
    <#elseif section = "form">

        <form id="kc-select-credential-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
            <ul class="mdc-list mdc-list--icon-list ${properties.kcSelectAuthListClass!}">
                <#list auth.authenticationSelections as authenticationSelection>
                    <li class="mdc-list-item ${properties.kcSelectAuthListItemClass!}" onclick="fillAndSubmit('${authenticationSelection.authExecId}')">
                        <span class="mdc-list-item__ripple"></span>
                        <span class="mdc-list-item__graphic">
                            <span class="material-icons ${properties['${authenticationSelection.iconCssClass}']!authenticationSelection.iconCssClass}"></span>
                        </span>
                        <span class="mdc-list-item__text">
                             <span class="mdc-list-item__primary-text">${msg('${authenticationSelection.displayName}')}</span>
                            <span class="mdc-list-item__secondary-text">${msg('${authenticationSelection.helpText}')}</span>
                        </span>
                    </li>
                    <#--  <div class="${properties.kcSelectAuthListItemClass!}">
                        <div class="${properties.kcSelectAuthListItemInfoClass!}" onclick="fillAndSubmit('${authenticationSelection.authExecId}')">
                            <div class="${properties.kcSelectAuthListItemLeftClass!}">
                                <span class="${properties['${authenticationSelection.iconCssClass}']!authenticationSelection.iconCssClass}"></span>
                            </div>
                            <div class="${properties.kcSelectAuthListItemBodyClass!}">
                                <div class="${properties.kcSelectAuthListItemDescriptionClass!}">
                                    <div class="${properties.kcSelectAuthListItemHeadingClass!}">
                                        ${msg('${authenticationSelection.displayName}')}
                                    </div>
                                    <div class="${properties.kcSelectAuthListItemHelpTextClass!}">
                                        ${msg('${authenticationSelection.helpText}')}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>  -->
                </#list>
                <input type="hidden" id="authexec-hidden-input" name="authenticationExecution" />
            </ul>
        </form>

    </#if>
</@layout.registrationLayout>

