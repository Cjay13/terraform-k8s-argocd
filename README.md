# terraform-k8s-argocd
Terraform module to install and configure ArogCD in a K8s cluster

**Features**
- Installs Argo CD using the official [argo-helm](https://github.com/argoproj/argo-helm) chart
- Supports custom domains with Ingress and TLS via Cert-Manager
- Compatible with Kubernetes clusters provisioned via any provider

**Input Variable**
| Name               | Type    | Description                                                               | Default      | Required                                                                 |
|--------------------|---------|---------------------------------------------------------------------------|--------------|--------------------------------------------------------------------------|
| namespace          | string  | Kubernetes namespace where ArgoCD will be deployed                        | "argocd"     | Optional (if not specified, uses default value "argocd")                |
| chart_version      | string  | ArgoCD Helm chart version                                                 | "7.8.23"     | Optional (if not specified, uses default value "7.8.23")                |
| enable_ingress     | bool    | Enable ingress for ArgoCD                                                 | false        | Optional (if not specified, uses default value "false")                 |
| enable_tls         | bool    | Enable TLS for ArgoCD ingress                                             | false        | Optional (if not specified, uses default value "false")                 |
| domainName         | string  | Domain name for ArgoCD (required if `enable_ingress = true`)              | ""           | **Required** if `enable_ingress` is `true`                               |
| ingressClassName   | string  | Ingress class name (required if `enable_ingress = true`)                  | "nginx"      | **Required** if `enable_ingress` is `true`                               |
| use_cluster_issuer | bool    | Use Cert-Manager ClusterIssuer (required if `enable_tls = true`)          | true        | **Required** if `enable_tls` is `true`                                   |
| clusterIssuer      | string  | Name of ClusterIssuer (required if `use_cluster_issuer = true`)           | ""           | **Required** if `use_cluster_issuer` is `true`                           |
|


