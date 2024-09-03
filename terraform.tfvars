variable "kubernetes_version" {
  description = "Kubernetes version to use for the K3d cluster"
  type        = string
  default     = "1.24.4-k3s1"
}

variable "k3d_api_version" {
  description = "API version for K3d"
  type        = string
  default     = "k3d.io/v1alpha4"
}

variable "registry" {
  description = "Registry for K3d"
  type        = string
  default     = "rancher/k3s"
}

variable "cluster_name" {
  description = "Name of the K3d cluster"
  type        = string
  default     = "preprod-cluster"
}

variable "control_plane_port" {
  description = "Port for the K3d cluster API server"
  type        = string
  default     = "6443"
}

variable "memory" {
  description = "Memory allocated for the K3d cluster nodes"
  type        = string
  default     = "8g"
}

variable "replicas" {
  description = "Number of replicas for worker nodes"
  type        = number
  default     = 2
}

variable "helm_chart_path" {
  description = "Path to the Helm chart"
  type        = string
  default     = "path/to/your/helm/chart"
}

variable "values_yaml_path" {
  description = "Path to the values.yaml file"
  type        = string
  default     = "path/to/your/values.yaml"
}

variable "namespace" {
  description = "Namespace in which to deploy the Helm release"
  type        = string
  default     = "default"
}