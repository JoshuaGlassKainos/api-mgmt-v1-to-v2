# api-mgmt-v1-to-v2
## Deploying resources
### Component deployment order
- Resource-group
- Network
- Api-mgmt

To deploy resources enter the following command in each component folder \
`terraform plan -var-file ../../tfvars/eu-west.tfvars` \
`terraform apply -var-file ../../tfvars/eu-west.tfvars`

## Note
The deployment of api-managment service will take estimate of 45 minutes 

# Migrating from `stv1` -> `stv2`
## Prerequisites
Before we can continue we need to ensure the `migration` component has the imported resources from the previous components `network` and `api-mgmt`. \
To achieve this we can enter the following commands
``` 
terraform import -var-file="../../tfvars/<tf-vars>.tfvars" \ 
module.api_mgmt.azurerm_subnet_network_security_group_association.nsg_association \
/subscriptions/<subscription-number>/resourceGroups/<resource-group>/providers/Microsoft.Network/virtualNetworks/<virtual-network>/subnets/<subnet> 
```

```
terraform import -var-file="../../tfvars/<tf-vars>.tfvars" \ 
module.api_mgmt.azurerm_api_management.api_mgmt \
/subscriptions/<subscription-number>/resourceGroups/<resource-group>/providers/Microsoft.ApiManagement/service/<api-mgmt>
```

## Starting the migration
Once we have these resources imported we can deploy the resources using the `migration.tfvars` \
`terraform plan -var-file ../../tfvars/eu-west.tfvars` \
`terraform apply -var-file ../../tfvars/eu-west.tfvars`

## What is created
A `Standard SKU Static Public IP` is created and is used for managment purposes only, [this is a requirement when creating a `stv2` api-mgmt instance](https://learn.microsoft.com/en-us/azure/api-management/api-management-using-with-internal-vnet?tabs=stv2#prerequisites)

