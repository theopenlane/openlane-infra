{{/* --- Helm Template Helpers --- */}}

{{/* Converts a string to kebab-case. Example: "My String" -> "my-string" */}}
{{- define "gcp-bootstrap.kebabcase" -}}
{{- . | lower | replace " " "-" | replace "_" "-" -}}
{{- end -}}

{{/*
  Safely gets a key from a map, returning a default value if the key is not present.
  Usage: {{ include "gcp-bootstrap.get" (list $myMap "myKey" "defaultValue") }}
*/}}
{{- define "gcp-bootstrap.get" -}}
{{- $map := index . 0 -}}
{{- $key := index . 1 -}}
{{- $default := index . 2 | default "" -}}
{{- if hasKey $map $key -}}
  {{- index $map $key -}}
{{- else -}}
  {{- $default -}}
{{- end -}}
{{- end -}}

{{/*
  Performs a deep copy of a map or list.
  Usage: {{ $copiedMap := include "gcp-bootstrap.deepCopy" (list $originalMap) | fromYaml }}
*/}}
{{- define "gcp-bootstrap.deepCopy" -}}
{{- $value := index . 0 -}}
{{- if (kindOf $value) eq "map" -}}
    {{- $copy := dict -}}
    {{- range $k, $v := $value -}}
        {{- $copiedValue := $v -}}
        {{- if (kindOf $v) eq "map" -}}
            {{- $copiedValue = include "gcp-bootstrap.deepCopy" (list $v) -}}
        {{- else if (kindOf $v) eq "slice" -}}
            {{- $copiedValue = include "gcp-bootstrap.deepCopy" (list $v) -}}
        {{- end -}}
        {{- $_ := set $copy $k $copiedValue -}}
    {{- end -}}
    {{- $copy -}}
{{- else if (kindOf $value) eq "slice" -}}
    {{- $copy := list -}}
    {{- range $item := $value -}}
        {{- $copiedItem := $item -}}
        {{- if (kindOf $item) eq "map" -}}
            {{- $copiedItem = include "gcp-bootstrap.deepCopy" (list $item) -}}
        {{- else if (kindOf $item) eq "slice" -}}
            {{- $copiedItem = include "gcp-bootstrap.deepCopy" (list $item) -}}
        {{- end -}}
        {{- $copy = append $copy $copiedItem -}}
    {{- end -}}
    {{- $copy -}}
{{- else -}}
    {{- $value -}}
{{- end -}}
{{- end -}}

{{/*
  Generates a Kubernetes namespace name for KCC resources, typically based on a project identifier.
  Example: {{ include "gcp-bootstrap.kccNsName" "my-project" }} -> "myproject-ns"
*/}}
{{- define "gcp-bootstrap.kccNsName" -}}
{{- . | replace "-" "" | lower | printf "%s-ns" -}}
{{- end -}}

{{/*
  Renders an ArgoCD Application manifest for a GCP project managed by the gcp-project-base subchart.
  (Identical to Revision 1)
*/}}
{{- define "gcp-bootstrap.renderArgoProjectApp" -}}
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
  name: {{ $appConfig.appName | include "gcp-bootstrap.kebabcase" }}
  namespace: argocd
  labels:
    app.kubernetes.io/name: {{ $appConfig.appName | include "gcp-bootstrap.kebabcase" }}
    app.kubernetes.io/instance: {{ $envName | default "global" | include "gcp-bootstrap.kebabcase" }}
    app.kubernetes.io/component: gcp-project
    app.kubernetes.io/managed-by: argocd
    app.kubernetes.io/part-of: openlane-infra
    environment: {{ $envName | default "global" }}
    projectType: {{ $appConfig.projectType | default "unknown" | include "gcp-bootstrap.kebabcase" }}
  annotations:
    argocd.argocd.io/sync-wave: "{{ $appConfig.syncWave }}"
