# Azure Virtual Networks and Subnets
1. VNet: A private network in azure, Isloated from other networks and gives control over how azure resources talk to each other.
- To create a network in azure, user first need to define an address space for their VNet. This is typically in CIDR(Classless inter domain routing) notation like 10.0.0.0/16 when using IP Version 4.
- /16 - 65000 addresses; /24 gives 256 addresses; /28 give 16 addresses
- For IPv6, defines a similar address range using IPv6 CIDR notation like 2001:db8::/48, enabling dual stack networking for IPv4 and IPv6 traffic
- All resources in VNet can talk to each other even if in different subnetworks
2. Connecting two VNets together is VNet peering.
3. Global VNet Peering: can be peered in the same region or across regions
4. VNet peering connects VNets privately over microsoft's backbone and is non-transitive unless explicity configured.
## Summary
1. VNets are private networks in azure.
2. they use IPv4 and IPv6 CIDR blocks to define address space
3. They support subnets to organize resources
4. Traffic flows freely inside the VNet unless restricted.
5. VNet peering connects separate VNets over azure private backbone
6. You can apply custom routing and security rules as needed with options like UDRs and NSGs
## for Az-900,
1. VNets enable private, secure communication between azure resources
2. Subnets organize resources and support security boundries.
3. Traffic is allowed by default inside VNet
4. VNet peering connects seperate VNet using Azure's backbone network
5. Peering is non- transitive by default
6. Users can control routing with custom route tables and security groups.

# Azure DNS(Domin Name System) and Private DNS
1. DNS is responsible for translating a service name to an IP address
- Two DNS
- Public DNS Zones: Used to host the DNS records for public accessible domains
- Private DNS Zones: These are used for name resolution inside your azure network. they are not exposed to public internet.
    - private DNS simplifies hybrid management, when private DNS is linked to a VNet, Azure can manage name resolution for resource in that network
    - you have two options when linking.
         - with auto-registration: Azure actomatically creates DNS records when VMs are deployed in the VNet
         - without auto-registration: Manual creation of DNS records is required.

# Public,Private, and Service Endpoints
1. In cloud networking, understanding how resources connect is just as important as knowing what they connect to 
- Endpoint: Defines how a resource can be reached over the network,either through the public internet or through private connections.
- Public EP: Exposes a resource using a public IP address. anyone can use it.
- Private EP: Private EP allows you to access azure resources privately
- service EP: will not create new IP Address, instead making it part of the VNet. Service endpoints retain the service's public IP address while extending the VNet's Identity to the Azure service  

# VPN Gateway,Bastion, and ExpressRoute
1. VPN Gateway: A service that creates a secure encrypted tunnel over the public internet between an on-prem network and an azure VNet.
- two types of VPN connection
    1. Site-to-Site VPN, which connects the entire on-prem network to Azure.
    2. Point-to-Site VPN connects individual devices, like a laptop,directly to azure
- To use VNet Gateway, you need a virtual network gateway resource.This is the actual appliance that handles encryption and traffic routing. sometimes it is called VPN concentrator
- A special subnet named "GatewaySubnet" must be created inside the VNet
2. Azure Bastion:A service that lets users securely connect to the azure VMs using Remote desktop protocal(RDP) or Secure shell(SSH) directly through the Azure portal.
- Azure bastion requires a dedicated subnet named exactly "AzureBastionSubnet" with a minimum size of /26