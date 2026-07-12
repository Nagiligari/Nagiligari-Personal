# VM Building Blocks
1. VM: A virtualized instance of a physical computer running in azure datacenter
- core building blocks of a VM
1. VM Size: when creating a VM choose a size that determines vCPU, RAM, and network throughput.
    - ranges from small to big 
2. Image: The starting template for th VM including the OS and optional pre-installed applications
    - single VM with SSD SLA - 99.9%
    - Availablility sets SLA: 99.95%
    - Availability zones SLA: 99.99%
3. region, and availability settings
4. pricing is based on size, os, region, and storage
3. Spot VMs offer up to 90% savings for interruptible workloads

# Containers and Serverless (VMs, Containers and Functions)
1. Assume Vms has apartments, Containers as fully furnished house, function as hotel rooms. 
2. containers are more modern way to package and run applications,packaging just applications and dependencies instead of the whole OS.
3. ACI - for single container
4. AKS - for orch requirement
5. Azure Function: serverless compute power, Functions scale automatically, cost little when idle and are not ideal for long running processes

# VMSS,Availability sets and azure virtual desktop
1. VMSS: An azure compute service that lets deploying and managing identical (same image) load balanced VMs
- Vertical Scaling and Horizontal Scaling
2. Availability Sets are logical grouping of two or more VMs distributed across fault (Physical racks in Data centers) and update domains (used during planned maintenance)
3. Azure Arc: extends azure management capabilities to on-premises and multi-cloud VMs from single control plane

# App Hosting Optios
1. A PaaS designed specifically for hosting web applications and APIs
2. API Apps use the same web apps infrastructure but are designed to serve data rather than web pages.
3. Azure API Management: A service that sits in front of APis and acts as a gateway
- provides a single entry point for multiple backend APIs
- Handles authentication and authorization
- Rate limiting and throttling to prevent abuse
- Caching to improve performance
- Transform requests and responses
- provide analytics and monitoring
- Azure service plans defines a set of compute resources for a web app ro run
    - free and shared tiers:  No SLA
    - Basic tier: for dedicated compute instances, but no auto-scaling or deployment slots
    - Standard tier: can get auto- scaling up to 10 instances, deployment slots for staging, and daily backups 
    - Premium Tier: Offers enchanced performance, up to 30 instances, and additional scaling options
    - Isolated Tier: Runs app in a dedicated azure Virtual network, providing network isolation and maximum scale
    - with standard tier and above, users can configure auto-scale rules.
4. Summary
- Azure App Services is PaaS for hosting web apps and APIs without infrastructure management.
- App service plans determine compute resources and available features
- App services includes built-in load balancing, auto-scaling, HTTPS, and CI/CD
- Choose App services when you want managed hosting, automatic scaling, and minimal operational overheads
- Choose VMs when you need OS-level control or legacy app support
- Choose containers for portability and microservice orchestration

# VM Resource Requirement
- CPU-intensive workloads: A VM with more virtual CPUs or vCPUs
- Memory-heavy: More RAM
- Storage- heavy: A fast, high-throughput disks.
## Azure offers many VM sizes and families to match each of these needs
- B-Series(Budget): Economical burstable VMs ideal for idle workloads with occasional spikes
- D-Series(Daily use): General purpose VMs with balanced CPU and memory
- E-Series(Elephant Memory): Optimizeed for memory-intensive applications like SAP or in-memory analytics
- F-Series(Fast CPU): Compute-optimized VMs with high CPU-to-memory ratio
- M-Series(Massive memory): Massive memory VMs with up to 12TB of RAM.
## types of managed disks 
- Standard HDD
- Standard SDD
- Premium SDD
