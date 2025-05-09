## Terraform Azure Platform
### 📁 Project Structure

```markdown
terraform-project/
├── .github/
│   └── workflows/
│       └── terraform-ci.yml             # GitHub Actions workflow for CI/CD
│
├── modules/                             # Reusable infrastructure modules
│   ├── resource_group/                  # Module for Azure Resource Group
│   ├── subscription/                    # Module for Subscription-level resources
│   ├── management_group/                # Module for Azure Management Group
│   └── managementgroup_sub_association/ # Module to associate subscription to MG
│
├── resource_groups/                      # Top-level deployment using RG module
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── outputs.tf
│
├── subscriptions/                        # Deployment for subscription config
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── outputs.tf
│
├── management_groups/                    # Deployment for management groups and associations
│   ├── main.tf
│   ├── variables.tf
│   ├── terraform.tfvars
│   └── outputs.tf
│
├── versions.tf                          # Required Terraform and provider versions
├── backend.tf                           # Remote state backend config
└── README.md                            # This file
```

---

### 🧭 Module Overview

* `modules/resource_group/`: Creates and manages Azure Resource Groups
* `modules/subscription/`: Manages subscription-level configurations (e.g., RBAC, policy)
* `modules/management_group/`: Provisions Azure Management Groups
* `modules/managementgroup_sub_association/`: Links subscriptions to management groups

---

### 🔧 CI/CD

Terraform workflows are automated using [GitHub Actions](https://github.com/features/actions). The workflow is defined in `.github/workflows/terraform-ci.yml`.

---