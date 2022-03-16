@description( 'VNet Name')
param vnetName string 

@description('Address Prefix')
param vnetAddressPrefix string 


@description('Subnet 1 Name')
param subnet1Name string

@description('Subnet 2 Name')
param subnet2Name string 


@description('Subnet 1 Prefix')
param subnet1Prefix string 

@description('Subnet 2 Prefix')
param subnet2Prefix string 

@description('Location for all Resources')
param location string = resourceGroup().location







resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: vnetName
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [
        vnetAddressPrefix
      ]
    }
    subnets: [
       {
         name: subnet1Name
         properties: {
           addressPrefix: subnet1Prefix
         }
       }
       {
         name: subnet2Name
         properties: {
           addressPrefix: subnet2Prefix 
         }
       }    
            
           
      
    ]
  }
}


