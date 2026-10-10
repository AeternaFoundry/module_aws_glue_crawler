variable "glue_crawlers" {
  description = <<EOT
Map of glue_crawlers, attributes below
Required:
    - database_name
    - name
    - role
Optional:
    - classifiers
    - configuration
    - description
    - region
    - schedule
    - security_configuration
    - table_prefix
    - tags
    - tags_all
    - catalog_target (block):
        - connection_name (optional)
        - database_name (required)
        - dlq_event_queue_arn (optional)
        - event_queue_arn (optional)
        - tables (required)
    - delta_target (block):
        - connection_name (optional)
        - create_native_delta_table (optional)
        - delta_tables (required)
        - write_manifest (required)
    - dynamodb_target (block):
        - path (required)
        - scan_all (optional)
        - scan_rate (optional)
    - hudi_target (block):
        - connection_name (optional)
        - exclusions (optional)
        - maximum_traversal_depth (required)
        - paths (required)
    - iceberg_target (block):
        - connection_name (optional)
        - exclusions (optional)
        - maximum_traversal_depth (required)
        - paths (required)
    - jdbc_target (block):
        - connection_name (required)
        - enable_additional_metadata (optional)
        - exclusions (optional)
        - path (required)
    - lake_formation_configuration (block):
        - account_id (optional)
        - use_lake_formation_credentials (optional)
    - lineage_configuration (block):
        - crawler_lineage_settings (optional)
    - mongodb_target (block):
        - connection_name (required)
        - path (required)
        - scan_all (optional)
    - recrawl_policy (block):
        - recrawl_behavior (optional)
    - s3_target (block):
        - connection_name (optional)
        - dlq_event_queue_arn (optional)
        - event_queue_arn (optional)
        - exclusions (optional)
        - path (required)
        - sample_size (optional)
    - schema_change_policy (block):
        - delete_behavior (optional)
        - update_behavior (optional)
EOT

  type = map(object({
    database_name          = string
    name                   = string
    role                   = string
    classifiers            = optional(list(string))
    configuration          = optional(string)
    description            = optional(string)
    region                 = optional(string)
    schedule               = optional(string)
    security_configuration = optional(string)
    table_prefix           = optional(string)
    tags                   = optional(map(string))
    tags_all               = optional(map(string))
    catalog_target = optional(list(object({
      connection_name     = optional(string)
      database_name       = string
      dlq_event_queue_arn = optional(string)
      event_queue_arn     = optional(string)
      tables              = list(string)
    })))
    delta_target = optional(list(object({
      connection_name           = optional(string)
      create_native_delta_table = optional(bool)
      delta_tables              = set(string)
      write_manifest            = bool
    })))
    dynamodb_target = optional(list(object({
      path      = string
      scan_all  = optional(bool)
      scan_rate = optional(number)
    })))
    hudi_target = optional(list(object({
      connection_name         = optional(string)
      exclusions              = optional(list(string))
      maximum_traversal_depth = number
      paths                   = set(string)
    })))
    iceberg_target = optional(list(object({
      connection_name         = optional(string)
      exclusions              = optional(list(string))
      maximum_traversal_depth = number
      paths                   = set(string)
    })))
    jdbc_target = optional(list(object({
      connection_name            = string
      enable_additional_metadata = optional(list(string))
      exclusions                 = optional(list(string))
      path                       = string
    })))
    lake_formation_configuration = optional(object({
      account_id                     = optional(string)
      use_lake_formation_credentials = optional(bool)
    }))
    lineage_configuration = optional(object({
      crawler_lineage_settings = optional(string)
    }))
    mongodb_target = optional(list(object({
      connection_name = string
      path            = string
      scan_all        = optional(bool)
    })))
    recrawl_policy = optional(object({
      recrawl_behavior = optional(string)
    }))
    s3_target = optional(list(object({
      connection_name     = optional(string)
      dlq_event_queue_arn = optional(string)
      event_queue_arn     = optional(string)
      exclusions          = optional(list(string))
      path                = string
      sample_size         = optional(number)
    })))
    schema_change_policy = optional(object({
      delete_behavior = optional(string)
      update_behavior = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.glue_crawlers : (
        v.dynamodb_target == null || alltrue([for item in v.dynamodb_target : (item.scan_rate == null || (item.scan_rate >= 0.1 && item.scan_rate <= 1.5))])
      )
    ])
    error_message = "must be between 0.1 and 1.5"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_crawlers : (
        v.hudi_target == null || alltrue([for item in v.hudi_target : (item.maximum_traversal_depth >= 1 && item.maximum_traversal_depth <= 20)])
      )
    ])
    error_message = "must be between 1 and 20"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_crawlers : (
        v.iceberg_target == null || alltrue([for item in v.iceberg_target : (item.maximum_traversal_depth >= 1 && item.maximum_traversal_depth <= 20)])
      )
    ])
    error_message = "must be between 1 and 20"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_crawlers : (
        v.s3_target == null || alltrue([for item in v.s3_target : (item.sample_size == null || (item.sample_size >= 1 && item.sample_size <= 249))])
      )
    ])
    error_message = "must be between 1 and 249"
  }
  validation {
    condition = alltrue([
      for k, v in var.glue_crawlers : (
        v.table_prefix == null || (length(v.table_prefix) >= 0 && length(v.table_prefix) <= 128)
      )
    ])
    error_message = "must be between 0 and 128 characters"
  }
  # Note: 13 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

