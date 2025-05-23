resource "helm_release" "argocd" {
    name = "argocd"
    namespace = var.namespace
    create_namespace = true
    repository = "https://argoproj.github.io/argo-helm"
    chart = "argo-cd"
    version = var.chart_version

    values = [
      yamlencode({
        global = var.enable_ingress ? {
          domain = var.domainName
        } : {}

        configs = {
            params = {
                "server.insecure" = var.enable_ingress ? true : false
            }
        }

        server = {
          ingress = {
            enabled           = var.enable_ingress
            ingressClassName  = var.enable_ingress ? var.ingressClassName : null
            annotations = {
              "cert-manager.io/cluster-issuer" = var.enable_tls && var.use_cluster_issuer ? var.clusterIssuer : null
            }
            tls = var.enable_ingress && var.enable_tls ? {
              hosts = [var.domainName]
            } : {}
          }
        }
      })
    ]
}


resource "null_resource" "validate_ingress_config" {
  count = local.ingress_config_valid ? 0 : 1

  provisioner "local-exec" {
    command = "echo 'Invalid ingress configuration: When enable_ingress is true, domainName, use_cluster_issuer, and enable_tls must be provided.' && exit 1"
  }
}

resource "null_resource" "validate_tls_config" {
  count = local.tls_config_valid ? 0 : 1

  provisioner "local-exec" {
    command = "echo 'Invalid TLS configuration: When enable_tls is true, domainName, and use_cluster_issuer must be provided.' && exit 1"
  }
}

resource "null_resource" "validate_clusterIssuer_config" {
  count = local.clusterIssuer_valid ? 0 : 1

  provisioner "local-exec" {
    command = "echo 'Invalid clusterIssuer configuration: When use_cluster_issuer is true, clusterIssuer must be provided.' && exit 1"
  }
}
