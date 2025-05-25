## Terraform Azure Platform
### 📁 Project Structure

```text
TF-AZ-CLOUD/
├── README.md                        # Project documentation (this file)
├── versions.tf                      # Required Terraform and provider versions
├── backend.tf                       # Remote state backend config
│
├── modules/                         # Reusable infrastructure modules
│   ├── resource_group/              # Module for Azure Resource Group
│   ├── subscription/                # Module for Subscription-level resources
│   ├── management_group/            # Module for Azure Management Group
│   ├── mg_subscription_association/ # Module to associate subscription to MG
│   ├── eventhub/                    # Event Hub related modules
│   │   ├── eventhub_namespace/      # Event Hub Namespace module
│   │   ├── eventhub_hub/            # Event Hub instance module
│   │   ├── eventhub_authorization_rule/ # Event Hub Auth Rule module
│   │   ├── namespace_authorization_rule/ # Namespace Auth Rule module
│   │   ├── evh_consumer_group/      # Event Hub Consumer Group module
│   │   └── ...                      # Other Event Hub modules
│   ├── loganalytics/                # Log Analytics related modules
│   │   ├── log_analytics_workspace/ # Log Analytics Workspace module
│   │   ├── law_data_export/         # Log Analytics Data Export module
│   │   ├── loganalytics_solution/   # Log Analytics Solution module
│   │   └── ...                      # Other Log Analytics modules
│   ├── network/                     # Networking related modules
│   │   ├── virtual_network/         # Virtual Network module
│   │   ├── subnet/                  # Subnet module
│   │   ├── network_security_group/  # NSG module
│   │   ├── route_table/             # Route Table module
│   │   ├── private_dns_zone/        # Private DNS Zone module
│   │   ├── private_dns_vnet_link/   # Private DNS vNet Link module
│   │   ├── network_ddos_plan/       # DDOS Plan module
│   │   ├── subnet_nsg_association/  # Subnet-NSG Association module
│   │   ├── route_subnet_association/# Route-Subnet Association module
│   │   ├── virtual_peering/         # vNet Peering module
│   │   └── ...                      # Other networking modules
│   └── ...                          # Other modules
│
├── application_01/                  # Example application environment
│   ├── data.tf                      # Data sources
│   ├── ddos_plan.tf                 # DDOS Plan deployment
│   ├── eventhubs.tf                 # Event Hub deployment
│   ├── loganalytics.tf              # Log Analytics deployment
│   ├── networking.tf                # Networking deployment
│   ├── private_dns.tf               # Private DNS deployment
│   ├── variables.tf                 # Variables for this environment
│   └── versions.tf                  # Provider versions for this environment
│
├── resource_groups/                 # Top-level deployment using RG module
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── outputs.tf
│
├── subscriptions/                   # Deployment for subscription config
│   ├── data.tf
│   ├── locals.tf
│   ├── main.tf
│   └── versions.tf
│
├── management_groups/               # Deployment for management groups and associations
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── outputs.tf
```

---

### 🧭 Module Overview

* `modules/resource_group/`: Creates and manages Azure Resource Groups
* `modules/subscription/`: Manages subscription-level configurations (e.g., RBAC, policy)
* `modules/management_group/`: Provisions Azure Management Groups
* `modules/mg_subscription_association/`: Links subscriptions to management groups
* `modules/eventhub/`: Event Hub and related modules
* `modules/loganalytics/`: Log Analytics and related modules
* `modules/network/`: Networking, DNS, NSG, DDOS, and related modules

---

### 🔧 CI/CD

Terraform workflows are automated using [GitHub Actions](https://github.com/features/actions). The workflow is defined in `.github/workflows/terraform-ci.yml`.

---