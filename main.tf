
data "terraform_remote_state" "remote_outputs_1" {
  backend = "remote"

  config = {
    organization = var.Terraformcloud_org_name
    workspaces = {
      name = var.workspaceforDx-DLG-Parent
    }
  }
}

data "terraform_remote_state" "remote_outputs_2" {
  backend = "remote"

  config = {
    organization = var.Terraformcloud_org_name
    workspaces = {
      name = var.workspaceforDualDGW-Parent
    }
  }
}


## to create Transit VIF - Pri 

resource "aws_dx_transit_virtual_interface" "VIF_1" {
  connection_id = data.terraform_remote_state.remote_outputs_1.outputs.Dx_connection_ID_Pri_Parent

  dx_gateway_id  = data.terraform_remote_state.remote_outputs_2.outputs.Dx_Gateway_ID_01
  name           = var.firstvif
  vlan           = data.terraform_remote_state.remote_outputs_1.outputs.Dx_VLAN_ID_Pri_Parent
  address_family = "ipv4"
  bgp_asn        = var.asn_1
  amazon_address = var.amazonsideip_1
  customer_address = var.customersideip_1
  bgp_auth_key = var.bgpMD5key
}

## to create Transit VIF - Sec


resource "aws_dx_transit_virtual_interface" "VIF_2" {
  connection_id = data.terraform_remote_state.remote_outputs_1.outputs.Dx_connection_ID_Sec_Parent

  dx_gateway_id  = data.terraform_remote_state.remote_outputs_2.outputs.Dx_Gateway_ID_02
  name           = var.Secondvif
  vlan           = data.terraform_remote_state.remote_outputs_1.outputs.Dx_VLAN_ID_Sec_Parent
  address_family = "ipv4"
  bgp_asn        = var.asn_2
  amazon_address = var.amazonsideip_2
  customer_address = var.customersideip_2
  bgp_auth_key = var.bgpMD5key
  provider = aws.us-west-1  # specify the aws region of the second vif if trying to deploy dual VIF in separate region
}


