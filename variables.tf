variable "namespace" {
    type = string
    description = "Kubernetes namespace where ArgoCD will be deployed"
    default = "argocd"
}

variable "chart_version" {
    type = string
    description = "ArgoCD helm chart version"
    default = "7.8.23"
}

variable "enable_ingress" {
    type = bool
    description = "Enable ingress for ArgoCD"
    default = false
}

variable "enable_tls" {
    type = bool
    description = "Enable TLS for ArgoCD"
    default = false
}


variable "domainName" {
    type = string
    description = "Domain name for ArgoCD"
    default = ""
}

variable "ingressClassName" {
    type = string
    description = "Ingress class name"
    default = "nginx"
}

variable "use_cluster_issuer" {
    type = bool
    description = "Whether to use clusterIssuer or not, if not Issuer will be used"
    default = false
}

variable "clusterIssuer" {
    type = string
    description = "clusterIssuer for cert-manager"
    default = ""
}

variable "issuer" {
    type = string
    description = "Issuer for cert-manager"
    default = ""
}