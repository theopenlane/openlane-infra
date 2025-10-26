{{- define "trustcenter.name" -}}
{{- default "trustcenter" .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "trustcenter.selectorLabels" -}}
app.kubernetes.io/name: {{ include "trustcenter.name" . }}
{{- end }}

{{- define "trustcenter.labels" -}}
{{ include "trustcenter.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}
