
# Terraform Configuration

The Terraform configuration is designed to set up a local K3d Kubernetes cluster and deploy the Helm chart

This deployment uses the Helm provider in Terraform.


For the local Kubernetes cluster setup, we'll use K3d, which is a lightweight wrapper to run K3s
(a lightweight Kubernetes distribution) in Docker 
 K3d for simplicity and speed, especially suitable for a quick POC and local testing.

This configuration will set up the cluster and deploy the application using the Helm chart.

For the terraform configuration we will use the following provider and modules
 - k3d terrafrom provider to create the K3d cluster
 - helm provider to deploy the Helm chart

A complete set of Terraform files ( main.tf, variable.tf, output.tf) to set up the local cluster and deploy the application
 files
 - main.tf

 Defines the K3d cluster and Helm release resources
 - variables.tf

 Defines variables used in the terraform configuration, such as cluster name
 - Outputs.tf
 
 Outputs the cluster endpiont information and Helm release status

 # Instructions

 ## Prerequisites
 - ensure Docker is running before applying  configuration since K3d relies on Docker
 - Terrafrom must be install on the local machine
 - K3d should be install to crete a local kubernetes cluster
 - Helm should be installed for managing kubernetes application

 1. Initialize Terraform:
 ```
   terraform init
 ```
 2. Apply configuration:
 ```
   terraform apply
 ```
   this command will create a local K3d cluster and deploy the helm chart

