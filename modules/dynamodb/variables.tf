variable "table_name" {
  type        = string
  description = "Name of the DynamoDB table"
}

variable "tags" {
  type        = map(string)
  description = "Tags for the DynamoDB table"
  default     = {}
}
