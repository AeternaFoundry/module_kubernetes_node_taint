resource "kubernetes_node_taint" "node_taints" {
  for_each = var.node_taints

  field_manager = each.value.field_manager
  force         = each.value.force

  metadata {
    name = each.value.metadata.name
  }

  dynamic "taint" {
    for_each = each.value.taint
    content {
      effect = taint.value.effect
      key    = taint.value.key
      value  = taint.value.value
    }
  }
}

