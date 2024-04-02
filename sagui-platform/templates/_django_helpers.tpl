
{{/*
Concatenate the allowedHosts setting
*/}}
{{- define "sagui-platform.allowedHosts" -}}
{{- printf "%s" (join "," .Values.backend.settings.allowedHosts) }}
{{- end }}


{{/*
Create the CSRF token from the allowed one. TODO: drop it and move the logic to the python config
*/}}
{{- define "sagui-platform.csrf-whitelist" -}}
{{- $origins := list -}}
{{- range .Values.backend.settings.allowedHosts -}}
    {{- $origins = printf "https://%s" . | append $origins -}}
{{- end -}}
{{- printf "%s" (join "," $origins) }}
{{- end }}