
variable "authentication_key" {
  description = "AWS ID"
  type        = string
}

variable "aws_access_key" {
  type    = string
  default = ""
}

variable "aws_secret_key" {
  type    = string
  default = ""
}

variable "firstvif" {
  description = "Name of first vif"
  type        = string
}

variable "Secondvif" {
  description = "Name of first vif"
  type        = string
}



variable "asn_1" {
  description = "ASN no: for first vif"
  type        = string
}

variable "asn_2" {
  description = "ASN no: for first vif"
  type        = string
}

variable "amazonsideip_1" {
  description = "Amazon side WAN IP for VIF"
  type        = string
}

variable "amazonsideip_2" {
  description = "Amazon side WAN IP for VIF"
  type        = string
}

variable "customersideip_1" {
  description = "Customer side WAN IP for VIF"
  type        = string
}

variable "customersideip_2" {
  description = "Customer side WAN IP for VIF"
  type        = string
}

variable "bgpMD5key" {
  description = "This is the AWS BGP Key"
  type        = string
}

variable "Terraformcloud_org_name" {
  description = "This is the org name for terraform cloud"
  type        = string
}

variable "workspaceforDx-DLG-Parent" {
  description = "This is the organization name for terraform cloud"
  type        = string
}

variable workspaceforDualDGW-Parent {
  description = "This is the workspace name of terraform cloud"
  type        = string
}

