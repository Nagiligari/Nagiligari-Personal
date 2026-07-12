# Regions, Region Pairs, and Availability zones
1. Azure region: A set of datacenters deployed within a specific geographic area,connected through a dedicated,low-latency network.
- Regions makes up azure geographies and include sovereign regions
- Geography is a specific market, or area, that contains two or more azure regions, designed to keep data with in same borders and mmet compliance or legal requirements.
- Sovereign Regions: physically and logically seperated from the global azure network to meet specific compliance and legal requirements.
2. Availability zones - set of data centers inter connected with each other with seperate cooling, power and networking etc
- not all regions have AZs yet.

# Azure Datacenters and sovereign regions
1. Azure Datacenters are physical facilities that house the servers,storage systems, and networking hardware that power azure services
- datacenters are grouped into regions, not all regions are available in public few are savereign regions
- Azure government - for US Government agencies and contractors
- Azure China - Operated by 12Vianet, an independent company under chinese jurisdiction
- What make region sovereign ?
- Physical Isolation - seperates infra located within specific national boundries
- Logical Isolation - Provides independent identity,billing, and directory services
- Regulatory Compliance - Designed to meet national security legal, or compliance requirements.
- Sovereign clouds have seperate portals,credentials, and operational staff.
- Feature availability may lag behind commercial azure due to compliance validation

# Resources and Resource Groups 
1. Azure resource is any manageable item that is available through azure
2. RG is a way to organize resources by lifecycle, application, environment, or cost center
3. RG itself has a location where its metadata is stored
4. Tags are key-value pairs that help categorize resources for things like cost tracking,automation, or compliance
5. tags applied to a RG are not automatically inherited by the resource inside
6. RBAC roles and policies applied to the RG are inherited by the resources within

# Subscriptions and Management Groups
1. Azure Subscription is primary boundary for billing, resource, deployment and access control
- microsoft entra id tenant & Root environment ---> Root Management group ---> Multiple Management Groups ---> multiple subscriptions per management group ---> multiple RG per subscription -- multiple resources per RG.

# Azure Resource Manager (ARM)
1. ARM: The management layer in azure that provides a consistent way to deploy, manage, and organize azure resources
- with ARM, you can implement below 
1. deploy 100 environments as easily
2. prevent configuration drift
3. Enable true DevOps pratices
- Mastering ARM and Infrastructure as code concepts helps stand out in the job market
2. Benefits of ARM
- Consistency - All tools and APIs use the same structure and commands through ARM
- Idempotence - The same deployment can be run multiple times, and ARM only makes changes if something has actually changed.
- RBAC - ARM allows RBAC to be applied at any scope management groups, subscription, REG or individual Resources
- Tagging - ARM allows metadata tags to be applied to any resource during deployment ensuring consistency
- Deployment Tracking - ARM maintains a complete history of every deployment.
2. ARM Templates: A file that defines azure infrastructure in a structured format.
3. Infrastructure of code(IoC): the practice of managing and provisioning infrastructure using code instead of manual clicking.