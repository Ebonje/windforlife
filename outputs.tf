output "cluster_name" {
  description = "The name of the K3d cluster."
  value       = k3d_cluster.preprod_cluster.name
}

output "api_server_endpoint" {
  description = "The API server endpoint for the K3d cluster."
  value       = "${k3d_cluster.preprod_cluster.api_server.host}:${k3d_cluster.preprod_cluster.api_server.port}"
}

output "kubeconfig_path" {
  description = "The path to the kubeconfig file for the K3d cluster."
  value       = k3d_cluster.preprod_cluster.kubeconfig_path
}
