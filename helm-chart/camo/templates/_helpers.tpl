{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "application.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "application.name" -}}
{{- printf "%s" .Chart.Name | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "deployment.name" -}}
{{- printf "%s" .Values.nameOverride | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "application.labels" -}}
app.kubernetes.io/name: {{ include "deployment.name" . }}
helm.sh/chart: {{ include "application.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
{{- end -}}
