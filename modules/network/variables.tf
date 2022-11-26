#Image for diff region
# variable "amis" {
#     description = "AMIs by region"
#     default = {
#     us-east-1 = "ami-052efd3df9dad4825" # ubuntu 14.04 LTS
# 		us-east-2 = "ami-02f3416038bdb17fb" # ubuntu 14.04 LTS
#     }
# }

variable "vpc_cidr" {}
variable "vpc_name" {}
variable "IGW_name" {}
variable "key_name" {}
#variable Main_Routing_Table {}
variable "azs" {}
variable "publiccidrs" {}
variable "privatecidrs" {}
variable "environment" {}
#variable "imagename" {}
variable "localsnew" {
default = {
    country = "India"
    }
}
