variable "node_taints" {
  description = <<EOT
Map of node_taints, attributes below
Required:
    - metadata (block):
        - name (required)
    - taint (block):
        - effect (required)
        - key (required)
        - value (required)
Optional:
    - field_manager
    - force
EOT

  type = map(object({
    field_manager = optional(string)
    force         = optional(bool)
    metadata = object({
      name = string
    })
    taint = list(object({
      effect = string
      key    = string
      value  = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.node_taints : (
        length(v.taint) >= 1
      )
    ])
    error_message = "Each taint list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.node_taints : (
        v.field_manager == null || (length(trimspace(v.field_manager)) > 0)
      )
    ])
    error_message = "must not be empty or only whitespace"
  }
}

