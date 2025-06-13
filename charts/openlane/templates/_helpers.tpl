{{/* Common labels */}}
{{- define "openlane.labels" -}}
{{ include "openlane.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "openlane.name" -}}
{{- default "openlane" .Values.openlane.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Selector labels */}}
{{- define "openlane.selectorLabels" -}}
app.kubernetes.io/name: {{ include "openlane.name" . }}
{{- end }}



{{- define "riverboat.labels" -}}
{{ include "riverboat.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "riverboat.name" -}}
{{- default "riverboat" .Values.riverboat.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Selector labels */}}
{{- define "riverboat.selectorLabels" -}}
app.kubernetes.io/name: {{ include "riverboat.name" . }}
{{- end }}


{{/* Common labels */}}
{{- define "riverboatui.labels" -}}
{{ include "riverboatui.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "riverboatui.name" -}}
{{- default "riverboatui" .Values.riverboatui.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/* Selector labels */}}
{{- define "riverboatui.selectorLabels" -}}
app.kubernetes.io/name: {{ include "riverboatui.name" . }}
{{- end }}
