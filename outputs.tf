output "node_taints_id" {
  description = "Map of id values across all node_taints, keyed the same as var.node_taints except keys with no id are omitted"
  value       = { for k, v in kubernetes_node_taint.node_taints : k => v.id if v.id != null && length(v.id) > 0 }
}
output "node_taints_field_manager" {
  description = "Map of field_manager values across all node_taints, keyed the same as var.node_taints except keys with no field_manager are omitted"
  value       = { for k, v in kubernetes_node_taint.node_taints : k => v.field_manager if v.field_manager != null && length(v.field_manager) > 0 }
}
output "node_taints_force" {
  description = "Map of force values across all node_taints, keyed the same as var.node_taints except keys with no force are omitted"
  value       = { for k, v in kubernetes_node_taint.node_taints : k => v.force if v.force != null }
}
output "node_taints_metadata" {
  description = "Map of metadata values across all node_taints, keyed the same as var.node_taints except keys with no metadata are omitted"
  value       = { for k, v in kubernetes_node_taint.node_taints : k => one(v.metadata) if v.metadata != null && length(v.metadata) > 0 }
}
output "node_taints_taint" {
  description = "Map of taint values across all node_taints, keyed the same as var.node_taints except keys with no taint are omitted"
  value       = { for k, v in kubernetes_node_taint.node_taints : k => v.taint if v.taint != null && length(v.taint) > 0 }
}

