# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}
variable "enabled" {
  type        = bool
  default     = true
  description = "Variable indicating whether deployment is enabled."
}

variable "create_namespace_monitoring" {
  type        = bool
  default     = true
  description = "Whether to create monitoring Kubernetes namespace with name defined by `namespace`."
}

variable "namespace_monitoring" {
  type        = string
  default     = "monitoring"
  description = "Kubernetes namespace to deploy Prometheus stack Helm charts."
}

variable "mod_dependency" {
  default     = null
  description = "Dependence variable binds all AWS resources allocated by this module, dependent modules reference this variable."
}

variable "create_namespace_logging" {
  type        = bool
  default     = true
  description = "Whether to create logging Kubernetes namespace with name defined by `namespace`."
}

variable "namespace_logging" {
  type        = string
  default     = "logging"
  description = "Kubernetes namespace to deploy logging stack Helm charts."
}
# Prometheus

variable "settings_prometheus" {
  default = {
    alertmanager = {
      persistentVolume = {
        storageClass = "gp2"
      }
    }
    server = {
      persistentVolume = {
        storageClass = "gp2"
      }
    }
  }
  description = "Additional settings which will be passed to Prometheus Helm chart values."
}

variable "helm_chart_prometheus_release_name" {
  type        = string
  default     = "prometheus"
  description = "Prometheus Helm release name"
}

variable "helm_chart_prometheus_name" {
  type        = string
  default     = "prometheus"
  description = "Prometheus Helm chart name to be installed"
}

variable "helm_chart_prometheus_version" {
  type        = string
  default     = "14.5.0"
  description = "Prometheus Helm chart version."
}

variable "helm_chart_prometheus_repo" {
  type        = string
  default     = "https://prometheus-community.github.io/helm-charts"
  description = "Prometheus repository name."
}

# Grafana

variable "settings_grafana" {
  default = {
    persistence = {
      enabled          = true
      storageClassName = "gp2"
    }
    adminPassword = "admin"
  }
  description = "Additional settings which will be passed to Grafana Helm chart values."
}

variable "helm_chart_grafana_release_name" {
  type        = string
  default     = "grafana"
  description = "Grafana Helm release name"
}

variable "helm_chart_grafana_name" {
  type        = string
  default     = "grafana"
  description = "Grafana Helm chart name to be installed"
}

variable "helm_chart_grafana_version" {
  type        = string
  default     = "6.15.0"
  description = "Grafana Helm chart version."
}

variable "helm_chart_grafana_repo" {
  type        = string
  default     = "https://grafana.github.io/helm-charts"
  description = "Grafana repository name."
}

# Loki

variable "settings_loki" {
  default = {
    persistence = {
      enabled          = true
      storageClassName = "gp2"
    }
  }
  description = "Additional settings which will be passed to Grafana Helm chart values."
}

variable "helm_chart_loki_release_name" {
  type        = string
  default     = "loki"
  description = "loki Helm release name"
}

variable "helm_chart_loki_name" {
  type        = string
  default     = "loki"
  description = "loki Helm chart name to be installed"
}

variable "helm_chart_loki_version" {
  type        = string
  default     = "5.6.4"
  description = "loki Helm chart version."
}

variable "helm_chart_loki_repo" {
  type        = string
  default     = "https://grafana.github.io/helm-charts"
  description = "loki repository name."
}
