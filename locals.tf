locals {
  ingress_config_valid = (
    !var.enable_ingress || (
      var.domainName != "" &&
      can(var.use_cluster_issuer) &&
      can(var.enable_tls)
    )
  )

  tls_config_valid = (
    !var.enable_tls || (
        var.domainName != "" &&
        can(var.use_cluster_issuer)
    )
  )

  clusterIssuer_valid = (
    !var.use_cluster_issuer || (
        can(var.clusterIssuer)
    )
  )
}
