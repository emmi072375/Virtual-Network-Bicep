
targetScope = 'subscription'
//Create Virtual Network Parameter
@description( 'VNet Name')
param vnetName string = 'Vnet1'

@description('Address Prefix')
param vnetAddressPrefix string = '10.0.0.0/16'


@description('Subnet 1 Name')
param subnet1Name string = 'Subnet1'

@description('Subnet 2 Name')
param subnet2Name string = 'Subnet2'


@description('Subnet 1 Prefix')
param subnet1Prefix string = '10.0.0.0/24'

@description('Subnet 2 Prefix')
param subnet2Prefix string = '10.0.1.0/24'

//Create ResourceGroup Parameter 

param location string = 'northeurope'
param myResourceGroup string = 'ZellyTest01-rg'


resource myRG01 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: myResourceGroup
  location: location
  
  
}

module myVnet 'virtualnetwork.bicep' = {
  name: 'myVnetDeploy'
  scope: myRG01
  params: {
    vnetName: vnetName
    vnetAddressPrefix: vnetAddressPrefix
    subnet1Name: subnet1Name
    subnet2Name: subnet2Name
    subnet1Prefix: subnet1Prefix
    subnet2Prefix: subnet2Prefix
    location: location
  }
}


