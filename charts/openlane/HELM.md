# openlane

**Homepage:** <https://docs.theopenlane.io>

## Prerequisites

- [Helm](https://helm.sh/docs/intro/install/)
- [ct](https://github.com/helm/chart-testing)
- [helm-docs](https://github.com/norwoodj/helm-docs)
- [task](https://taskfile.dev/)

Once you've installed `task` you can simply run `task install` to get the remaining dependencies installed, assuning you're using macOS and have `brew`.

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Openlane | <support@theopenlane.io> | <https://www.theopenlane.io> |

## Description

A Helm chart to deploy the core Openlane server

## Source Code

* <https://github.com/theopenlane/core>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| openlane.nameOverride | string | `""` |  |
| openlane.replicaCount | int | `3` |  |
| openlane.pdb.enabled | bool | `true` |  |
| openlane.pdb.minAvailable | int | `1` |  |
| openlane.image.repository | string | `"ghcr.io/theopenlane/core"` |  |
| openlane.image.tag | string | `"v0.45.11"` |  |
| openlane.image.pullPolicy | string | `"IfNotPresent"` |  |
| openlane.resources.requests | object | `{}` |  |
| openlane.resources.limits | object | `{}` |  |
| openlane.serviceAccountName | object | `{}` |  |
| openlane.existingSecret | string | `""` |  |
| openlane.secret.create | bool | `false` |  |
| openlane.secret.name | string | `"openlane-app-secret"` |  |
| openlane.secret.annotations | object | `{}` |  |
| openlane.config.create | bool | `false` |  |
| openlane.config.name | string | `"openlane-config"` |  |
| openlane.config.annotations | object | `{}` |  |
| openlane.secretEnv.CORE_DB_PRIMARYDBSOURCE | string | `""` |  |
| openlane.secretEnv.CORE_JOBQUEUE_CONNECTIONURI | string | `""` |  |
| openlane.secretEnv.OPENFGA_DATASTORE_URI | string | `""` |  |
| openlane.secretEnv.RIVERBOAT_RIVER_DATABASEHOST | string | `""` |  |
| openlane.secretEnv.RIVERBOAT_RIVER_WORKERS_EMAILWORKER_CONFIG_TOKEN | string | `""` |  |
| openlane.secretEnv.CORE_AUTHZ_CREDENTIALS_APITOKEN | string | `""` |  |
| openlane.secretEnv.OPENFGA_AUTHN_PRESHARED_KEYS | string | `""` |  |
| openlane.secretEnv.CORE_SESSIONS_SIGNINGKEY | string | `""` |  |
| openlane.secretEnv.CORE_SESSIONS_ENCRYPTIONKEY | string | `""` |  |
| openlane.secretEnv.CORE_OBJECTSTORAGE_ACCESSKEY | string | `""` |  |
| openlane.secretEnv.CORE_OBJECTSTORAGE_SECRETKEY | string | `""` |  |
| openlane.secretEnv.CORE_SUBSCRIPTION_PRIVATESTRIPEKEY | string | `""` |  |
| openlane.secretEnv.CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET | string | `""` |  |
| openlane.secretEnv.CORE_AUTH_PROVIDERS_GOOGLE_CLIENTSECRET | string | `""` |  |
| openlane.secretEnv.CORE_AUTH_PROVIDERS_GITHUB_CLIENTSECRET | string | `""` |  |
| openlane.secretEnv.CORE_TOTP_SECRET | string | `""` |  |
| openlane.secretEnv.CORE_SLACK_WEBHOOKURL | string | `""` |  |
| openlane.cloudsql.enabled | bool | `true` |  |
| openlane.cloudsql.instanceSecret | string | `"cloudsql-credentials"` |  |
| openlane.service.type | string | `"ClusterIP"` |  |
| openlane.service.port | int | `80` |  |
| openlane.ingress.enabled | bool | `true` |  |
| openlane.ingress.className | string | `"gce"` |  |
| openlane.ingress.annotations | object | `{}` |  |
| openlane.ingress.hosts[0].host | string | `""` |  |
| openlane.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| openlane.ingress.hosts[0].paths[0].pathType | string | `"Prefix"` |  |
| openlane.ingress.tls | list | `[]` |  |
| openlane.coreConfiguration.domain | string | `""` | Domain provides a global domain value for other modules to inherit |
| openlane.coreConfiguration.refreshInterval | string | `"10m0s"` | RefreshInterval determines how often to reload the config |
| openlane.coreConfiguration.server | object | `{"cacheControl":{"enabled":true,"etagHeaders":[],"noCacheHeaders":{}},"complexityLimit":100,"cors":{"allowOrigins":[],"cookieInsecure":false,"enabled":true,"prefixes":{}},"csrfProtection":{"cookie":"ol.csrf-token","cookieDomain":"","cookieHttpOnly":false,"cookiePath":"/","enabled":false,"header":"X-CSRF-Token","sameSite":"Lax","secure":true},"defaultTrustCenterDomain":"","dev":false,"enableGraphExtensions":true,"fieldLevelEncryption":{"enabled":false},"graphPool":{"maxWorkers":100},"idleTimeout":"30s","listen":":17608","maxResultLimit":100,"metricsPort":":17609","mime":{"defaultContentType":"application/data","enabled":true,"mimeTypesFile":""},"readHeaderTimeout":"2s","readTimeout":"15s","redirects":{"code":0,"enabled":true,"redirects":{}},"secure":{"contentsecuritypolicy":"default-src 'self'","contenttypenosniff":"nosniff","cspreportonly":false,"enabled":true,"hstsmaxage":31536000,"hstspreloadenabled":false,"referrerpolicy":"same-origin","xframeoptions":"SAMEORIGIN","xssprotection":"1; mode=block"},"shutdownGracePeriod":"10s","tls":{"autoCert":false,"certFile":"server.crt","certKey":"server.key","config":"","enabled":false},"trustCenterCnameTarget":"","writeTimeout":"15s"}` | Server contains the echo server settings |
| openlane.coreConfiguration.server.dev | bool | `false` | Dev enables echo's dev mode options |
| openlane.coreConfiguration.server.listen | string | `":17608"` | Listen sets the listen address to serve the echo server on |
| openlane.coreConfiguration.server.metricsPort | string | `":17609"` | MetricsPort sets the port for the metrics endpoint |
| openlane.coreConfiguration.server.shutdownGracePeriod | string | `"10s"` | ShutdownGracePeriod sets the grace period for in flight requests before shutting down |
| openlane.coreConfiguration.server.readTimeout | string | `"15s"` | ReadTimeout sets the maximum duration for reading the entire request including the body |
| openlane.coreConfiguration.server.writeTimeout | string | `"15s"` | WriteTimeout sets the maximum duration before timing out writes of the response |
| openlane.coreConfiguration.server.idleTimeout | string | `"30s"` | IdleTimeout sets the maximum amount of time to wait for the next request when keep-alives are enabled |
| openlane.coreConfiguration.server.readHeaderTimeout | string | `"2s"` | ReadHeaderTimeout sets the amount of time allowed to read request headers |
| openlane.coreConfiguration.server.tls | object | `{"autoCert":false,"certFile":"server.crt","certKey":"server.key","config":"","enabled":false}` | TLS contains the tls configuration settings |
| openlane.coreConfiguration.server.tls.enabled | bool | `false` | Enabled turns on TLS settings for the server |
| openlane.coreConfiguration.server.tls.certFile | string | `"server.crt"` | CertFile location for the TLS server |
| openlane.coreConfiguration.server.tls.certKey | string | `"server.key"` | CertKey file location for the TLS server |
| openlane.coreConfiguration.server.tls.autoCert | bool | `false` | AutoCert generates the cert with letsencrypt, this does not work on localhost |
| openlane.coreConfiguration.server.cors | object | `{"allowOrigins":[],"cookieInsecure":false,"enabled":true,"prefixes":{}}` | CORS contains settings to allow cross origin settings and insecure cookies |
| openlane.coreConfiguration.server.cors.enabled | bool | `true` | Enable or disable the CORS middleware |
| openlane.coreConfiguration.server.cors.prefixes | object | `{}` | Prefixes is a map of prefixes to allowed origins |
| openlane.coreConfiguration.server.cors.allowOrigins | list | `[]` | AllowOrigins is a list of allowed origins |
| openlane.coreConfiguration.server.cors.cookieInsecure | bool | `false` | CookieInsecure sets the cookie to be insecure |
| openlane.coreConfiguration.server.secure | object | `{"contentsecuritypolicy":"default-src 'self'","contenttypenosniff":"nosniff","cspreportonly":false,"enabled":true,"hstsmaxage":31536000,"hstspreloadenabled":false,"referrerpolicy":"same-origin","xframeoptions":"SAMEORIGIN","xssprotection":"1; mode=block"}` | Secure contains settings for the secure middleware |
| openlane.coreConfiguration.server.secure.enabled | bool | `true` | Enabled indicates if the secure middleware should be enabled |
| openlane.coreConfiguration.server.secure.xssprotection | string | `"1; mode=block"` | XSSProtection is the value to set the X-XSS-Protection header to - default is 1; mode=block |
| openlane.coreConfiguration.server.secure.contenttypenosniff | string | `"nosniff"` | ContentTypeNosniff is the value to set the X-Content-Type-Options header to - default is nosniff |
| openlane.coreConfiguration.server.secure.xframeoptions | string | `"SAMEORIGIN"` | XFrameOptions is the value to set the X-Frame-Options header to - default is SAMEORIGIN |
| openlane.coreConfiguration.server.secure.hstspreloadenabled | bool | `false` | HSTSPreloadEnabled is a boolean to enable HSTS preloading - default is false |
| openlane.coreConfiguration.server.secure.hstsmaxage | int | `31536000` | HSTSMaxAge is the max age to set the HSTS header to - default is 31536000 |
| openlane.coreConfiguration.server.secure.contentsecuritypolicy | string | `"default-src 'self'"` | ContentSecurityPolicy is the value to set the Content-Security-Policy header to - default is default-src 'self' |
| openlane.coreConfiguration.server.secure.referrerpolicy | string | `"same-origin"` | ReferrerPolicy is the value to set the Referrer-Policy header to - default is same-origin |
| openlane.coreConfiguration.server.secure.cspreportonly | bool | `false` | CSPReportOnly is a boolean to enable the Content-Security-Policy-Report-Only header - default is false |
| openlane.coreConfiguration.server.redirects | object | `{"code":0,"enabled":true,"redirects":{}}` | Redirect contains settings for the redirect middleware |
| openlane.coreConfiguration.server.redirects.enabled | bool | `true` | Enabled indicates if the redirect middleware should be enabled |
| openlane.coreConfiguration.server.redirects.redirects | object | `{}` | Redirects is a map of paths to redirect to |
| openlane.coreConfiguration.server.redirects.code | int | `0` | Code is the HTTP status code to use for the redirect |
| openlane.coreConfiguration.server.cacheControl | object | `{"enabled":true,"etagHeaders":[],"noCacheHeaders":{}}` | CacheControl contains settings for the cache control middleware |
| openlane.coreConfiguration.server.cacheControl.noCacheHeaders | object | `{}` | noCacheHeaders is the header <-> match map pair to match in http for entity headers to remove |
| openlane.coreConfiguration.server.cacheControl.etagHeaders | list | `[]` | etagHeaders is the string of entity headers to remove |
| openlane.coreConfiguration.server.mime | object | `{"defaultContentType":"application/data","enabled":true,"mimeTypesFile":""}` | Mime contains settings for the mime middleware |
| openlane.coreConfiguration.server.mime.enabled | bool | `true` | Enabled indicates if the mime middleware should be enabled |
| openlane.coreConfiguration.server.mime.mimeTypesFile | string | `""` | MimeTypesFile is the file to load mime types from |
| openlane.coreConfiguration.server.mime.defaultContentType | string | `"application/data"` | DefaultContentType is the default content type to set if no mime type is found |
| openlane.coreConfiguration.server.graphPool | object | `{"maxWorkers":100}` | GraphPool contains settings for the goroutine pool used by the graph resolvers |
| openlane.coreConfiguration.server.graphPool.maxWorkers | int | `100` | MaxWorkers is the maximum number of workers in the pool |
| openlane.coreConfiguration.server.enableGraphExtensions | bool | `true` | EnableGraphExtensions enables the graph extensions for the graph resolvers |
| openlane.coreConfiguration.server.complexityLimit | int | `100` | ComplexityLimit sets the maximum complexity allowed for a query |
| openlane.coreConfiguration.server.maxResultLimit | int | `100` | MaxResultLimit sets the maximum number of results allowed for a query |
| openlane.coreConfiguration.server.csrfProtection | object | `{"cookie":"ol.csrf-token","cookieDomain":"","cookieHttpOnly":false,"cookiePath":"/","enabled":false,"header":"X-CSRF-Token","sameSite":"Lax","secure":true}` | CSRFProtection enables CSRF protection for the server |
| openlane.coreConfiguration.server.csrfProtection.enabled | bool | `false` | Enabled indicates whether CSRF protection is enabled. |
| openlane.coreConfiguration.server.csrfProtection.header | string | `"X-CSRF-Token"` | Header specifies the header name to look for the CSRF token. |
| openlane.coreConfiguration.server.csrfProtection.cookie | string | `"ol.csrf-token"` | Cookie specifies the cookie name used to store the CSRF token. |
| openlane.coreConfiguration.server.csrfProtection.secure | bool | `true` | Secure sets the Secure flag on the CSRF cookie. |
| openlane.coreConfiguration.server.csrfProtection.sameSite | string | `"Lax"` | SameSite configures the SameSite attribute on the CSRF cookie. Valid values are "Lax", "Strict", "None" and "Default". |
| openlane.coreConfiguration.server.csrfProtection.cookieHttpOnly | bool | `false` | CookieHTTPOnly indicates whether the CSRF cookie is HTTP only. |
| openlane.coreConfiguration.server.csrfProtection.cookieDomain | string | `""` | CookieDomain specifies the domain for the CSRF cookie, default to no domain |
| openlane.coreConfiguration.server.csrfProtection.cookiePath | string | `"/"` | CookiePath specifies the path for the CSRF cookie, default to "/" |
| openlane.coreConfiguration.server.defaultTrustCenterDomain | string | `""` | DefaultTrustCenterDomain is the default domain to use for the trust center if no custom domain is set |
| openlane.coreConfiguration.server.fieldLevelEncryption | object | `{"enabled":false}` | FieldLevelEncryption contains the configuration for field level encryption |
| openlane.coreConfiguration.server.fieldLevelEncryption.enabled | bool | `false` | Enabled indicates whether Tink encryption is enabled |
| openlane.coreConfiguration.server.trustCenterCnameTarget | string | `""` | TrustCenterCnameTarget is the cname target for the trust center Used for mapping the vanity domains to the trust centers |
| openlane.coreConfiguration.entConfig | object | `{"billing":{"bypassEmailDomains":[],"requirePaymentMethod":false},"emailValidation":{"allowedEmailTypes":{"disposable":false,"free":false,"role":false},"enableAutoUpdateDisposable":true,"enableGravatarCheck":true,"enableSMTPCheck":false,"enabled":false},"entityTypes":[],"maxPoolSize":100,"maxSchemaImportSize":262144,"modules":{"enabled":true,"useSandbox":false},"summarizer":{"llm":{"anthropic":{"baseURL":"","betaHeader":"","legacyTextCompletion":false},"cloudflare":{"accountID":"","serverURL":""},"openai":{"organizationID":"","url":""},"provider":"none"},"maximumSentences":10,"type":"lexrank"},"windmill":{"baseURL":"https://app.windmill.dev","defaultTimeout":"30s","enabled":false,"onFailureScript":"","onSuccessScript":"","timezone":"UTC","workspace":""}}` | EntConfig contains the ent configuration used by the ent middleware |
| openlane.coreConfiguration.entConfig.entityTypes | list | `[]` | EntityTypes is the list of entity types to create by default for the organization |
| openlane.coreConfiguration.entConfig.summarizer | object | `{"llm":{"anthropic":{"baseURL":"","betaHeader":"","legacyTextCompletion":false},"cloudflare":{"accountID":"","serverURL":""},"openai":{"organizationID":"","url":""},"provider":"none"},"maximumSentences":10,"type":"lexrank"}` | Summarizer contains configuration for text summarization |
| openlane.coreConfiguration.entConfig.summarizer.type | string | `"lexrank"` | Type specifies the summarization algorithm to use |
| openlane.coreConfiguration.entConfig.summarizer.llm | object | `{"anthropic":{"baseURL":"","betaHeader":"","legacyTextCompletion":false},"cloudflare":{"accountID":"","serverURL":""},"openai":{"organizationID":"","url":""},"provider":"none"}` | LLM contains configuration for large language model based summarization |
| openlane.coreConfiguration.entConfig.summarizer.llm.provider | string | `"none"` | Provider specifies which LLM service to use |
| openlane.coreConfiguration.entConfig.summarizer.llm.anthropic | object | `{"baseURL":"","betaHeader":"","legacyTextCompletion":false}` | Anthropic contains configuration for Anthropic's API |
| openlane.coreConfiguration.entConfig.summarizer.llm.anthropic.betaHeader | string | `""` | BetaHeader specifies the beta API features to enable |
| openlane.coreConfiguration.entConfig.summarizer.llm.anthropic.legacyTextCompletion | bool | `false` | LegacyTextCompletion enables legacy text completion API |
| openlane.coreConfiguration.entConfig.summarizer.llm.anthropic.baseURL | string | `""` | BaseURL specifies the API endpoint |
| openlane.coreConfiguration.entConfig.summarizer.llm.cloudflare | object | `{"accountID":"","serverURL":""}` | Cloudflare contains configuration for Cloudflare's API |
| openlane.coreConfiguration.entConfig.summarizer.llm.cloudflare.accountID | string | `""` | AccountID specifies the Cloudflare account ID |
| openlane.coreConfiguration.entConfig.summarizer.llm.cloudflare.serverURL | string | `""` | ServerURL specifies the API endpoint |
| openlane.coreConfiguration.entConfig.summarizer.llm.openai | object | `{"organizationID":"","url":""}` | OpenAI contains configuration for OpenAI's API |
| openlane.coreConfiguration.entConfig.summarizer.llm.openai.url | string | `""` | URL specifies the API endpoint |
| openlane.coreConfiguration.entConfig.summarizer.llm.openai.organizationID | string | `""` | OrganizationID specifies the OpenAI organization ID |
| openlane.coreConfiguration.entConfig.summarizer.maximumSentences | int | `10` | MaximumSentences specifies the maximum number of sentences in the summary |
| openlane.coreConfiguration.entConfig.windmill | object | `{"baseURL":"https://app.windmill.dev","defaultTimeout":"30s","enabled":false,"onFailureScript":"","onSuccessScript":"","timezone":"UTC","workspace":""}` | Windmill contains configuration for Windmill workflow automation |
| openlane.coreConfiguration.entConfig.windmill.enabled | bool | `false` | Enabled specifies whether Windmill integration is enabled |
| openlane.coreConfiguration.entConfig.windmill.baseURL | string | `"https://app.windmill.dev"` | BaseURL is the base URL of the Windmill instance |
| openlane.coreConfiguration.entConfig.windmill.workspace | string | `""` | Workspace is the Windmill workspace to use |
| openlane.coreConfiguration.entConfig.windmill.defaultTimeout | string | `"30s"` | DefaultTimeout is the default timeout for API requests |
| openlane.coreConfiguration.entConfig.windmill.timezone | string | `"UTC"` | Timezone for scheduled jobs |
| openlane.coreConfiguration.entConfig.windmill.onFailureScript | string | `""` | OnFailureScript script to run when a scheduled job fails |
| openlane.coreConfiguration.entConfig.windmill.onSuccessScript | string | `""` | OnSuccessScript script to run when a scheduled job succeeds |
| openlane.coreConfiguration.entConfig.maxPoolSize | int | `100` | MaxPoolSize is the max pond pool workers that can be used by the ent client |
| openlane.coreConfiguration.entConfig.modules | object | `{"enabled":true,"useSandbox":false}` | Modules contains the configuration for the module system |
| openlane.coreConfiguration.entConfig.modules.enabled | bool | `true` | Enabled indicates whether to check and verify module access |
| openlane.coreConfiguration.entConfig.modules.useSandbox | bool | `false` | UseSandbox indicates whether to use the sandbox catalog for module access checks |
| openlane.coreConfiguration.entConfig.maxSchemaImportSize | int | `262144` | MaxSchemaImportSize is the maximum size allowed for schema imports in bytes |
| openlane.coreConfiguration.entConfig.emailValidation | object | `{"allowedEmailTypes":{"disposable":false,"free":false,"role":false},"enableAutoUpdateDisposable":true,"enableGravatarCheck":true,"enableSMTPCheck":false,"enabled":false}` | EmailValidation contains configuration for email validation |
| openlane.coreConfiguration.entConfig.emailValidation.enabled | bool | `false` | Enabled indicates whether email verification is enabled |
| openlane.coreConfiguration.entConfig.emailValidation.enableAutoUpdateDisposable | bool | `true` | EnableAutoUpdateDisposable indicates whether to automatically update disposable email addresses |
| openlane.coreConfiguration.entConfig.emailValidation.enableGravatarCheck | bool | `true` | EnableGravatarCheck indicates whether to check for Gravatar existence |
| openlane.coreConfiguration.entConfig.emailValidation.enableSMTPCheck | bool | `false` | EnableSMTPCheck indicates whether to check email by smtp |
| openlane.coreConfiguration.entConfig.emailValidation.allowedEmailTypes | object | `{"disposable":false,"free":false,"role":false}` | AllowedEmailTypes defines the allowed email types for verification |
| openlane.coreConfiguration.entConfig.emailValidation.allowedEmailTypes.disposable | bool | `false` | Disposable indicates whether disposable email addresses are allowed |
| openlane.coreConfiguration.entConfig.emailValidation.allowedEmailTypes.free | bool | `false` | Free indicates whether free email addresses are allowed |
| openlane.coreConfiguration.entConfig.emailValidation.allowedEmailTypes.role | bool | `false` | Role indicates whether role-based email addresses are allowed |
| openlane.coreConfiguration.entConfig.billing | object | `{"bypassEmailDomains":[],"requirePaymentMethod":false}` | Billing contains configuration for billing related features |
| openlane.coreConfiguration.entConfig.billing.requirePaymentMethod | bool | `false` | RequirePaymentMethod indicates whether to check if a payment method exists for orgs before they can access some resource |
| openlane.coreConfiguration.entConfig.billing.bypassEmailDomains | list | `[]` | BypassEmailDomains is a list of domains that should be allowed to bypass the checks if RequirePaymentMethod above is enabled |
| openlane.coreConfiguration.auth | object | `{"enabled":true,"providers":{"github":{"clientEndpoint":"","clientId":"","redirectUrl":"/v1/github/callback","scopes":[]},"google":{"clientEndpoint":"","clientId":"","redirectUrl":"/v1/google/callback","scopes":[]},"redirectUrl":"http://localhost:3001/api/auth/callback/theopenlane","webauthn":{"debug":false,"displayName":"","enabled":true,"enforceTimeout":true,"maxDevices":10,"relyingPartyId":"","requestOrigins":[],"timeout":"1m0s"}},"supportedProviders":[],"token":{"accessDuration":"1h0m0s","audience":"","generateKeys":true,"issuer":"","jwksCacheTTL":"5m0s","jwksEndpoint":"","keys":{},"kid":"","redis":{"blacklistPrefix":"token:blacklist:","config":{"address":"localhost:6379","db":0,"dialTimeout":"5s","enabled":true,"maxActiveConns":0,"maxIdleConns":0,"maxRetries":3,"minIdleConns":0,"name":"","password":"","readTimeout":"0s","username":"","writeTimeout":"0s"},"enabled":false},"refreshAudience":"","refreshDuration":"2h0m0s","refreshOverlap":"-15m0s"}}` | Auth contains the authentication token settings and provider(s) |
| openlane.coreConfiguration.auth.enabled | bool | `true` | Enabled authentication on the server, not recommended to disable |
| openlane.coreConfiguration.auth.token | object | `{"accessDuration":"1h0m0s","audience":"","generateKeys":true,"issuer":"","jwksCacheTTL":"5m0s","jwksEndpoint":"","keys":{},"kid":"","redis":{"blacklistPrefix":"token:blacklist:","config":{"address":"localhost:6379","db":0,"dialTimeout":"5s","enabled":true,"maxActiveConns":0,"maxIdleConns":0,"maxRetries":3,"minIdleConns":0,"name":"","password":"","readTimeout":"0s","username":"","writeTimeout":"0s"},"enabled":false},"refreshAudience":"","refreshDuration":"2h0m0s","refreshOverlap":"-15m0s"}` | Token contains the token config settings for the issued tokens |
| openlane.coreConfiguration.auth.supportedProviders | list | `[]` | SupportedProviders are the supported oauth providers that have been configured |
| openlane.coreConfiguration.auth.providers | object | `{"github":{"clientEndpoint":"","clientId":"","redirectUrl":"/v1/github/callback","scopes":[]},"google":{"clientEndpoint":"","clientId":"","redirectUrl":"/v1/google/callback","scopes":[]},"redirectUrl":"http://localhost:3001/api/auth/callback/theopenlane","webauthn":{"debug":false,"displayName":"","enabled":true,"enforceTimeout":true,"maxDevices":10,"relyingPartyId":"","requestOrigins":[],"timeout":"1m0s"}}` | Providers contains supported oauth2 providers configuration |
| openlane.coreConfiguration.auth.providers.redirectUrl | string | `"http://localhost:3001/api/auth/callback/theopenlane"` | RedirectURL is the URL that the OAuth2 client will redirect to after authentication is complete |
| openlane.coreConfiguration.auth.providers.github | object | `{"clientEndpoint":"","clientId":"","redirectUrl":"/v1/github/callback","scopes":[]}` | Github contains the configuration settings for the Github Oauth Provider |
| openlane.coreConfiguration.auth.providers.google | object | `{"clientEndpoint":"","clientId":"","redirectUrl":"/v1/google/callback","scopes":[]}` | Google contains the configuration settings for the Google Oauth Provider |
| openlane.coreConfiguration.auth.providers.webauthn | object | `{"debug":false,"displayName":"","enabled":true,"enforceTimeout":true,"maxDevices":10,"relyingPartyId":"","requestOrigins":[],"timeout":"1m0s"}` | Webauthn contains the configuration settings for the Webauthn Oauth Provider |
| openlane.coreConfiguration.authz | object | `{"createNewModel":false,"credentials":{"audience":"","clientId":"","issuer":"","scopes":""},"enabled":true,"hostUrl":"https://authz.theopenlane.io","modelFile":"fga/model/model.fga","modelId":"","storeId":"","storeName":"openlane"}` | Authz contains the authorization settings for fine grained access control |
| openlane.coreConfiguration.authz.enabled | bool | `true` | enables authorization checks with openFGA |
| openlane.coreConfiguration.authz.storeName | string | `"openlane"` | name of openFGA store |
| openlane.coreConfiguration.authz.hostUrl | string | `"https://authz.theopenlane.io"` | host url with scheme of the openFGA API |
| openlane.coreConfiguration.authz.storeId | string | `""` | id of openFGA store |
| openlane.coreConfiguration.authz.modelId | string | `""` | id of openFGA model |
| openlane.coreConfiguration.authz.createNewModel | bool | `false` | force create a new model |
| openlane.coreConfiguration.authz.modelFile | string | `"fga/model/model.fga"` | path to the fga model file |
| openlane.coreConfiguration.authz.credentials | object | `{"audience":"","clientId":"","issuer":"","scopes":""}` | credentials for the openFGA client |
| openlane.coreConfiguration.authz.credentials.clientId | string | `""` | client id for the openFGA client |
| openlane.coreConfiguration.authz.credentials.audience | string | `""` | audience for the openFGA client |
| openlane.coreConfiguration.authz.credentials.issuer | string | `""` | issuer for the openFGA client |
| openlane.coreConfiguration.authz.credentials.scopes | string | `""` | scopes for the openFGA client |
| openlane.coreConfiguration.db | object | `{"cacheTTL":"1s","databaseName":"openlane","debug":false,"driverName":"pgx","enableHistory":false,"maxConnections":0,"maxIdleConnections":0,"migrationProvider":"atlas","multiWrite":false,"runMigrations":true}` | DB contains the database configuration for the ent client |
| openlane.coreConfiguration.db.debug | bool | `false` | debug enables printing the debug database logs |
| openlane.coreConfiguration.db.databaseName | string | `"openlane"` | the name of the database to use with otel tracing |
| openlane.coreConfiguration.db.driverName | string | `"pgx"` | sql driver name |
| openlane.coreConfiguration.db.multiWrite | bool | `false` | enables writing to two databases simultaneously |
| openlane.coreConfiguration.db.cacheTTL | string | `"1s"` | cache results for subsequent requests |
| openlane.coreConfiguration.db.runMigrations | bool | `true` | run migrations on startup |
| openlane.coreConfiguration.db.migrationProvider | string | `"atlas"` | migration provider to use for running migrations |
| openlane.coreConfiguration.db.enableHistory | bool | `false` | enable history data to be logged to the database |
| openlane.coreConfiguration.db.maxConnections | int | `0` | maximum number of connections to the database |
| openlane.coreConfiguration.db.maxIdleConnections | int | `0` | maximum number of idle connections to the database |
| openlane.coreConfiguration.jobQueue | object | `{"metrics":{"enableMetrics":false,"enableSemanticMetrics":true,"metricsDurationUnit":"ms"},"riverConf":null,"runMigrations":false}` | JobQueue contains the configuration for the job queue (river) client |
| openlane.coreConfiguration.redis | object | `{"address":"localhost:6379","db":0,"dialTimeout":"5s","enabled":true,"maxActiveConns":0,"maxIdleConns":0,"maxRetries":3,"minIdleConns":0,"name":"","password":"","readTimeout":"0s","username":"","writeTimeout":"0s"}` | Redis contains the redis configuration for the key-value store |
| openlane.coreConfiguration.tracer | object | `{"enabled":false,"environment":"development","otlp":{"certificate":"","compression":"","endpoint":"localhost:4317","headers":[],"insecure":true,"timeout":"10s"},"provider":"stdout","stdout":{"disableTimestamp":false,"pretty":true}}` | Tracer contains the tracing config for opentelemetry |
| openlane.coreConfiguration.email | object | `{"companyAddress":"","companyName":"","corporation":"","fromEmail":"","logoURL":"","supportEmail":"","templatesPath":"","urls":{"docs":"","invite":"","product":"","reset":"","root":"","verify":"","verifyBilling":"","verifySubscriber":""},"year":0}` | Email contains email sending configuration for the server |
| openlane.coreConfiguration.sessions | object | `{"domain":"","httpOnly":true,"maxAge":3600,"sameSite":"Strict","secure":true}` | Sessions config for user sessions and cookies |
| openlane.coreConfiguration.totp | object | `{"codeLength":6,"enabled":true,"issuer":"","recoveryCodeCount":16,"recoveryCodeLength":8,"redis":true}` | TOTP contains the configuration for the TOTP provider |
| openlane.coreConfiguration.ratelimit | object | `{"denyMessage":"Too many requests","denyStatus":429,"dryRun":true,"enabled":false,"forwardedIndexFromBehind":0,"headers":["True-Client-IP"],"includeMethod":false,"includePath":false,"keyPrefix":"","options":[{"expiration":"0s","flushInterval":"0s","requests":500,"window":"1m0s"}],"sendRetryAfterHeader":true}` | Ratelimit contains the configuration for the rate limiter |
| openlane.coreConfiguration.ratelimit.options | list | `[{"expiration":"0s","flushInterval":"0s","requests":500,"window":"1m0s"}]` | Options enables configuring multiple concurrent rate windows that must all pass. |
| openlane.coreConfiguration.ratelimit.headers | list | `["True-Client-IP"]` | Headers determines which headers are inspected to determine the origin IP. Defaults to X-Forwarded-For, True-Client-IP, RemoteAddr. |
| openlane.coreConfiguration.ratelimit.forwardedIndexFromBehind | int | `0` | ForwardedIndexFromBehind selects which IP from X-Forwarded-For should be used. 0 means the closest client, 1 the proxy behind it, etc. |
| openlane.coreConfiguration.ratelimit.includePath | bool | `false` | IncludePath appends the request path to the limiter key when true. |
| openlane.coreConfiguration.ratelimit.includeMethod | bool | `false` | IncludeMethod appends the request method to the limiter key when true. |
| openlane.coreConfiguration.ratelimit.keyPrefix | string | `""` | KeyPrefix allows scoping the limiter key space with a static prefix. |
| openlane.coreConfiguration.ratelimit.denyStatus | int | `429` | DenyStatus overrides the HTTP status code returned when a rate limit is exceeded. |
| openlane.coreConfiguration.ratelimit.denyMessage | string | `"Too many requests"` | DenyMessage customises the error payload when a rate limit is exceeded. |
| openlane.coreConfiguration.ratelimit.sendRetryAfterHeader | bool | `true` | SendRetryAfterHeader toggles whether the Retry-After header should be added when available. |
| openlane.coreConfiguration.ratelimit.dryRun | bool | `true` | DryRun enables logging rate limit decisions without blocking requests. |
| openlane.coreConfiguration.objectStorage | object | `{"devMode":false,"enabled":true,"keys":["uploadFile"],"maxMemoryMB":0,"maxSizeMB":0,"providers":{"cloudflareR2":{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""},"database":{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""},"disk":{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""},"gcs":{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""},"s3":{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""}}}` | ObjectStorage contains the configuration for the object storage backend |
| openlane.coreConfiguration.objectStorage.enabled | bool | `true` | Enabled indicates if object storage is enabled |
| openlane.coreConfiguration.objectStorage.keys | list | `["uploadFile"]` | Keys are the form field keys that will be processed for uploads |
| openlane.coreConfiguration.objectStorage.maxSizeMB | int | `0` | MaxSizeMB is the maximum file size allowed in MB |
| openlane.coreConfiguration.objectStorage.maxMemoryMB | int | `0` | MaxMemoryMB is the maximum memory to use for file uploads in MB |
| openlane.coreConfiguration.objectStorage.devMode | bool | `false` | DevMode enables simple file upload handling for local development and testing |
| openlane.coreConfiguration.objectStorage.providers | object | `{"cloudflareR2":{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""},"database":{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""},"disk":{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""},"gcs":{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""},"s3":{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""}}` | Providers contains configuration for each storage provider |
| openlane.coreConfiguration.objectStorage.providers.s3 | object | `{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""}` | S3 provider configuration |
| openlane.coreConfiguration.objectStorage.providers.s3.enabled | bool | `false` | Enabled indicates if this provider is enabled |
| openlane.coreConfiguration.objectStorage.providers.s3.ensureAvailable | bool | `false` | EnsureAvailable enforces provider availability before completing server startup |
| openlane.coreConfiguration.objectStorage.providers.s3.region | string | `""` | Region for cloud providers |
| openlane.coreConfiguration.objectStorage.providers.s3.bucket | string | `""` | Bucket name for cloud providers |
| openlane.coreConfiguration.objectStorage.providers.s3.endpoint | string | `""` | Endpoint for custom endpoints |
| openlane.coreConfiguration.objectStorage.providers.s3.proxyPresignEnabled | bool | `false` | ProxyPresignEnabled toggles proxy-signed download URL generation |
| openlane.coreConfiguration.objectStorage.providers.s3.baseURL | string | `"http://localhost:17608/v1/files"` | BaseURL is the prefix for proxy download URLs (e.g., http://localhost:17608/v1/files). |
| openlane.coreConfiguration.objectStorage.providers.s3.credentials | string | `nil` | Credentials contains the credentials for accessing the provider |
| openlane.coreConfiguration.objectStorage.providers.cloudflareR2 | object | `{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""}` | CloudflareR2 provider configuration |
| openlane.coreConfiguration.objectStorage.providers.cloudflareR2.enabled | bool | `false` | Enabled indicates if this provider is enabled |
| openlane.coreConfiguration.objectStorage.providers.cloudflareR2.ensureAvailable | bool | `false` | EnsureAvailable enforces provider availability before completing server startup |
| openlane.coreConfiguration.objectStorage.providers.cloudflareR2.region | string | `""` | Region for cloud providers |
| openlane.coreConfiguration.objectStorage.providers.cloudflareR2.bucket | string | `""` | Bucket name for cloud providers |
| openlane.coreConfiguration.objectStorage.providers.cloudflareR2.endpoint | string | `""` | Endpoint for custom endpoints |
| openlane.coreConfiguration.objectStorage.providers.cloudflareR2.proxyPresignEnabled | bool | `false` | ProxyPresignEnabled toggles proxy-signed download URL generation |
| openlane.coreConfiguration.objectStorage.providers.cloudflareR2.baseURL | string | `"http://localhost:17608/v1/files"` | BaseURL is the prefix for proxy download URLs (e.g., http://localhost:17608/v1/files). |
| openlane.coreConfiguration.objectStorage.providers.cloudflareR2.credentials | string | `nil` | Credentials contains the credentials for accessing the provider |
| openlane.coreConfiguration.objectStorage.providers.gcs | object | `{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""}` | GCS provider configuration |
| openlane.coreConfiguration.objectStorage.providers.gcs.enabled | bool | `false` | Enabled indicates if this provider is enabled |
| openlane.coreConfiguration.objectStorage.providers.gcs.ensureAvailable | bool | `false` | EnsureAvailable enforces provider availability before completing server startup |
| openlane.coreConfiguration.objectStorage.providers.gcs.region | string | `""` | Region for cloud providers |
| openlane.coreConfiguration.objectStorage.providers.gcs.bucket | string | `""` | Bucket name for cloud providers |
| openlane.coreConfiguration.objectStorage.providers.gcs.endpoint | string | `""` | Endpoint for custom endpoints |
| openlane.coreConfiguration.objectStorage.providers.gcs.proxyPresignEnabled | bool | `false` | ProxyPresignEnabled toggles proxy-signed download URL generation |
| openlane.coreConfiguration.objectStorage.providers.gcs.baseURL | string | `"http://localhost:17608/v1/files"` | BaseURL is the prefix for proxy download URLs (e.g., http://localhost:17608/v1/files). |
| openlane.coreConfiguration.objectStorage.providers.gcs.credentials | string | `nil` | Credentials contains the credentials for accessing the provider |
| openlane.coreConfiguration.objectStorage.providers.disk | object | `{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""}` | Disk provider configuration |
| openlane.coreConfiguration.objectStorage.providers.disk.enabled | bool | `false` | Enabled indicates if this provider is enabled |
| openlane.coreConfiguration.objectStorage.providers.disk.ensureAvailable | bool | `false` | EnsureAvailable enforces provider availability before completing server startup |
| openlane.coreConfiguration.objectStorage.providers.disk.region | string | `""` | Region for cloud providers |
| openlane.coreConfiguration.objectStorage.providers.disk.bucket | string | `""` | Bucket name for cloud providers |
| openlane.coreConfiguration.objectStorage.providers.disk.endpoint | string | `""` | Endpoint for custom endpoints |
| openlane.coreConfiguration.objectStorage.providers.disk.proxyPresignEnabled | bool | `false` | ProxyPresignEnabled toggles proxy-signed download URL generation |
| openlane.coreConfiguration.objectStorage.providers.disk.baseURL | string | `"http://localhost:17608/v1/files"` | BaseURL is the prefix for proxy download URLs (e.g., http://localhost:17608/v1/files). |
| openlane.coreConfiguration.objectStorage.providers.disk.credentials | string | `nil` | Credentials contains the credentials for accessing the provider |
| openlane.coreConfiguration.objectStorage.providers.database | object | `{"baseURL":"http://localhost:17608/v1/files","bucket":"","credentials":null,"enabled":false,"endpoint":"","ensureAvailable":false,"proxyPresignEnabled":false,"region":""}` | Database provider configuration |
| openlane.coreConfiguration.objectStorage.providers.database.enabled | bool | `false` | Enabled indicates if this provider is enabled |
| openlane.coreConfiguration.objectStorage.providers.database.ensureAvailable | bool | `false` | EnsureAvailable enforces provider availability before completing server startup |
| openlane.coreConfiguration.objectStorage.providers.database.region | string | `""` | Region for cloud providers |
| openlane.coreConfiguration.objectStorage.providers.database.bucket | string | `""` | Bucket name for cloud providers |
| openlane.coreConfiguration.objectStorage.providers.database.endpoint | string | `""` | Endpoint for custom endpoints |
| openlane.coreConfiguration.objectStorage.providers.database.proxyPresignEnabled | bool | `false` | ProxyPresignEnabled toggles proxy-signed download URL generation |
| openlane.coreConfiguration.objectStorage.providers.database.baseURL | string | `"http://localhost:17608/v1/files"` | BaseURL is the prefix for proxy download URLs (e.g., http://localhost:17608/v1/files). |
| openlane.coreConfiguration.objectStorage.providers.database.credentials | string | `nil` | Credentials contains the credentials for accessing the provider |
| openlane.coreConfiguration.subscription | object | `{"enabled":false,"stripeBillingPortalSuccessURL":"https://console.theopenlane.io/organization-settings/billing","stripeCancellationReturnURL":"https://console.theopenlane.io/organization-settings/billing","stripeWebhookAPIVersion":"2025-10-29.clover","stripeWebhookDiscardAPIVersion":"","stripeWebhookEvents":[],"stripeWebhookURL":"https://api.theopenlane.io/stripe/webhook"}` | Entitlements contains the configuration for the entitlements service |
| openlane.coreConfiguration.subscription.enabled | bool | `false` | Enabled determines if the entitlements service is enabled |
| openlane.coreConfiguration.subscription.stripeWebhookURL | string | `"https://api.theopenlane.io/stripe/webhook"` | StripeWebhookURL is the URL for the stripe webhook |
| openlane.coreConfiguration.subscription.stripeBillingPortalSuccessURL | string | `"https://console.theopenlane.io/organization-settings/billing"` | StripeBillingPortalSuccessURL |
| openlane.coreConfiguration.subscription.stripeCancellationReturnURL | string | `"https://console.theopenlane.io/organization-settings/billing"` | StripeCancellationReturnURL is the URL for the stripe cancellation return |
| openlane.coreConfiguration.subscription.stripeWebhookEvents | list | `[]` | StripeWebhookEvents is the list of events to register when creating a webhook endpoint |
| openlane.coreConfiguration.subscription.stripeWebhookAPIVersion | string | `"2025-10-29.clover"` | StripeWebhookAPIVersion is the Stripe API version currently accepted by the webhook handler |
| openlane.coreConfiguration.subscription.stripeWebhookDiscardAPIVersion | string | `""` | StripeWebhookDiscardAPIVersion is the Stripe API version to discard during migration |
| openlane.coreConfiguration.keywatcher | object | `{"enabled":false,"externalSecretsIntegration":false,"keyDir":"./keys"}` | Keywatcher contains the configuration for the key watcher that manages JWT signing keys |
| openlane.coreConfiguration.keywatcher.enabled | bool | `false` | Enabled indicates whether the key watcher is enabled |
| openlane.coreConfiguration.keywatcher.keyDir | string | `"./keys"` | KeyDir is the path to the directory containing PEM keys for JWT signing |
| openlane.coreConfiguration.keywatcher.externalSecretsIntegration | bool | `false` | ExternalSecretsIntegration enables integration with external secret management systems (specifically GCP secret manager today) |
| openlane.coreConfiguration.slack | object | `{"newSubscriberMessageFile":"","newUserMessageFile":""}` | Slack contains settings for Slack notifications |
| openlane.coreConfiguration.slack.newSubscriberMessageFile | string | `""` | NewSubscriberMessageFile is the path to the template used for new subscriber notifications |
| openlane.coreConfiguration.slack.newUserMessageFile | string | `""` | NewUserMessageFile is the path to the template used for new user notifications |
| openlane.coreConfiguration.integrationOauthProvider | object | `{"github":{"clientEndpoint":"","clientId":"","scopes":[]},"redirectUrl":"","slack":{"clientEndpoint":"","clientId":"","scopes":[]},"successRedirectUrl":""}` | IntegrationOauthProvider contains the OAuth provider configuration for integrations (separate from auth.providers) |
| openlane.coreConfiguration.integrationOauthProvider.redirectUrl | string | `""` | RedirectURL is the base URL for integration OAuth callbacks |
| openlane.coreConfiguration.integrationOauthProvider.successRedirectUrl | string | `""` | SuccessRedirectURL is the URL to redirect to after successful OAuth integration |
| openlane.coreConfiguration.integrationOauthProvider.github | object | `{"clientEndpoint":"","clientId":"","scopes":[]}` | Github contains the configuration settings for GitHub integrations |
| openlane.coreConfiguration.integrationOauthProvider.github.clientId | string | `""` | ClientID is the OAuth2 client ID |
| openlane.coreConfiguration.integrationOauthProvider.github.clientEndpoint | string | `""` | ClientEndpoint is the base URL for the OAuth endpoints |
| openlane.coreConfiguration.integrationOauthProvider.github.scopes | list | `[]` | Scopes are the OAuth2 scopes to request |
| openlane.coreConfiguration.integrationOauthProvider.slack | object | `{"clientEndpoint":"","clientId":"","scopes":[]}` | Slack contains the configuration settings for Slack integrations |
| openlane.coreConfiguration.integrationOauthProvider.slack.clientId | string | `""` | ClientID is the OAuth2 client ID |
| openlane.coreConfiguration.integrationOauthProvider.slack.clientEndpoint | string | `""` | ClientEndpoint is the base URL for the OAuth endpoints |
| openlane.coreConfiguration.integrationOauthProvider.slack.scopes | list | `[]` | Scopes are the OAuth2 scopes to request |
| openlane.coreConfiguration.externalSecrets.enabled | bool | `true` | Enable external secrets integration |
| openlane.coreConfiguration.externalSecrets.secrets | object | `{"core-auth-providers-github-clientsecret":{"enabled":true,"remoteKey":"core-auth-providers-github-clientsecret","secretKey":"CORE_AUTH_PROVIDERS_GITHUB_CLIENTSECRET"},"core-auth-providers-google-clientsecret":{"enabled":true,"remoteKey":"core-auth-providers-google-clientsecret","secretKey":"CORE_AUTH_PROVIDERS_GOOGLE_CLIENTSECRET"},"core-authz-credentials-apitoken":{"enabled":true,"remoteKey":"core-authz-credentials-apitoken","secretKey":"CORE_AUTHZ_CREDENTIALS_APITOKEN"},"core-authz-credentials-clientsecret":{"enabled":true,"remoteKey":"core-authz-credentials-clientsecret","secretKey":"CORE_AUTHZ_CREDENTIALS_CLIENTSECRET"},"core-db-primarydbsource":{"enabled":true,"remoteKey":"core-db-primarydbsource","secretKey":"CORE_DB_PRIMARYDBSOURCE"},"core-db-secondarydbsource":{"enabled":true,"remoteKey":"core-db-secondarydbsource","secretKey":"CORE_DB_SECONDARYDBSOURCE"},"core-entconfig-windmill-token":{"enabled":true,"remoteKey":"core-entconfig-windmill-token","secretKey":"CORE_ENTCONFIG_WINDMILL_TOKEN"},"core-integrationoauthprovider-github-clientsecret":{"enabled":true,"remoteKey":"core-integrationoauthprovider-github-clientsecret","secretKey":"CORE_INTEGRATIONOAUTHPROVIDER_GITHUB_CLIENTSECRET"},"core-integrationoauthprovider-slack-clientsecret":{"enabled":true,"remoteKey":"core-integrationoauthprovider-slack-clientsecret","secretKey":"CORE_INTEGRATIONOAUTHPROVIDER_SLACK_CLIENTSECRET"},"core-jobqueue-connectionuri":{"enabled":true,"remoteKey":"core-jobqueue-connectionuri","secretKey":"CORE_JOBQUEUE_CONNECTIONURI"},"core-keywatcher-secretmanager":{"enabled":true,"remoteKey":"core-keywatcher-secretmanager","secretKey":"CORE_KEYWATCHER_SECRETMANAGER"},"core-objectstorage-providers-cloudflarer2-credentials-accesskeyid":{"enabled":true,"remoteKey":"core-objectstorage-providers-cloudflarer2-credentials-accesskeyid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_ACCESSKEYID"},"core-objectstorage-providers-cloudflarer2-credentials-accountid":{"enabled":true,"remoteKey":"core-objectstorage-providers-cloudflarer2-credentials-accountid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_ACCOUNTID"},"core-objectstorage-providers-cloudflarer2-credentials-apitoken":{"enabled":true,"remoteKey":"core-objectstorage-providers-cloudflarer2-credentials-apitoken","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_APITOKEN"},"core-objectstorage-providers-cloudflarer2-credentials-projectid":{"enabled":true,"remoteKey":"core-objectstorage-providers-cloudflarer2-credentials-projectid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_PROJECTID"},"core-objectstorage-providers-cloudflarer2-credentials-secretaccesskey":{"enabled":true,"remoteKey":"core-objectstorage-providers-cloudflarer2-credentials-secretaccesskey","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_SECRETACCESSKEY"},"core-objectstorage-providers-database-credentials-accesskeyid":{"enabled":true,"remoteKey":"core-objectstorage-providers-database-credentials-accesskeyid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_ACCESSKEYID"},"core-objectstorage-providers-database-credentials-accountid":{"enabled":true,"remoteKey":"core-objectstorage-providers-database-credentials-accountid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_ACCOUNTID"},"core-objectstorage-providers-database-credentials-apitoken":{"enabled":true,"remoteKey":"core-objectstorage-providers-database-credentials-apitoken","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_APITOKEN"},"core-objectstorage-providers-database-credentials-projectid":{"enabled":true,"remoteKey":"core-objectstorage-providers-database-credentials-projectid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_PROJECTID"},"core-objectstorage-providers-database-credentials-secretaccesskey":{"enabled":true,"remoteKey":"core-objectstorage-providers-database-credentials-secretaccesskey","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_SECRETACCESSKEY"},"core-objectstorage-providers-disk-credentials-accesskeyid":{"enabled":true,"remoteKey":"core-objectstorage-providers-disk-credentials-accesskeyid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_ACCESSKEYID"},"core-objectstorage-providers-disk-credentials-accountid":{"enabled":true,"remoteKey":"core-objectstorage-providers-disk-credentials-accountid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_ACCOUNTID"},"core-objectstorage-providers-disk-credentials-apitoken":{"enabled":true,"remoteKey":"core-objectstorage-providers-disk-credentials-apitoken","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_APITOKEN"},"core-objectstorage-providers-disk-credentials-projectid":{"enabled":true,"remoteKey":"core-objectstorage-providers-disk-credentials-projectid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_PROJECTID"},"core-objectstorage-providers-disk-credentials-secretaccesskey":{"enabled":true,"remoteKey":"core-objectstorage-providers-disk-credentials-secretaccesskey","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_SECRETACCESSKEY"},"core-objectstorage-providers-gcs-credentials-accesskeyid":{"enabled":true,"remoteKey":"core-objectstorage-providers-gcs-credentials-accesskeyid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_ACCESSKEYID"},"core-objectstorage-providers-gcs-credentials-accountid":{"enabled":true,"remoteKey":"core-objectstorage-providers-gcs-credentials-accountid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_ACCOUNTID"},"core-objectstorage-providers-gcs-credentials-apitoken":{"enabled":true,"remoteKey":"core-objectstorage-providers-gcs-credentials-apitoken","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_APITOKEN"},"core-objectstorage-providers-gcs-credentials-projectid":{"enabled":true,"remoteKey":"core-objectstorage-providers-gcs-credentials-projectid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_PROJECTID"},"core-objectstorage-providers-gcs-credentials-secretaccesskey":{"enabled":true,"remoteKey":"core-objectstorage-providers-gcs-credentials-secretaccesskey","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_SECRETACCESSKEY"},"core-objectstorage-providers-s3-credentials-accesskeyid":{"enabled":true,"remoteKey":"core-objectstorage-providers-s3-credentials-accesskeyid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_ACCESSKEYID"},"core-objectstorage-providers-s3-credentials-accountid":{"enabled":true,"remoteKey":"core-objectstorage-providers-s3-credentials-accountid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_ACCOUNTID"},"core-objectstorage-providers-s3-credentials-apitoken":{"enabled":true,"remoteKey":"core-objectstorage-providers-s3-credentials-apitoken","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_APITOKEN"},"core-objectstorage-providers-s3-credentials-projectid":{"enabled":true,"remoteKey":"core-objectstorage-providers-s3-credentials-projectid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_PROJECTID"},"core-objectstorage-providers-s3-credentials-secretaccesskey":{"enabled":true,"remoteKey":"core-objectstorage-providers-s3-credentials-secretaccesskey","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_SECRETACCESSKEY"},"core-server-fieldlevelencryption-keyset":{"enabled":true,"remoteKey":"core-server-fieldlevelencryption-keyset","secretKey":"CORE_SERVER_FIELDLEVELENCRYPTION_KEYSET"},"core-server-secretmanager":{"enabled":true,"remoteKey":"core-server-secretmanager","secretKey":"CORE_SERVER_SECRETMANAGER"},"core-sessions-encryptionkey":{"enabled":true,"remoteKey":"core-sessions-encryptionkey","secretKey":"CORE_SESSIONS_ENCRYPTIONKEY"},"core-sessions-signingkey":{"enabled":true,"remoteKey":"core-sessions-signingkey","secretKey":"CORE_SESSIONS_SIGNINGKEY"},"core-slack-webhookurl":{"enabled":true,"remoteKey":"core-slack-webhookurl","secretKey":"CORE_SLACK_WEBHOOKURL"},"core-subscription-privatestripekey":{"enabled":true,"remoteKey":"core-subscription-privatestripekey","secretKey":"CORE_SUBSCRIPTION_PRIVATESTRIPEKEY"},"core-subscription-stripewebhooksecret":{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecret","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET"},"core-subscription-stripewebhooksecrets":{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecrets","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRETS"},"core-subscription-stripewebhooksecrets-2025-10-29-clover":{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecrets-2025-10-29-clover","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRETS_2025_10_29_CLOVER"},"core-subscription-stripewebhooksecrets-default":{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecrets-default","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRETS_DEFAULT"},"core-totp-secret":{"enabled":true,"remoteKey":"core-totp-secret","secretKey":"CORE_TOTP_SECRET"}}` | List of external secrets to create |
| openlane.coreConfiguration.externalSecrets.secrets.core-server-secretmanager | object | `{"enabled":true,"remoteKey":"core-server-secretmanager","secretKey":"CORE_SERVER_SECRETMANAGER"}` | core-server-secretmanager secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-server-secretmanager.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-server-secretmanager.secretKey | string | `"CORE_SERVER_SECRETMANAGER"` | Environment variable key for server.secretManager |
| openlane.coreConfiguration.externalSecrets.secrets.core-server-secretmanager.remoteKey | string | `"core-server-secretmanager"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-server-fieldlevelencryption-keyset | object | `{"enabled":true,"remoteKey":"core-server-fieldlevelencryption-keyset","secretKey":"CORE_SERVER_FIELDLEVELENCRYPTION_KEYSET"}` | core-server-fieldlevelencryption-keyset secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-server-fieldlevelencryption-keyset.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-server-fieldlevelencryption-keyset.secretKey | string | `"CORE_SERVER_FIELDLEVELENCRYPTION_KEYSET"` | Environment variable key for server.fieldLevelEncryption.keyset |
| openlane.coreConfiguration.externalSecrets.secrets.core-server-fieldlevelencryption-keyset.remoteKey | string | `"core-server-fieldlevelencryption-keyset"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-entconfig-windmill-token | object | `{"enabled":true,"remoteKey":"core-entconfig-windmill-token","secretKey":"CORE_ENTCONFIG_WINDMILL_TOKEN"}` | core-entconfig-windmill-token secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-entconfig-windmill-token.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-entconfig-windmill-token.secretKey | string | `"CORE_ENTCONFIG_WINDMILL_TOKEN"` | Environment variable key for entConfig.windmill.token |
| openlane.coreConfiguration.externalSecrets.secrets.core-entconfig-windmill-token.remoteKey | string | `"core-entconfig-windmill-token"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-auth-providers-github-clientsecret | object | `{"enabled":true,"remoteKey":"core-auth-providers-github-clientsecret","secretKey":"CORE_AUTH_PROVIDERS_GITHUB_CLIENTSECRET"}` | core-auth-providers-github-clientsecret secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-auth-providers-github-clientsecret.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-auth-providers-github-clientsecret.secretKey | string | `"CORE_AUTH_PROVIDERS_GITHUB_CLIENTSECRET"` | Environment variable key for auth.providers.github.clientSecret |
| openlane.coreConfiguration.externalSecrets.secrets.core-auth-providers-github-clientsecret.remoteKey | string | `"core-auth-providers-github-clientsecret"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-auth-providers-google-clientsecret | object | `{"enabled":true,"remoteKey":"core-auth-providers-google-clientsecret","secretKey":"CORE_AUTH_PROVIDERS_GOOGLE_CLIENTSECRET"}` | core-auth-providers-google-clientsecret secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-auth-providers-google-clientsecret.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-auth-providers-google-clientsecret.secretKey | string | `"CORE_AUTH_PROVIDERS_GOOGLE_CLIENTSECRET"` | Environment variable key for auth.providers.google.clientSecret |
| openlane.coreConfiguration.externalSecrets.secrets.core-auth-providers-google-clientsecret.remoteKey | string | `"core-auth-providers-google-clientsecret"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-authz-credentials-apitoken | object | `{"enabled":true,"remoteKey":"core-authz-credentials-apitoken","secretKey":"CORE_AUTHZ_CREDENTIALS_APITOKEN"}` | core-authz-credentials-apitoken secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-authz-credentials-apitoken.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-authz-credentials-apitoken.secretKey | string | `"CORE_AUTHZ_CREDENTIALS_APITOKEN"` | Environment variable key for authz.credentials.apiToken |
| openlane.coreConfiguration.externalSecrets.secrets.core-authz-credentials-apitoken.remoteKey | string | `"core-authz-credentials-apitoken"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-authz-credentials-clientsecret | object | `{"enabled":true,"remoteKey":"core-authz-credentials-clientsecret","secretKey":"CORE_AUTHZ_CREDENTIALS_CLIENTSECRET"}` | core-authz-credentials-clientsecret secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-authz-credentials-clientsecret.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-authz-credentials-clientsecret.secretKey | string | `"CORE_AUTHZ_CREDENTIALS_CLIENTSECRET"` | Environment variable key for authz.credentials.clientSecret |
| openlane.coreConfiguration.externalSecrets.secrets.core-authz-credentials-clientsecret.remoteKey | string | `"core-authz-credentials-clientsecret"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-db-primarydbsource | object | `{"enabled":true,"remoteKey":"core-db-primarydbsource","secretKey":"CORE_DB_PRIMARYDBSOURCE"}` | core-db-primarydbsource secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-db-primarydbsource.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-db-primarydbsource.secretKey | string | `"CORE_DB_PRIMARYDBSOURCE"` | Environment variable key for db.primaryDbSource |
| openlane.coreConfiguration.externalSecrets.secrets.core-db-primarydbsource.remoteKey | string | `"core-db-primarydbsource"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-db-secondarydbsource | object | `{"enabled":true,"remoteKey":"core-db-secondarydbsource","secretKey":"CORE_DB_SECONDARYDBSOURCE"}` | core-db-secondarydbsource secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-db-secondarydbsource.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-db-secondarydbsource.secretKey | string | `"CORE_DB_SECONDARYDBSOURCE"` | Environment variable key for db.secondaryDbSource |
| openlane.coreConfiguration.externalSecrets.secrets.core-db-secondarydbsource.remoteKey | string | `"core-db-secondarydbsource"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-jobqueue-connectionuri | object | `{"enabled":true,"remoteKey":"core-jobqueue-connectionuri","secretKey":"CORE_JOBQUEUE_CONNECTIONURI"}` | core-jobqueue-connectionuri secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-jobqueue-connectionuri.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-jobqueue-connectionuri.secretKey | string | `"CORE_JOBQUEUE_CONNECTIONURI"` | Environment variable key for jobQueue.connectionURI |
| openlane.coreConfiguration.externalSecrets.secrets.core-jobqueue-connectionuri.remoteKey | string | `"core-jobqueue-connectionuri"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-sessions-signingkey | object | `{"enabled":true,"remoteKey":"core-sessions-signingkey","secretKey":"CORE_SESSIONS_SIGNINGKEY"}` | core-sessions-signingkey secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-sessions-signingkey.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-sessions-signingkey.secretKey | string | `"CORE_SESSIONS_SIGNINGKEY"` | Environment variable key for sessions.signingKey |
| openlane.coreConfiguration.externalSecrets.secrets.core-sessions-signingkey.remoteKey | string | `"core-sessions-signingkey"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-sessions-encryptionkey | object | `{"enabled":true,"remoteKey":"core-sessions-encryptionkey","secretKey":"CORE_SESSIONS_ENCRYPTIONKEY"}` | core-sessions-encryptionkey secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-sessions-encryptionkey.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-sessions-encryptionkey.secretKey | string | `"CORE_SESSIONS_ENCRYPTIONKEY"` | Environment variable key for sessions.encryptionKey |
| openlane.coreConfiguration.externalSecrets.secrets.core-sessions-encryptionkey.remoteKey | string | `"core-sessions-encryptionkey"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-totp-secret | object | `{"enabled":true,"remoteKey":"core-totp-secret","secretKey":"CORE_TOTP_SECRET"}` | core-totp-secret secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-totp-secret.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-totp-secret.secretKey | string | `"CORE_TOTP_SECRET"` | Environment variable key for totp.secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-totp-secret.remoteKey | string | `"core-totp-secret"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-accesskeyid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-s3-credentials-accesskeyid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_ACCESSKEYID"}` | core-objectstorage-providers-s3-credentials-accesskeyid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-accesskeyid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-accesskeyid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_ACCESSKEYID"` | Environment variable key for objectStorage.providers.s3.credentials.accessKeyID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-accesskeyid.remoteKey | string | `"core-objectstorage-providers-s3-credentials-accesskeyid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-secretaccesskey | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-s3-credentials-secretaccesskey","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_SECRETACCESSKEY"}` | core-objectstorage-providers-s3-credentials-secretaccesskey secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-secretaccesskey.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-secretaccesskey.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_SECRETACCESSKEY"` | Environment variable key for objectStorage.providers.s3.credentials.secretAccessKey |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-secretaccesskey.remoteKey | string | `"core-objectstorage-providers-s3-credentials-secretaccesskey"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-projectid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-s3-credentials-projectid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_PROJECTID"}` | core-objectstorage-providers-s3-credentials-projectid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-projectid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-projectid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_PROJECTID"` | Environment variable key for objectStorage.providers.s3.credentials.projectID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-projectid.remoteKey | string | `"core-objectstorage-providers-s3-credentials-projectid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-accountid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-s3-credentials-accountid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_ACCOUNTID"}` | core-objectstorage-providers-s3-credentials-accountid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-accountid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-accountid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_ACCOUNTID"` | Environment variable key for objectStorage.providers.s3.credentials.accountID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-accountid.remoteKey | string | `"core-objectstorage-providers-s3-credentials-accountid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-apitoken | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-s3-credentials-apitoken","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_APITOKEN"}` | core-objectstorage-providers-s3-credentials-apitoken secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-apitoken.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-apitoken.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_S3_CREDENTIALS_APITOKEN"` | Environment variable key for objectStorage.providers.s3.credentials.apiToken |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-s3-credentials-apitoken.remoteKey | string | `"core-objectstorage-providers-s3-credentials-apitoken"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-accesskeyid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-cloudflarer2-credentials-accesskeyid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_ACCESSKEYID"}` | core-objectstorage-providers-cloudflarer2-credentials-accesskeyid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-accesskeyid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-accesskeyid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_ACCESSKEYID"` | Environment variable key for objectStorage.providers.cloudflareR2.credentials.accessKeyID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-accesskeyid.remoteKey | string | `"core-objectstorage-providers-cloudflarer2-credentials-accesskeyid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-secretaccesskey | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-cloudflarer2-credentials-secretaccesskey","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_SECRETACCESSKEY"}` | core-objectstorage-providers-cloudflarer2-credentials-secretaccesskey secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-secretaccesskey.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-secretaccesskey.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_SECRETACCESSKEY"` | Environment variable key for objectStorage.providers.cloudflareR2.credentials.secretAccessKey |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-secretaccesskey.remoteKey | string | `"core-objectstorage-providers-cloudflarer2-credentials-secretaccesskey"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-projectid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-cloudflarer2-credentials-projectid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_PROJECTID"}` | core-objectstorage-providers-cloudflarer2-credentials-projectid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-projectid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-projectid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_PROJECTID"` | Environment variable key for objectStorage.providers.cloudflareR2.credentials.projectID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-projectid.remoteKey | string | `"core-objectstorage-providers-cloudflarer2-credentials-projectid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-accountid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-cloudflarer2-credentials-accountid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_ACCOUNTID"}` | core-objectstorage-providers-cloudflarer2-credentials-accountid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-accountid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-accountid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_ACCOUNTID"` | Environment variable key for objectStorage.providers.cloudflareR2.credentials.accountID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-accountid.remoteKey | string | `"core-objectstorage-providers-cloudflarer2-credentials-accountid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-apitoken | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-cloudflarer2-credentials-apitoken","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_APITOKEN"}` | core-objectstorage-providers-cloudflarer2-credentials-apitoken secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-apitoken.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-apitoken.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_CLOUDFLARER2_CREDENTIALS_APITOKEN"` | Environment variable key for objectStorage.providers.cloudflareR2.credentials.apiToken |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-cloudflarer2-credentials-apitoken.remoteKey | string | `"core-objectstorage-providers-cloudflarer2-credentials-apitoken"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-accesskeyid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-gcs-credentials-accesskeyid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_ACCESSKEYID"}` | core-objectstorage-providers-gcs-credentials-accesskeyid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-accesskeyid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-accesskeyid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_ACCESSKEYID"` | Environment variable key for objectStorage.providers.gcs.credentials.accessKeyID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-accesskeyid.remoteKey | string | `"core-objectstorage-providers-gcs-credentials-accesskeyid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-secretaccesskey | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-gcs-credentials-secretaccesskey","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_SECRETACCESSKEY"}` | core-objectstorage-providers-gcs-credentials-secretaccesskey secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-secretaccesskey.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-secretaccesskey.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_SECRETACCESSKEY"` | Environment variable key for objectStorage.providers.gcs.credentials.secretAccessKey |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-secretaccesskey.remoteKey | string | `"core-objectstorage-providers-gcs-credentials-secretaccesskey"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-projectid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-gcs-credentials-projectid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_PROJECTID"}` | core-objectstorage-providers-gcs-credentials-projectid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-projectid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-projectid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_PROJECTID"` | Environment variable key for objectStorage.providers.gcs.credentials.projectID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-projectid.remoteKey | string | `"core-objectstorage-providers-gcs-credentials-projectid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-accountid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-gcs-credentials-accountid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_ACCOUNTID"}` | core-objectstorage-providers-gcs-credentials-accountid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-accountid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-accountid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_ACCOUNTID"` | Environment variable key for objectStorage.providers.gcs.credentials.accountID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-accountid.remoteKey | string | `"core-objectstorage-providers-gcs-credentials-accountid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-apitoken | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-gcs-credentials-apitoken","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_APITOKEN"}` | core-objectstorage-providers-gcs-credentials-apitoken secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-apitoken.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-apitoken.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_GCS_CREDENTIALS_APITOKEN"` | Environment variable key for objectStorage.providers.gcs.credentials.apiToken |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-gcs-credentials-apitoken.remoteKey | string | `"core-objectstorage-providers-gcs-credentials-apitoken"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-accesskeyid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-disk-credentials-accesskeyid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_ACCESSKEYID"}` | core-objectstorage-providers-disk-credentials-accesskeyid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-accesskeyid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-accesskeyid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_ACCESSKEYID"` | Environment variable key for objectStorage.providers.disk.credentials.accessKeyID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-accesskeyid.remoteKey | string | `"core-objectstorage-providers-disk-credentials-accesskeyid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-secretaccesskey | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-disk-credentials-secretaccesskey","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_SECRETACCESSKEY"}` | core-objectstorage-providers-disk-credentials-secretaccesskey secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-secretaccesskey.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-secretaccesskey.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_SECRETACCESSKEY"` | Environment variable key for objectStorage.providers.disk.credentials.secretAccessKey |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-secretaccesskey.remoteKey | string | `"core-objectstorage-providers-disk-credentials-secretaccesskey"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-projectid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-disk-credentials-projectid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_PROJECTID"}` | core-objectstorage-providers-disk-credentials-projectid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-projectid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-projectid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_PROJECTID"` | Environment variable key for objectStorage.providers.disk.credentials.projectID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-projectid.remoteKey | string | `"core-objectstorage-providers-disk-credentials-projectid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-accountid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-disk-credentials-accountid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_ACCOUNTID"}` | core-objectstorage-providers-disk-credentials-accountid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-accountid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-accountid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_ACCOUNTID"` | Environment variable key for objectStorage.providers.disk.credentials.accountID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-accountid.remoteKey | string | `"core-objectstorage-providers-disk-credentials-accountid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-apitoken | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-disk-credentials-apitoken","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_APITOKEN"}` | core-objectstorage-providers-disk-credentials-apitoken secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-apitoken.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-apitoken.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_DISK_CREDENTIALS_APITOKEN"` | Environment variable key for objectStorage.providers.disk.credentials.apiToken |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-disk-credentials-apitoken.remoteKey | string | `"core-objectstorage-providers-disk-credentials-apitoken"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-accesskeyid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-database-credentials-accesskeyid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_ACCESSKEYID"}` | core-objectstorage-providers-database-credentials-accesskeyid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-accesskeyid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-accesskeyid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_ACCESSKEYID"` | Environment variable key for objectStorage.providers.database.credentials.accessKeyID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-accesskeyid.remoteKey | string | `"core-objectstorage-providers-database-credentials-accesskeyid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-secretaccesskey | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-database-credentials-secretaccesskey","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_SECRETACCESSKEY"}` | core-objectstorage-providers-database-credentials-secretaccesskey secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-secretaccesskey.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-secretaccesskey.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_SECRETACCESSKEY"` | Environment variable key for objectStorage.providers.database.credentials.secretAccessKey |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-secretaccesskey.remoteKey | string | `"core-objectstorage-providers-database-credentials-secretaccesskey"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-projectid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-database-credentials-projectid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_PROJECTID"}` | core-objectstorage-providers-database-credentials-projectid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-projectid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-projectid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_PROJECTID"` | Environment variable key for objectStorage.providers.database.credentials.projectID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-projectid.remoteKey | string | `"core-objectstorage-providers-database-credentials-projectid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-accountid | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-database-credentials-accountid","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_ACCOUNTID"}` | core-objectstorage-providers-database-credentials-accountid secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-accountid.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-accountid.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_ACCOUNTID"` | Environment variable key for objectStorage.providers.database.credentials.accountID |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-accountid.remoteKey | string | `"core-objectstorage-providers-database-credentials-accountid"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-apitoken | object | `{"enabled":true,"remoteKey":"core-objectstorage-providers-database-credentials-apitoken","secretKey":"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_APITOKEN"}` | core-objectstorage-providers-database-credentials-apitoken secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-apitoken.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-apitoken.secretKey | string | `"CORE_OBJECTSTORAGE_PROVIDERS_DATABASE_CREDENTIALS_APITOKEN"` | Environment variable key for objectStorage.providers.database.credentials.apiToken |
| openlane.coreConfiguration.externalSecrets.secrets.core-objectstorage-providers-database-credentials-apitoken.remoteKey | string | `"core-objectstorage-providers-database-credentials-apitoken"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-privatestripekey | object | `{"enabled":true,"remoteKey":"core-subscription-privatestripekey","secretKey":"CORE_SUBSCRIPTION_PRIVATESTRIPEKEY"}` | core-subscription-privatestripekey secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-privatestripekey.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-privatestripekey.secretKey | string | `"CORE_SUBSCRIPTION_PRIVATESTRIPEKEY"` | Environment variable key for subscription.privateStripeKey |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-privatestripekey.remoteKey | string | `"core-subscription-privatestripekey"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecret | object | `{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecret","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET"}` | core-subscription-stripewebhooksecret secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecret.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecret.secretKey | string | `"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET"` | Environment variable key for subscription.stripeWebhookSecret |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecret.remoteKey | string | `"core-subscription-stripewebhooksecret"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecrets | object | `{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecrets","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRETS"}` | core-subscription-stripewebhooksecrets secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecrets.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecrets.secretKey | string | `"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRETS"` | Environment variable key for subscription.stripeWebhookSecrets |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecrets.remoteKey | string | `"core-subscription-stripewebhooksecrets"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecrets-2025-10-29-clover | object | `{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecrets-2025-10-29-clover","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRETS_2025_10_29_CLOVER"}` | core-subscription-stripewebhooksecrets-2025-10-29-clover secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecrets-2025-10-29-clover.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecrets-2025-10-29-clover.secretKey | string | `"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRETS_2025_10_29_CLOVER"` | Environment variable key for subscription.stripeWebhookSecrets.2025-10-29.clover |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecrets-2025-10-29-clover.remoteKey | string | `"core-subscription-stripewebhooksecrets-2025-10-29-clover"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecrets-default | object | `{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecrets-default","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRETS_DEFAULT"}` | core-subscription-stripewebhooksecrets-default secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecrets-default.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecrets-default.secretKey | string | `"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRETS_DEFAULT"` | Environment variable key for subscription.stripeWebhookSecrets.default |
| openlane.coreConfiguration.externalSecrets.secrets.core-subscription-stripewebhooksecrets-default.remoteKey | string | `"core-subscription-stripewebhooksecrets-default"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-keywatcher-secretmanager | object | `{"enabled":true,"remoteKey":"core-keywatcher-secretmanager","secretKey":"CORE_KEYWATCHER_SECRETMANAGER"}` | core-keywatcher-secretmanager secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-keywatcher-secretmanager.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-keywatcher-secretmanager.secretKey | string | `"CORE_KEYWATCHER_SECRETMANAGER"` | Environment variable key for keywatcher.secretManager |
| openlane.coreConfiguration.externalSecrets.secrets.core-keywatcher-secretmanager.remoteKey | string | `"core-keywatcher-secretmanager"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-slack-webhookurl | object | `{"enabled":true,"remoteKey":"core-slack-webhookurl","secretKey":"CORE_SLACK_WEBHOOKURL"}` | core-slack-webhookurl secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-slack-webhookurl.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-slack-webhookurl.secretKey | string | `"CORE_SLACK_WEBHOOKURL"` | Environment variable key for slack.webhookURL |
| openlane.coreConfiguration.externalSecrets.secrets.core-slack-webhookurl.remoteKey | string | `"core-slack-webhookurl"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-integrationoauthprovider-github-clientsecret | object | `{"enabled":true,"remoteKey":"core-integrationoauthprovider-github-clientsecret","secretKey":"CORE_INTEGRATIONOAUTHPROVIDER_GITHUB_CLIENTSECRET"}` | core-integrationoauthprovider-github-clientsecret secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-integrationoauthprovider-github-clientsecret.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-integrationoauthprovider-github-clientsecret.secretKey | string | `"CORE_INTEGRATIONOAUTHPROVIDER_GITHUB_CLIENTSECRET"` | Environment variable key for integrationOauthProvider.github.clientSecret |
| openlane.coreConfiguration.externalSecrets.secrets.core-integrationoauthprovider-github-clientsecret.remoteKey | string | `"core-integrationoauthprovider-github-clientsecret"` | Remote key in GCP Secret Manager |
| openlane.coreConfiguration.externalSecrets.secrets.core-integrationoauthprovider-slack-clientsecret | object | `{"enabled":true,"remoteKey":"core-integrationoauthprovider-slack-clientsecret","secretKey":"CORE_INTEGRATIONOAUTHPROVIDER_SLACK_CLIENTSECRET"}` | core-integrationoauthprovider-slack-clientsecret secret configuration |
| openlane.coreConfiguration.externalSecrets.secrets.core-integrationoauthprovider-slack-clientsecret.enabled | bool | `true` | Enable this external secret |
| openlane.coreConfiguration.externalSecrets.secrets.core-integrationoauthprovider-slack-clientsecret.secretKey | string | `"CORE_INTEGRATIONOAUTHPROVIDER_SLACK_CLIENTSECRET"` | Environment variable key for integrationOauthProvider.slack.clientSecret |
| openlane.coreConfiguration.externalSecrets.secrets.core-integrationoauthprovider-slack-clientsecret.remoteKey | string | `"core-integrationoauthprovider-slack-clientsecret"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets | object | `{"enabled":true,"secrets":{"core-entconfig-summarizer-llm-gemini-credentialsjson":{"enabled":true,"remoteKey":"core-entconfig-summarizer-llm-gemini-credentialsjson","secretKey":"CORE_ENTCONFIG_SUMMARIZER_LLM_GEMINI_CREDENTIALSJSON"},"core-keywatcher-secretmanager":{"enabled":true,"remoteKey":"core-keywatcher-secretmanager","secretKey":"CORE_KEYWATCHER_SECRETMANAGER"},"core-objectstorage-accesskey":{"enabled":true,"remoteKey":"core-objectstorage-accesskey","secretKey":"CORE_OBJECTSTORAGE_ACCESSKEY"},"core-objectstorage-credentialsjson":{"enabled":true,"remoteKey":"core-objectstorage-credentialsjson","secretKey":"CORE_OBJECTSTORAGE_CREDENTIALSJSON"},"core-objectstorage-secretkey":{"enabled":true,"remoteKey":"core-objectstorage-secretkey","secretKey":"CORE_OBJECTSTORAGE_SECRETKEY"},"core-server-secretmanager":{"enabled":true,"remoteKey":"core-server-secretmanager","secretKey":"CORE_SERVER_SECRETMANAGER"},"core-slack-webhookurl":{"enabled":true,"remoteKey":"core-slack-webhookurl","secretKey":"CORE_SLACK_WEBHOOKURL"},"core-subscription-privatestripekey":{"enabled":true,"remoteKey":"core-subscription-privatestripekey","secretKey":"CORE_SUBSCRIPTION_PRIVATESTRIPEKEY"},"core-subscription-stripewebhooksecret":{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecret","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET"}}}` | External Secrets configuration |
| openlane.externalSecrets.enabled | bool | `true` | Enable external secrets integration |
| openlane.externalSecrets.secrets | object | `{"core-entconfig-summarizer-llm-gemini-credentialsjson":{"enabled":true,"remoteKey":"core-entconfig-summarizer-llm-gemini-credentialsjson","secretKey":"CORE_ENTCONFIG_SUMMARIZER_LLM_GEMINI_CREDENTIALSJSON"},"core-keywatcher-secretmanager":{"enabled":true,"remoteKey":"core-keywatcher-secretmanager","secretKey":"CORE_KEYWATCHER_SECRETMANAGER"},"core-objectstorage-accesskey":{"enabled":true,"remoteKey":"core-objectstorage-accesskey","secretKey":"CORE_OBJECTSTORAGE_ACCESSKEY"},"core-objectstorage-credentialsjson":{"enabled":true,"remoteKey":"core-objectstorage-credentialsjson","secretKey":"CORE_OBJECTSTORAGE_CREDENTIALSJSON"},"core-objectstorage-secretkey":{"enabled":true,"remoteKey":"core-objectstorage-secretkey","secretKey":"CORE_OBJECTSTORAGE_SECRETKEY"},"core-server-secretmanager":{"enabled":true,"remoteKey":"core-server-secretmanager","secretKey":"CORE_SERVER_SECRETMANAGER"},"core-slack-webhookurl":{"enabled":true,"remoteKey":"core-slack-webhookurl","secretKey":"CORE_SLACK_WEBHOOKURL"},"core-subscription-privatestripekey":{"enabled":true,"remoteKey":"core-subscription-privatestripekey","secretKey":"CORE_SUBSCRIPTION_PRIVATESTRIPEKEY"},"core-subscription-stripewebhooksecret":{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecret","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET"}}` | List of external secrets to create |
| openlane.externalSecrets.secrets.core-server-secretmanager | object | `{"enabled":true,"remoteKey":"core-server-secretmanager","secretKey":"CORE_SERVER_SECRETMANAGER"}` | core-server-secretmanager secret configuration |
| openlane.externalSecrets.secrets.core-server-secretmanager.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-server-secretmanager.secretKey | string | `"CORE_SERVER_SECRETMANAGER"` | Environment variable key for server.secretManager |
| openlane.externalSecrets.secrets.core-server-secretmanager.remoteKey | string | `"core-server-secretmanager"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-entconfig-summarizer-llm-gemini-credentialsjson | object | `{"enabled":true,"remoteKey":"core-entconfig-summarizer-llm-gemini-credentialsjson","secretKey":"CORE_ENTCONFIG_SUMMARIZER_LLM_GEMINI_CREDENTIALSJSON"}` | core-entconfig-summarizer-llm-gemini-credentialsjson secret configuration |
| openlane.externalSecrets.secrets.core-entconfig-summarizer-llm-gemini-credentialsjson.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-entconfig-summarizer-llm-gemini-credentialsjson.secretKey | string | `"CORE_ENTCONFIG_SUMMARIZER_LLM_GEMINI_CREDENTIALSJSON"` | Environment variable key for entConfig.summarizer.llm.gemini.credentialsJSON |
| openlane.externalSecrets.secrets.core-entconfig-summarizer-llm-gemini-credentialsjson.remoteKey | string | `"core-entconfig-summarizer-llm-gemini-credentialsjson"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-objectstorage-accesskey | object | `{"enabled":true,"remoteKey":"core-objectstorage-accesskey","secretKey":"CORE_OBJECTSTORAGE_ACCESSKEY"}` | core-objectstorage-accesskey secret configuration |
| openlane.externalSecrets.secrets.core-objectstorage-accesskey.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-objectstorage-accesskey.secretKey | string | `"CORE_OBJECTSTORAGE_ACCESSKEY"` | Environment variable key for objectStorage.accessKey |
| openlane.externalSecrets.secrets.core-objectstorage-accesskey.remoteKey | string | `"core-objectstorage-accesskey"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-objectstorage-secretkey | object | `{"enabled":true,"remoteKey":"core-objectstorage-secretkey","secretKey":"CORE_OBJECTSTORAGE_SECRETKEY"}` | core-objectstorage-secretkey secret configuration |
| openlane.externalSecrets.secrets.core-objectstorage-secretkey.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-objectstorage-secretkey.secretKey | string | `"CORE_OBJECTSTORAGE_SECRETKEY"` | Environment variable key for objectStorage.secretKey |
| openlane.externalSecrets.secrets.core-objectstorage-secretkey.remoteKey | string | `"core-objectstorage-secretkey"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-objectstorage-credentialsjson | object | `{"enabled":true,"remoteKey":"core-objectstorage-credentialsjson","secretKey":"CORE_OBJECTSTORAGE_CREDENTIALSJSON"}` | core-objectstorage-credentialsjson secret configuration |
| openlane.externalSecrets.secrets.core-objectstorage-credentialsjson.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-objectstorage-credentialsjson.secretKey | string | `"CORE_OBJECTSTORAGE_CREDENTIALSJSON"` | Environment variable key for objectStorage.credentialsJSON |
| openlane.externalSecrets.secrets.core-objectstorage-credentialsjson.remoteKey | string | `"core-objectstorage-credentialsjson"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-subscription-privatestripekey | object | `{"enabled":true,"remoteKey":"core-subscription-privatestripekey","secretKey":"CORE_SUBSCRIPTION_PRIVATESTRIPEKEY"}` | core-subscription-privatestripekey secret configuration |
| openlane.externalSecrets.secrets.core-subscription-privatestripekey.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-subscription-privatestripekey.secretKey | string | `"CORE_SUBSCRIPTION_PRIVATESTRIPEKEY"` | Environment variable key for subscription.privateStripeKey |
| openlane.externalSecrets.secrets.core-subscription-privatestripekey.remoteKey | string | `"core-subscription-privatestripekey"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-subscription-stripewebhooksecret | object | `{"enabled":true,"remoteKey":"core-subscription-stripewebhooksecret","secretKey":"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET"}` | core-subscription-stripewebhooksecret secret configuration |
| openlane.externalSecrets.secrets.core-subscription-stripewebhooksecret.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-subscription-stripewebhooksecret.secretKey | string | `"CORE_SUBSCRIPTION_STRIPEWEBHOOKSECRET"` | Environment variable key for subscription.stripeWebhookSecret |
| openlane.externalSecrets.secrets.core-subscription-stripewebhooksecret.remoteKey | string | `"core-subscription-stripewebhooksecret"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-keywatcher-secretmanager | object | `{"enabled":true,"remoteKey":"core-keywatcher-secretmanager","secretKey":"CORE_KEYWATCHER_SECRETMANAGER"}` | core-keywatcher-secretmanager secret configuration |
| openlane.externalSecrets.secrets.core-keywatcher-secretmanager.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-keywatcher-secretmanager.secretKey | string | `"CORE_KEYWATCHER_SECRETMANAGER"` | Environment variable key for keywatcher.secretManager |
| openlane.externalSecrets.secrets.core-keywatcher-secretmanager.remoteKey | string | `"core-keywatcher-secretmanager"` | Remote key in GCP Secret Manager |
| openlane.externalSecrets.secrets.core-slack-webhookurl | object | `{"enabled":true,"remoteKey":"core-slack-webhookurl","secretKey":"CORE_SLACK_WEBHOOKURL"}` | core-slack-webhookurl secret configuration |
| openlane.externalSecrets.secrets.core-slack-webhookurl.enabled | bool | `true` | Enable this external secret |
| openlane.externalSecrets.secrets.core-slack-webhookurl.secretKey | string | `"CORE_SLACK_WEBHOOKURL"` | Environment variable key for slack.webhookURL |
| openlane.externalSecrets.secrets.core-slack-webhookurl.remoteKey | string | `"core-slack-webhookurl"` | Remote key in GCP Secret Manager |
| podMonitoring.enabled | bool | `true` |  |
| podMonitoring.interval | string | `"30s"` |  |
| podMonitoring.scrapeTimeout | string | `nil` |  |
| podMonitor.enabled | bool | `true` | If `true`, create a PodMonitor resource to support the Prometheus Operator. |
| podMonitor.additionalLabels | object | `{}` | Additional labels for the PodMonitor. |
| podMonitor.annotations | object | `{}` | Annotations to add to the PodMonitor. |
| podMonitor.namespace | string | `nil` | If set create the PodMonitor in an alternate namespace. |
| podMonitor.interval | string | `nil` | Interval at which Prometheus scrapes metrics. |
| podMonitor.scrapeTimeout | string | `nil` | Timeout if metrics cannot be retrieved in given time interval. |
| riverboat.replicaCount | int | `2` |  |
| riverboat.image.repository | string | `"ghcr.io/theopenlane/riverboat"` |  |
| riverboat.image.tag | string | `"amd64-v0.4.3"` |  |
| riverboat.image.pullPolicy | string | `"IfNotPresent"` |  |
| riverboat.secret.create | bool | `false` |  |
| riverboat.secret.name | string | `"riverboat-app-secret"` |  |
| riverboat.secret.annotations | object | `{}` |  |
| riverboat.config.create | bool | `false` |  |
| riverboat.config.name | string | `"riverboat-config"` |  |
| riverboat.config.annotations | object | `{}` |  |
| riverboat.refreshInterval | string | `"10m"` |  |
| riverboat.workers.emailWorker.enabled | bool | `false` |  |
| riverboat.workers.emailWorker.devMode | string | `"false"` |  |
| riverboat.workers.emailWorker.token | string | `""` |  |
| riverboat.workers.emailWorker.fromEmail | string | `"no-reply@mail.theopenlane.io"` |  |
| riverboat.workers.emailWorker.testDir | string | `""` |  |
| riverboat.workers.deleteExportContentWorker.enabled | bool | `false` |  |
| riverboat.workers.deleteExportContentWorker.openlaneAPIHost | string | `""` |  |
| riverboat.workers.deleteExportContentWorker.interval | string | `"30m"` |  |
| riverboat.workers.deleteExportContentWorker.cutoffDuration | string | `"24h"` |  |
| riverboat.workers.exportContentWorker.enabled | bool | `false` |  |
| riverboat.workers.exportContentWorker.openlaneAPIHost | string | `""` |  |
| riverboat.workers.customDomainWorker.enabled | bool | `false` |  |
| riverboat.workers.customDomainWorker.openlaneAPIHost | string | `""` |  |
| riverboat.workers.databaseWorker.enabled | bool | `false` |  |
| riverboat.workers.databaseWorker.baseUrl | string | `""` |  |
| riverboat.workers.databaseWorker.endpoint | string | `"query"` |  |
| riverboat.workers.databaseWorker.debug | bool | `false` |  |
| riverboatui.image.repository | string | `"ghcr.io/riverqueue/riverui"` |  |
| riverboatui.image.tag | string | `"latest"` |  |
| riverboatui.image.pullPolicy | string | `"IfNotPresent"` |  |
| riverboatui.riverDatabaseHost | string | `""` |  |
| riverboatui.servicePort | int | `8080` |  |
| riverboatui.secretName | string | `"riverboatui-app-secret"` |  |

## Update documentation

Each of the charts in this repository has a `README.md` which contains chart-specific instructions or information (non-templated information) and additionally a `HELM.md`. This allows all the benefits of templating to be used in the `HELM.md` while still allowing for chart-specific documentation to be added and not be overridden. The general goal is that all the charts share the same templating configuration so that global functionality / updates can be made and applied to all charts rather than individually managing each chart's documentation via the templating mechanisms.

Chart documentation in the `HELM.md` is generated with [helm-docs](https://github.com/norwoodj/helm-docs) from `values.yaml` file.

After file modification, regenerate README.md with command:

```bash
task docs
```

OR if you want to attempt to run it without task, you can use optionally use the docker image although there is no stock Task provided for this:

```bash
docker run --rm -it -v $(pwd):/helm --workdir /helm jnorwood/helm-docs:v1.14.2 helm-docs
```

Globally updating all charts' documentation can be done by running the following command from the root of the repository:

```bash
task docs
```

## Run linter

To run the linter on this chart, you can use the `ct` tool. This will check for common issues in the chart and ensure it adheres to best practices. You can also run Helm's `lint` and for convenience, the task command below runs both `ct lint` and `helm lint` commands. You can run them individually if you prefer via `task lint:ct` and `task lint:helm`.

You can run both linters with the following command:

```bash
task lint
```

OR if you'd like to run the ct lint process by using a docker image, you can use a command like the following:

```bash
docker run --rm -it -w /charts -v $(pwd)/../../:/charts quay.io/helmpack/chart-testing:v3.12.0 ct lint --charts /charts/charts/openlane --config /charts/charts/openlane/ct.yaml
```
