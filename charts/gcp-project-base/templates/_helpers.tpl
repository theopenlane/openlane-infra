{{/* Helper for valid Kubernetes name (kebab-case) */}}
{{- define "kebabcase" -}}
{{- . | lower | replace " " "-" | replace "_" "-" -}}
{{- end -}}

{{/* Helper for getting values from maps, to handle optional keys gracefully */}}
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

{{/* Returns the K8s namespace name for this GCP Project's KCC Name. */}}
{{- define "gcp-project-base.k8sNamespace" -}}
{{- $projectKccName := $.Values.project.name -}}
{{- printf "%s-ns" ($projectKccName | replace "-" "" | lower) -}}
{{- end -}}
