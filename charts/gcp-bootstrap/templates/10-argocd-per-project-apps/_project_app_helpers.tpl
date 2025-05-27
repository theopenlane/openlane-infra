{{/*
_project_app_helpers.tpl
Renders an ArgoCD Application CR for a specific project instance.
*/}}
{{/* Basic Kubernetes name formatting */}}
{{- define "kebabcase" -}}
{{- . | lower | replace " " "-" | replace "_" "-" -}}
{{- end -}}

{{/* Safely get key from map with default */}}
{{- define "get" -}}
{{- $map := index . 0 -}}
{{- $key := index . 1 -}}
{{- $default := index . 2 | default "" -}}
{{- if hasKey $map $key -}}
  {{- index $map $key -}}
{{- else -}}
  {{- $default -}}
{{- end -}}
{{- end }}

{{/* Deep copy a map or list */}}
{{- define "deepCopy" -}}
{{- $value := index . 0 -}}
{{- if (kindOf $value) eq "map" -}}
    {{- $copy := dict -}}
    {{- range $k, $v := $value -}}
        {{- $copiedValue := $v -}}
        {{- if (kindOf $v) eq "map" -}}
            {{- $copiedValue = include "deepCopy" (list $v) -}}
        {{- else if (kindOf $v) eq "slice" -}}
            {{- $copiedValue = include "deepCopy" (list $v) -}}
        {{- end -}}
        {{- $_ := set $copy $k $copiedValue -}}
    {{- end -}}
    {{- $copy -}}
{{- else if (kindOf $value) eq "slice" -}}
    {{- $copy := list -}}
    {{- range $item := $value -}}
        {{- $copiedItem := $item -}}
        {{- if (kindOf $item) eq "map" -}}
            {{- $copiedItem = include "deepCopy" (list $item) -}}
        {{- else if (kindOf $item) eq "slice" -}}
            {{- $copiedItem = include "deepCopy" (list $item) -}}
        {{- end -}}
        {{- $copy = append $copy $copiedItem -}}
    {{- end -}}
    {{- $copy -}}
{{- else -}}
    {{- $value -}}
{{- end -}}
{{- end }}

{{- define "bootstrap.renderProjectApp" -}}
{{- $appConfig := . -}}         # Contains appName, repoURL, syncWave, projectConfig, envName, envCapName, globalValues
{{- $projectConfig := .projectConfig -}} # Specific project config for gcp-project-base
{{- $envName := .envName -}} # Environment name (e.g., "dev", "prod")
{{- $envCapName := .envCapName -}} # Capitalized env name (e.g., "Dev", "Prod")
{{- $globalValues := .globalValues -}} # Top-level values (includes orgId, billingAccountId, kms, etc.)
{{- $gcpProjectBaseFlags := .gcpProjectBaseFlags -}} # Flags like isSharedVpcHost, isLoggingProject
{{- $resourceConfigs := .resourceConfigs -}} # Collection of resource-level configs (gkeCluster, bigqueryDataset, etc.)

apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: {{ $appConfig.appName | kebabcase }} # Ensure valid Kubernetes name
  namespace: argocd # ArgoCD project namespace
  labels:
    app.kubernetes.io/name: {{ $appConfig.appName | kebabcase }}
    app.kubernetes.io/instance: {{ $envName | default "global" | kebabcase }}
    app.kubernetes.io/component: gcp-project
    app.kubernetes.io/managed-by: argocd
    app.kubernetes.io/part-of: openlane-infra
    environment: {{ $envName | default "global" }}
    projectType: {{ $appConfig.projectType | default "unknown" | kebabcase }}
  annotations:
    argocd.argoproj.io/sync-wave: "{{ $appConfig.syncWave }}"
spec:
  project: {{ $appConfig.appName | kebabcase }} # Each App gets its own AppProject (name must match metadata.name)
  source:
    repoURL: {{ $appConfig.repoURL }}
    targetRevision: HEAD
    path: charts/gcp-project-base # Path to the gcp-project-base chart
    helm:
      values: |
        # === Project-level configuration (becomes .Values.project in gcp-project-base) ===
        project:
{{ $projectConfig | toYaml | nindent 10 }} # Indent by 10 spaces to align with 'project:'

        # === Global Values Passed from Bootstrap Chart ===
        orgId: {{ $globalValues.orgId | toYaml | nindent 8 }}
        billingAccountId: {{ $globalValues.billingAccountId | toYaml | nindent 8 }}
        primaryRegion: {{ $globalValues.primaryRegion | toYaml | nindent 8 }}
        folders: {{ $globalValues.folders | toYaml | nindent 8 }}
        kms: {{ $globalValues.kms | toYaml | nindent 8 }}
        commonAppConfig: {{ $globalValues.commonAppConfig | toYaml | nindent 8 }}

        # Explicitly pass environment context (for resource naming/conditional logic)
        envName: {{ $envName | toYaml | nindent 8 }}
        envCapitalizedName: {{ $envCapName | toYaml | nindent 8 }}

        # Pass Shared VPC context (full objects passed down for reference)
        # Check if attribute exists before using toYaml and protect with default dict to prevent nil issues.
        {{- if $globalValues.sharedVpcHostDev }}
        sharedVpcHostDev: {{ ($globalValues.sharedVpcHostDev | default dict) | toYaml | nindent 8 }}
        {{- end }}
        {{- if $globalValues.sharedVpcHostProd }}
        sharedVpcHostProd: {{ ($globalValues.sharedVpcHostProd | default dict) | toYaml | nindent 8 }}
        {{- end }}

        # === Flags for gcp-project-base ===
        # These are simple boolean/string values, typically no need for toYaml, unless they might be complex types.
        # But using it for consistency or if passed value might be complex is fine.
        isSharedVpcHost: {{ $gcpProjectBaseFlags.isSharedVpcHost | toYaml | nindent 8 }}
        isLoggingProject: {{ $gcpProjectBaseFlags.isLoggingProject | toYaml | nindent 8 }}

        # === RESOURCE-SPECIFIC CONFIGURATION ===
        # These are components that gcp-project-base will instantiate, based on its dependencies.
        # Each part will be a key (e.g., gkeCluster, bigqueryDataset).
{{- range $resourceKey, $resourceVal := $resourceConfigs }}
        {{ $resourceKey }}:
{{ $resourceVal | toYaml | nindent 10 }} # Indent two more than the key itself
{{- end }}

  destination:
    server: https://kubernetes.default.svc
    namespace: config-connector # KCC Project CR will be created here
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=false # KCC namespaces are created by gcp-project-base
      - ApplyOutOfSyncOnly=true # Recommended for performance
{{- end }}