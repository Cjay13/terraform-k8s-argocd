# terraform-k8s-argocd
Terraform module to install and configure ArogCD in a K8s cluster

**Features**
- Installs Argo CD using the official [argo-helm](https://github.com/argoproj/argo-helm) chart
- Supports custom domains with Ingress and TLS via Cert-Manager
- Compatible with Kubernetes clusters provisioned via any provider

**Input Variable**
Name | Type | Description | Required
namespace | string | Namespace where Argo CD will be deployed | ✅ Yes
enable_ingress | bool | Enable or disable Ingress | ✅ Yes
ingressClassName | string | Ingress class name (e.g., nginx) | ✅ Yes
enable_tls | bool | Enable TLS on Ingress | ✅ Yes
domainName | string | Domain name used for Ingress (e.g., argocd.example.com) | ✅ Yes
use_cluster_issuer | bool | Whether to use a Cert-Manager cluster issuer | ✅ Yes
clusterIssuer | string | Name of the Cert-Manager cluster issuer (e.g., letsencrypt-prod) | ✅ Yes
chart_version | string | Version of the Argo CD Helm chart to install | ✅ Yes
