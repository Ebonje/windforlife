
terraform {
  required_providers {
    k3d = {
      source  = "ashald/k3d"
      version = "0.1.3"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.4.1"
    }
  }
}

// Configure K3d Provider
provider "k3d" {
  kubernetes_version = var.kubernetes_version
  k3d_api_version    = var.k3d_api_version
  registry           = var.registry
  kind               = "Simple"
  runtime            = "docker"
}

// Create a K3d Cluster
resource "k3d_cluster" "preprod_cluster" {
  name       = var.cluster_name
  api_server = {
    host = var.api_server_host
    port = var.api_server_port
  }
  memory = var.memory
}

// Add Node to the Cluster
resource "k3d_node_create" "preprod-node_1" {
  name    = "preprod-node-1"
  cluster = k3d_cluster.preprod_cluster.name
  role    = "agent"
  replicas = var.replicas
}

// Configure Helm Provider
provider "helm" {
  kubernetes {
    config_path = k3d_cluster.preprod_cluster.kubeconfig_path
  }
}

// Deploy the Application Using Helm
resource "helm_release" "windforlife" {
  name      = "windforlife"
  chart     = var.windforlife/chart   #Replace with actual chart path
  namespace = var.namespace

  values = [
    file(var.windforlife/chart/values.yaml) # Replace with actual values.yaml path
  ]
}
