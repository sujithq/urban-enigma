variable "project" {
  type        = string
  description = "Project name"
  default     = "ado2gha"
}

variable "env" {
  type        = string
  description = "Environment: Azure DevOps UI (ui), Azure DevOps YAML (yaml), GitHub Actions (gh), Local (local)"
  validation {
    condition     = can(regex("^(ui|yaml|gh|local)$", var.env))
    error_message = "Must be ui, yaml, gh or local."
  }
}

variable "location" {
  type        = string
  description = "location"
  default     = "westeurope"
}

variable "plan" {
  type = object({
    tier = string
    size = string
  })
  default = {
    tier = "Free"
    size = "F1"
  }
}