
variable "project" { 
    description = "GPC project name" 
    type        = object({
      name = string
      id = string
    })
    default = {
      id = "pocapps"
      name = "Poc Apps"
    }
}

variable "region" { 
    description = "Cloud region, for example - europe-west1, europe-west2" 
    type        = string
    default     = "europe-west2"
}