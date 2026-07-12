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

# Load Balancing Services
1. Azure load-balancing services help ensure applications are always available and always responsive.
2. Load Balancing is  a process of distributing incoming network traffic across multiple servers or resources
3. Load Balancer handles TCP/UDP(Layer 4) network traffic,both inbound and outbound
    - Two Types
        - Public load balancer: Accepts traffic from the internet and distrubutes it to the azure VMs
        - Internal Load Balancer: Distributes traffic inside the virtual network
4. Azure Load Balancer health Probes: Monitor the availability of backend resources, these probes periodically check a specific port or path on each resource
5. Azure Application Gateways: Inspects HTTP and HTTPS content and make routing decisions based on URL paths,headers, cookies, and more
    - Web Application Firewall (WAF): Adds protection against common web vulnerabilities like SQL injection and cross-site scripting
7. Azure Traffic manager: DNS-based load balancer which uses DNS to direct users to the best endpoint based on performance, location, or availability.(For DNS-based global load balancing and disaster recovery)
8. Azure Front Door: More advanced service that combines global HTTP/HTTPS load balancing, content distrubution network (CDN) feature, and TLS offloading.
## Load Balancing Options in Azure
1. Azure load balancer: For basic TCP/UDP traffic, internal or external; ideal for non-HTTP workloads
2. Application Gateway: For web apps needing URL-based routing or Layer 7 inspections

# Network and Application Security Groups: 
1. NSG(network security groups) and ASG(Application security) help lock down traffic and enforce least privilege
## NSG is a set rules that control inbound and outbound traffic to azure resources.
- each rule in an NSG has a priority number
- the lower the number, the higher the priority
- rules are evaluated in order, from lowest to highest
- once a match is found, that rule is applied and evalution stops.
- by default, azure incldes built-in rules that allow internal traffic
## where you can apply NSG
- Attach an NSG to a subnet or to a NIC of a VM
- if rules exist at both levels, Azure evaluates both 
- the most restrictive rule win
## there is also ASG lets you group VMs by application role,so things like web servers,database servers etc
## NSGs operate at Layer 3 and 4, IP and trasport Layers of the OSI model
## Azure Firewall is a centralized,stateful firewall that also includes Layer 7 filtering

- For Az-900 exam,
# NSG
## Equals traffic control at Layer 3 and Layer 4
## Uses rules with priority Numbers
## denies inbound from the internet by default
## can be applied at subnet or NIC level
# ASG
## Equals grouping VMs by application Role
## Used in NSG rules for easier Management and scalability
# Azure Firewall
## Equals centralized Layer 3 to Layer 7 filtering
## Used when users need full-feature security inspection and centralized management