spec:
  project: {{ $appConfig.argoProjectName | default $appConfig.appName | include "gcp-bootstrap.kebabcase" }}
  source:
    repoURL: {{ $appConfig.repoURL }}
    targetRevision: HEAD
    path: charts/gcp-project-base
    helm:
      values: |
        project:
{{- $projectConfig | toYaml | nindent 10 }}
        orgId: {{ $globalValues.orgId | quote }}
        billingAccountId: {{ $globalValues.billingAccountId | quote }}
        {{- if $globalValues.commonAppConfig.primaryRegion }}
        primaryRegion: {{ $globalValues.commonAppConfig.primaryRegion | quote }}
        {{- end }}
        kms: {{ $globalValues.kms | default dict | toYaml | nindent 8 }}
        commonAppConfig: {{ $globalValues.commonAppConfig | default dict | toYaml | nindent 8 }}
        envName: {{ $envName | quote }}
        envCapitalizedName: {{ $envCapName | quote }}
        {{- $sharedVpcHostProjectKey := "" }}
        {{- range $key, $p_loop := $globalValues.projects }}
          {{- if eq $p_loop.type "sharedVpcHost" }}
            {{- $sharedVpcHostProjectKey = $key -}}
            {{- break -}}
          {{- end }}
        {{- end }}
        {{- if $sharedVpcHostProjectKey }}
          {{- $sharedVpcHostProjectInstance := include "gcp-bootstrap.getProjectInstanceConfig" (dict "projectKey" $sharedVpcHostProjectKey "ctx" (dict "Values" $globalValues)) | fromYaml -}}
          {{- $sharedVpcHostBlueprint := get $globalValues $sharedVpcHostProjectInstance.type -}}
          {{- if $sharedVpcHostBlueprint }}
        sharedVpcHostProjectId: {{ include "gcp-bootstrap.gcpProjectId" (dict "projectKey" $sharedVpcHostProjectKey "envName" $envName "ctx" (dict "Values" $globalValues)) | quote }}
          {{- end }}
        {{- end }}
        isSharedVpcHost: {{ $gcpProjectBaseFlags.isSharedVpcHost | default false | toYaml | nindent 8 }}
        isLoggingProject: {{ $gcpProjectBaseFlags.isLoggingProject | default false | toYaml | nindent 8 }}
        isKmsProject: {{ $gcpProjectBaseFlags.isKmsProject | default false | toYaml | nindent 8 }}
{{- if $resourceConfigs }}
{{- range $resourceKey, $resourceVal := $resourceConfigs }}
        {{ $resourceKey }}:
{{- $resourceVal | toYaml | nindent 10 }}
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
{{- end -}}

{{/*
  Derives the actual GCP Project ID.
  Revision 2: Forms ID, e.g., "project_id_prefix-blueprint_base_name" (e.g., "openlane-shared-vpc-host"). NO env suffix.
*/}}
{{- define "gcp-bootstrap.gcpProjectId" -}}
{{- $projectKey := .projectKey -}}
{{- $ctx := .ctx -}}
{{- $projectInstance := include "gcp-bootstrap.getProjectInstanceConfig" (dict "projectKey" $projectKey "ctx" $ctx) | fromYaml -}}
{{- $projectType := $projectInstance.type -}}
{{- $projectBlueprint := get $ctx.Values $projectType -}}
{{- if not (and (hasKey $projectBlueprint "project") (hasKey $projectBlueprint.project "name")) -}}
    {{- fail (printf "gcp-bootstrap.gcpProjectId: Blueprint '%s' (for project '%s') is missing 'project.name' definition." $projectType $projectKey ) -}}
{{- end -}}
{{- $blueprintBaseName := $projectBlueprint.project.name -}}
{{- $prefix := $ctx.Values.projectCreation.project_id_prefix | default "openlane" -}}
{{- printf "%s-%s" $prefix $blueprintBaseName | include "gcp-bootstrap.kebabcase" -}}
{{- end -}}

{{/*
  Gets the KCC Folder Resource Name (metadata.name for KCC Folder resource).
  (Identical to Revision 1)
*/}}
{{- define "gcp-bootstrap.folderKccName" -}}
{{- .folderKey | include "gcp-bootstrap.kebabcase" -}}
{{- end -}}

{{/*
  Gets a project's instance configuration map from .Values.projects.
  (Identical to Revision 1)
*/}}
{{- define "gcp-bootstrap.getProjectInstanceConfig" -}}
{{- $projectKey := .projectKey -}}
{{- $ctx := .ctx -}}
{{- if not (hasKey $ctx.Values.projects $projectKey) -}}
  {{- fail (printf "Project instance with key '%s' not found in .Values.projects." $projectKey) -}}
{{- end -}}
{{- get $ctx.Values.projects $projectKey -}}
{{- end -}}