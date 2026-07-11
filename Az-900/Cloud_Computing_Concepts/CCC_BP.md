1. Agility: how fast user can deploy and modify resources
2. Mesured Service: every Service is mesured and billed based on consumption.

# cloud deployment models
1. public cloud: Azure
2. private cloud: Azure Stack Hub
3. Hybrid: ExpressRoute,VPN Gateway, and Azure Arc.

# Cloud Services Types
1. IaaS: only infra-structure is managed by azure, OS, application settings and data managed by customer
- physical datacenter,physical network, physical hosts managed by Azure
- OS, Network controls, Applications, Identity and directory Infrastructure,accounts and identities,devices,information and data managed by customer
2. PaaS: infra,OS,Middleware,runtime environment and development tools managed by Azure, application settings data managed by customer.
- physical datacenter,physical network, physical hosts,OS, Network controls, Applications, Identity and directory Infrastructure,accounts and identities managed by Azure
- OS, Network controls, Applications, Identity and directory Infrastructure,accounts and identities,devices,information and data managed by customer
3. SaaS: No infrastructure to configure,no installation,no updates.
- physical datacenter,physical network, physical hosts,OS, Network controls, Applications, Identity and directory Infrastructure,accounts and identities managed by Azure
- Identity and directory Infrastructure,accounts and identities,devices,information and data managed by customer

# Shared resposiblity model
- Data, Identity and access management, end point security for devices that connect to azure, account management for cloud service - you are resposible irrespective of deployment model

# Consumption Based Pricing Model
1. pay for what you use.
- Azure offers two cost saving strategies
1. Reserved Instances 
    - commit to using a VM for 1 or 3 years 
2. Spot VMs
    - take advantage of unused azure capacity. 
    - Offered at deep discounts

# Service Level Agreements and Composite Availability
1. SLAs are promises about how reliable a cloud service will be 
- 2 nines, or 99% uptime = abount 87.7 hours of downtime per year
- 3 nines, or 99.9% = around 8.76 hours per year
- 99.95% = roughly 4.38 hours per year
- 4 nines, or 99.99% = just under 53 mins per year
2. Composite SLA : Most real world solutions use multiple azure services working together.
- the overall,or composite, availability is lower than each individual SLA
- For Composite  SLA, you multiply 99.95%(service 1 SLA) times 99.99%(service 2 SLA) which is equal to 99.94%, 
Question : what is the composite SLA for a solution using two services?
Answer: multiply the availability percentages,not average them

- How to improve SLA
1. Redundancy
2. Failover Strategies

# Serveless Computing and Containers
1. Containers : Lightweight, package app and dependencies, share host OS, faster startup, easier to scale. Azure offers multiple containers
 - Azure container Instance: ACi is a simple way to run containers without managing the infrastructure. it is great for short lived jobs or even microservices. 
 - Azure Kubernetes services: Azure fully managed kubernetes offering. kubernetes is open source platform for orchestrating containers.
 - Azure container Apps: they sit between container instances and also AKS. it offers event-driven scaling, built-in load balancing, microservice support without complex kubernetes management.
 - Azure function is code first and event driven
 - logic apps is workflow-first with pre-built connectors
 - containers are lightweight,fast and idea for scalable app delivery
 - ACI are quick and easy
 - AKS full container orchestration

# Key Benefits of Colud Computing
- High availability,Scalability,Elasticity, Reliability, Predictability, Agility, Security, Governance, Global reach, Manageability