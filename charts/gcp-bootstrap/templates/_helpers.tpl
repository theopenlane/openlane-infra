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
{{- end -}}

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
{{- end -}}

{{/* Returns the KCC Namespace name for a given GCP Project's KCC Name. */}}
{{- define "gcp-project-base.k8sNamespace" -}}
{{- . | replace "-" "" | lower -}}
{{- printf "%s-ns" . -}}
{{- end -}}

{{- define "bootstrap.renderProjectApp" -}}
{{- $appConfig := . -}}
{{- $projectConfig := .projectConfig -}}
{{- $envName := .envName -}}
{{- $envCapName := .envCapName -}}
{{- $globalValues := .globalValues -}}
{{- $gcpProjectBaseFlags := .gcpProjectBaseFlags -}}
{{- $resourceConfigs := .resourceConfigs -}}

apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: {{ $appConfig.appName | kebabcase }}
  namespace: argocd
  labels:
    app.kubernetes.io/name: {{ $appConfig.appName | kebabcase }}
    app.kubernetes.io/instance: {{ $envName | default "global" | kebabcase }}
    app.kubernetes.io/component: gcp-project
    app.kubernetes.io/managed-by: argocd
    app.kubernetes.io/part-of: openlane-infra
    environment: {{ $envName | default "global" }}
    projectType: {{ $appConfig.projectType | default "unknown" | kebabcase }}
  annotations:
    argocd.argocd.io/sync-wave: "{{ $appConfig.syncWave }}"
spec:
  project: {{ $appConfig.appName | kebabcase }}
  source:
    repoURL: {{ $appConfig.repoURL }}
    targetRevision: HEAD
    path: charts/gcp-project-base
    helm:
      values: |
        project:
{{- if $projectConfig }}
{{ $projectConfig | toYaml | nindent 10 }}
{{- else }}
{{- "{}" | nindent 10 }}
{{- end }}
        orgId: {{ $globalValues.orgId | toYaml | nindent 8 }}
        billingAccountId: {{ $globalValues.billingAccountId | toYaml | nindent 8 }}
        primaryRegion: {{ $globalValues.primaryRegion | toYaml | nindent 8 }}
        folders: {{ ($globalValues.folders | default dict) | toYaml | nindent 8 }}
        kms: {{ ($globalValues.kms | default dict) | toYaml | nindent 8 }}
        commonAppConfig: {{ ($globalValues.commonAppConfig | default dict) | toYaml | nindent 8 }}
        envName: {{ $envName | toYaml | nindent 8 }}
        envCapitalizedName: {{ $envCapName | toYaml | nindent 8 }}
        {{- if $globalValues.sharedVpcHostDev }}
        sharedVpcHostDev: {{ ($globalValues.sharedVpcHostDev | default dict) | toYaml | nindent 8 }}
        {{- end }}
        {{- if $globalValues.sharedVpcHostProd }}
        sharedVpcHostProd: {{ ($globalValues.sharedVpcHostProd | default dict) | toYaml | nindent 8 }}
        {{- end }}
        isSharedVpcHost: {{ ($gcpProjectBaseFlags.isSharedVpcHost | default false) | toYaml | nindent 8 }}
        isLoggingProject: {{ ($gcpProjectBaseFlags.isLoggingProject | default false) | toYaml | nindent 8 }}
{{- if $resourceConfigs }}
{{- range $resourceKey, $resourceVal := $resourceConfigs }}
        {{ $resourceKey }}:
{{- if $resourceVal }}
{{ $resourceVal | toYaml | nindent 10 }}
{{- else }}
{{ "{}" | nindent 10 }} 
{{- end }}
{{- end }}
{{- end }}
  destination:
    server: https://kubernetes.default.svc
    namespace: config-connector
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
    syncOptions:
      - CreateNamespace=false
      - ApplyOutOfSyncOnly=true
{{- end }}