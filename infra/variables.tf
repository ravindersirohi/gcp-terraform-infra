
variable "project" { 
    description = "GPC project name" 
    type        = object({
      name = string
      id = string
    })
    default = {
      id = "SirohiDevOpsApps"
      name = "DevOps Apps Project"
    }
}

variable "region" { 
    description = "Cloud region, for example - europe-west1, europe-west2" 
    type        = string
    default     = "europe-west2"
}