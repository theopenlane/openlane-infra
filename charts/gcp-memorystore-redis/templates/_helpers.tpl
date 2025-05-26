{/*
Generate resource name.
*/}
{- define "gcp-memorystore-redis.name" -}
{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }
{- end }

{/*
Generate full resource name.
*/}
{- define "gcp-memorystore-redis.fullname" -}
{- if .Values.name }
{- .Values.name | trunc 63 | trimSuffix "-" }
{- else }
{- printf "%s-%s" .Release.Name .Chart.Name | trunc 63 | trimSuffix "-" }
{- end }
{- end }

{- define "gcp-memorystore-redis.namespace" -}
{- default .Release.Namespace .Values.namespaceOverride | trunc 63 }
{- end }

{- define "gcp-memorystore-redis.labels" -}
app.kubernetes.io/name: { include "gcp-memorystore-redis.name" . }
app.kubernetes.io/instance: { .Release.Name }
{- if .Chart.AppVersion }
app.kubernetes.io/version: { .Chart.AppVersion | quote }
{- end }
app.kubernetes.io/managed-by: { .Release.Service }
{- end }
