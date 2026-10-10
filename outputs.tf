output "glue_crawlers_id" {
  description = "Map of id values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.id if v.id != null && length(v.id) > 0 }
}
output "glue_crawlers_arn" {
  description = "Map of arn values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "glue_crawlers_catalog_target" {
  description = "Map of catalog_target values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.catalog_target if v.catalog_target != null && length(v.catalog_target) > 0 }
}
output "glue_crawlers_classifiers" {
  description = "Map of classifiers values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.classifiers if v.classifiers != null && length(v.classifiers) > 0 }
}
output "glue_crawlers_configuration" {
  description = "Map of configuration values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.configuration if v.configuration != null && length(v.configuration) > 0 }
}
output "glue_crawlers_database_name" {
  description = "Map of database_name values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.database_name if v.database_name != null && length(v.database_name) > 0 }
}
output "glue_crawlers_delta_target" {
  description = "Map of delta_target values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.delta_target if v.delta_target != null && length(v.delta_target) > 0 }
}
output "glue_crawlers_description" {
  description = "Map of description values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.description if v.description != null && length(v.description) > 0 }
}
output "glue_crawlers_dynamodb_target" {
  description = "Map of dynamodb_target values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.dynamodb_target if v.dynamodb_target != null && length(v.dynamodb_target) > 0 }
}
output "glue_crawlers_hudi_target" {
  description = "Map of hudi_target values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.hudi_target if v.hudi_target != null && length(v.hudi_target) > 0 }
}
output "glue_crawlers_iceberg_target" {
  description = "Map of iceberg_target values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.iceberg_target if v.iceberg_target != null && length(v.iceberg_target) > 0 }
}
output "glue_crawlers_jdbc_target" {
  description = "Map of jdbc_target values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.jdbc_target if v.jdbc_target != null && length(v.jdbc_target) > 0 }
}
output "glue_crawlers_lake_formation_configuration" {
  description = "Map of lake_formation_configuration values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => one(v.lake_formation_configuration) if v.lake_formation_configuration != null && length(v.lake_formation_configuration) > 0 }
}
output "glue_crawlers_lineage_configuration" {
  description = "Map of lineage_configuration values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => one(v.lineage_configuration) if v.lineage_configuration != null && length(v.lineage_configuration) > 0 }
}
output "glue_crawlers_mongodb_target" {
  description = "Map of mongodb_target values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.mongodb_target if v.mongodb_target != null && length(v.mongodb_target) > 0 }
}
output "glue_crawlers_name" {
  description = "Map of name values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.name if v.name != null && length(v.name) > 0 }
}
output "glue_crawlers_recrawl_policy" {
  description = "Map of recrawl_policy values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => one(v.recrawl_policy) if v.recrawl_policy != null && length(v.recrawl_policy) > 0 }
}
output "glue_crawlers_region" {
  description = "Map of region values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.region if v.region != null && length(v.region) > 0 }
}
output "glue_crawlers_role" {
  description = "Map of role values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.role if v.role != null && length(v.role) > 0 }
}
output "glue_crawlers_s3_target" {
  description = "Map of s3_target values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.s3_target if v.s3_target != null && length(v.s3_target) > 0 }
}
output "glue_crawlers_schedule" {
  description = "Map of schedule values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.schedule if v.schedule != null && length(v.schedule) > 0 }
}
output "glue_crawlers_schema_change_policy" {
  description = "Map of schema_change_policy values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => one(v.schema_change_policy) if v.schema_change_policy != null && length(v.schema_change_policy) > 0 }
}
output "glue_crawlers_security_configuration" {
  description = "Map of security_configuration values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.security_configuration if v.security_configuration != null && length(v.security_configuration) > 0 }
}
output "glue_crawlers_table_prefix" {
  description = "Map of table_prefix values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.table_prefix if v.table_prefix != null && length(v.table_prefix) > 0 }
}
output "glue_crawlers_tags" {
  description = "Map of tags values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "glue_crawlers_tags_all" {
  description = "Map of tags_all values across all glue_crawlers, keyed the same as var.glue_crawlers"
  value       = { for k, v in aws_glue_crawler.glue_crawlers : k => v.tags_all if v.tags_all != null && length(v.tags_all) > 0 }
}

