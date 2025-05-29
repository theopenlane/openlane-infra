{{/* --- Helm Template Helpers --- */}}

{{- define "gcp-bootstrap.kebabcase" -}}
{{- . | lower | replace " " "-" | replace "_" "-" -}}
{{- end -}}

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
  WARNING: This deepCopy, when used with 'include', renders a string representation.
  If you need a true map/list variable in the calling template after using this
  with 'include', you'd typically need '... | fromYaml' IF the output of this helper
  was guaranteed to be a valid single YAML document string.
  Given the recursive 'include' calls within this deepCopy, relying on its string
  output for 'fromYaml' can be fragile.
  It's generally safer to use 'merge' for shallow copies of maps or reconstruct
  data structures if deep copies of complex nested objects are needed as variables.
*/}}
{{- define "gcp-bootstrap.deepCopy" -}}
{{- $value := index . 0 -}}
{{- if eq (kindOf $value) "map" -}}
    {{- $copy := dict -}}
    {{- range $k, $v := $value -}}
        {{- $copiedValue := $v -}}
        {{- if eq (kindOf $v) "map" -}}
            {{- $copiedValue = include "gcp-bootstrap.deepCopy" (list $v) -}}
        {{- else if eq (kindOf $v) "slice" -}}
            {{- $copiedValue = include "gcp-bootstrap.deepCopy" (list $v) -}}
        {{- end -}}
        {{- $_ := set $copy $k $copiedValue -}}
    {{- end -}}
    {{- $copy -}}
{{- else if eq (kindOf $value) "slice" -}}
    {{- $copy := list -}}
    {{- range $item := $value -}}
        {{- $copiedItem := $item -}}
        {{- if eq (kindOf $item) "map" -}}
            {{- $copiedItem = include "gcp-bootstrap.deepCopy" (list $item) -}}
        {{- else if eq (kindOf $item) "slice" -}}
            {{- $copiedItem = include "gcp-bootstrap.deepCopy" (list $item) -}}
        {{- end -}}
        {{- $copy = append $copy $copiedItem -}}
    {{- end -}}
    {{- $copy -}}
{{- else -}}
    {{- $value -}}
{{- end -}}
{{- end -}}

{{- define "gcp-bootstrap.kccNsName" -}}
{{- . | replace "-" "" | lower | printf "%s-ns" -}}
{{- end -}}

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
        kms: {{- $globalValues.kms | default dict | toYaml | nindent 10 }}
        commonAppConfig: {{- $globalValues.commonAppConfig | default dict | toYaml | nindent 10 }}
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
          {{- $sharedVpcHostProjectInstance := get $globalValues.projects $sharedVpcHostProjectKey -}}
          {{- $sharedVpcHostBlueprint := get $globalValues $sharedVpcHostProjectInstance.type -}}
          {{- if $sharedVpcHostBlueprint }}
        sharedVpcHostProjectId: {{ include "gcp-bootstrap.gcpProjectId" (dict "projectKey" $sharedVpcHostProjectKey "envName" $envName "ctx" (dict "Values" $globalValues)) | quote }}
          {{- end }}
        {{- end }}
        isSharedVpcHost: {{ $gcpProjectBaseFlags.isSharedVpcHost | default false | toYaml | nindent 10 }}
        isLoggingProject: {{ $gcpProjectBaseFlags.isLoggingProject | default false | toYaml | nindent 10 }}
        isKmsProject: {{ $gcpProjectBaseFlags.isKmsProject | default false | toYaml | nindent 10 }}
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

{{- define "gcp-bootstrap.gcpProjectId" -}}
{{- $projectKey := .projectKey -}}
{{- $envName := .envName -}}
{{- $ctx := .ctx -}}
{{- $projectInstance := get $ctx.Values.projects $projectKey | required (printf "gcp-bootstrap.gcpProjectId: Project key '%s' not found in .Values.projects" $projectKey) -}}
{{- $projectType := $projectInstance.type | required (printf "gcp-bootstrap.gcpProjectId: Project instance '%s' is missing .type attribute" $projectKey) -}}
{{- $projectBlueprint := get $ctx.Values $projectType | required (printf "gcp-bootstrap.gcpProjectId: Project blueprint for type '%s' (from project '%s') not found in .Values" $projectType $projectKey) -}}
{{- if not (and (hasKey $projectBlueprint "project") (hasKey $projectBlueprint.project "name")) -}}
    {{- fail (printf "gcp-bootstrap.gcpProjectId: Blueprint '%s' (for project '%s') is missing 'project.name' definition." $projectType $projectKey ) -}}
{{- end -}}
{{- $blueprintBaseName := $projectBlueprint.project.name -}}
{{- printf "%s-%s" $blueprintBaseName $envName | include "gcp-bootstrap.kebabcase" -}}
{{- end -}}

{{- define "gcp-bootstrap.folderKccName" -}}
{{- .folderKey | include "gcp-bootstrap.kebabcase" -}}
{{- end -}}