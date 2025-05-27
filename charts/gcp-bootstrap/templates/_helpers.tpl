# This _helpers.tpl for openlane-gcp-bootstrap chart
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

{{/*
Returns the KCC Namespace name for a given GCP Project's KCC Name.
This K8s namespace is where resources for that GCP Project will be deployed.
*/}}
{{- define "gcp-project-base.k8sNamespace" -}}
{{- $projectKccName := . -}}
{{- printf "%s-ns" ($projectKccName | replace "-" "" | lower) -}}
{{- end -}}