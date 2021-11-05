#!/usr/bin/env bash
set -euo pipefail

cat <<EOF > /tmp/spin-config
Auth:
  Basic: null
  Enabled: true
  GoogleServiceAccount: null
  Iap: null
  IgnoreCertErrors: false
  Ldap: null
  OAuth2:
    AuthUrl: https://accounts.google.com/o/oauth2/v2/auth
    CachedToken:
      access_token: $(gcloud auth print-access-token)
      expiry: "0001-01-01T00:00:00Z"
      refresh_token: $(gcloud auth print-refresh-token)
    ClientId: ""
    ClientSecret: ""
    Scopes:
    - profile
    - email
    TokenUrl: https://www.googleapis.com/oauth2/v4/token
  X509: null
Gate:
  Endpoint: ""
EOF
