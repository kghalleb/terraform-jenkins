resource "kubernetes_namespace" "monitoring" {
  depends_on = [var.mod_dependency]
  count      = (var.enabled && var.create_namespace_monitoring && var.namespace_monitoring != "kube-system") ? 1 : 0

  metadata {
    name = var.namespace_monitoring
  }
}
/*resource "kubernetes_namespace" "logging" {
  depends_on = [var.mod_dependency]
  count      = (var.enabled && var.create_namespace_logging && var.namespace_logging != "kube-system") ? 1 : 0

  metadata {
    name = var.namespace_logging
  }
}*/

