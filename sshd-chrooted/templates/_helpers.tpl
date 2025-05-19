{{/*
Expand the name of the chart.
*/}}
{{- define "sshd-chrooted.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "sshd-chrooted.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "sshd-chrooted.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "sshd-chrooted.labels" -}}
helm.sh/chart: {{ include "sshd-chrooted.chart" . }}
{{ include "sshd-chrooted.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "sshd-chrooted.selectorLabels" -}}
app.kubernetes.io/name: {{ include "sshd-chrooted.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "sshd-chrooted.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "sshd-chrooted.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{- define "sshd-chrooted.sshdUsers" -}}
{{- if .Values.users }}
{{- $list := list }}
{{- range .Values.users }}
{{- $list = append $list (printf "%s:%s:%s" .name .uid .gid) }}
{{- end }}
{{- join "," $list }}
{{- end }}
{{- end }}
