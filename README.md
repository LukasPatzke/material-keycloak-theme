# material-keycloak-theme
A Keycloak theme based on Material Design

<img src="./screenshots/simple.png">
<img src="./screenshots/complex.png">
<img src="./screenshots/register.png">
<img src="./screenshots/forgot-password.png">

## Overview

This is an **incomplete** Keycloak login theme, based on [Material Design](https://material.io/design/).  The theme uses the [Material Web Components library](https://material.io/develop/web/) for UI controls.  Currently, this theme styles the following screens:
 * "login"
 * "register"
 * "forgot password"
 * "username"
 * "password"
 * "update password"
 * "update profile"
 * "webauthn register", "webauthn authenticate", "webauthn error"
 * "totp", "config totp"

More layouts may be included in the future depending on demand.

## Installation

1. Download or clone this repository
2. Copy the `material` directory in this repository to `<your-keycloak-installation>/themes/material`
3. Start or restart your Keycloak server.
4. Log into your Keycloak server's Administration Console.  Select the `material` theme by navigating to Realm Settings → General → Themes → Login Theme.

## Theming

Modify the css variables in `material/login/resources/css/material-keycloak-theme.css`

```css
body {
    --mdc-theme-primary: #546e7a;
    --mdc-theme-background: #d2d6de;
    --mdc-theme-surface: #ffffff;
}
```

More info in the [Material Design Theming Guide](https://material.io/develop/web/theming/color).