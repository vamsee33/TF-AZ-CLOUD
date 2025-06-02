
````markdown
# 🚀 Terraform Deployment Setup Using Reusable Modules and GitHub Actions

This guide explains how to structure Terraform deployments using reusable modules and GitHub Actions with secure authentication via OIDC and federated credentials.

---

## 1️⃣ Create a New Repository for Reusable Modules

### ✅ Purpose:
Store common Terraform modules (e.g., `network`, `security`, `monitoring`, `storage`) in a single repo for reusability and consistency.

### 📝 Steps:
- Create a new Git repository (e.g., `terraform-modules`).
- Add each module in a separate folder inside this repo.
- For every change:
  - Commit the change.
  - Create a Git tag to version the module:
    ```bash
    git tag v1.0.0
    git push origin v1.0.0
    ```
  - This helps specify exact versions when reusing modules and allows easy rollback.

---

## 2️⃣ Add This Repo as a Submodule in Deployment Repo

### ✅ Purpose:
Link your shared modules into your actual deployment repository (e.g., `corenet`).

### 📝 Steps:
1. Navigate to the root of your deployment repo:
   ```bash
   cd <deployment-repo>
````

2. Add the module repo as a submodule:

   ```bash
   git submodule add <repo_url> modules/<module_name>
   ```
3. To clone a repo with submodules:

   ```bash
   git clone --recursive <repo_url>
   ```
4. After adding, check out the correct module version:

   ```bash
   cd modules/<module_name>
   git checkout <tag_version>
   ```

---

## 3️⃣ Use Reusable GitHub Actions Workflow for Deployment

### ✅ Purpose:

Simplify and unify GitHub Actions workflows using a reusable composite action.

### 📝 Steps:

* Create a reusable composite workflow YAML with common Terraform steps.
* Reference this composite YAML in your deployment workflow (e.g., `terraform.yml`).
* Benefits:

  * Cleaner workflows
  * Better consistency
  * Easier maintenance

---

## 4️⃣ Deploy to Management Group and Subscriptions (SPN with OIDC)

### ✅ Problem:

Terraform needs `ARM_SUBSCRIPTION_ID`, but it's not always available during management group deployments.

### ✅ Solution:

Use **OIDC login** with federated credentials and skip the need for client secrets or hardcoded subscription IDs.

### 📝 Steps:

1. Use `azure/login` with these inputs:

   ```yaml
   - name: Azure Login (OIDC)
     uses: azure/login@v1
     with:
       client-id: ${{ secrets.AZURE_CLIENT_ID }}
       tenant-id: ${{ secrets.AZURE_TENANT_ID }}
       allow-no-subscriptions: true
   ```

2. Set environment variable to disable validation:

   ```yaml
   env:
     ARM_PROVIDER_ENHANCED_VALIDATION: false
   ```

3. Set GitHub Action permissions:

   ```yaml
   permissions:
     id-token: write
     contents: read
   ```

---

## 4.1️⃣ How to Create Federated Credentials in Azure

### 🛠 Step-by-Step:

1. Go to **Azure Portal** > *App Registrations* > *Your SPN App*.
2. Click **Federated credentials** > **+ Add credential**.
3. Fill in the form:

   * **Issuer**: `https://token.actions.githubusercontent.com`
   * **Subject**: `repo:<org>/<repo>:ref:refs/heads/<branch>`
   * **Audience**: `api://AzureADTokenExchange`
4. Save.

> 🔒 Repeat this for each repository/branch that needs access.

---

## 5️⃣ Deploy to Resource Groups (With Specific Subscription)

### ✅ Purpose:

Deploy actual resources (e.g., storage accounts, VMs, networking) to a specific subscription.

### 📝 Steps:

* Reuse the OIDC login step, but this time **allow subscriptions**:

  ```yaml
  - name: Azure Login (With Subscription)
    uses: azure/login@v1
    with:
      client-id: ${{ secrets.AZURE_CLIENT_ID }}
      tenant-id: ${{ secrets.AZURE_TENANT_ID }}
      subscription-id: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
  ```

* Environment variables:

  ```yaml
  env:
    ARM_SUBSCRIPTION_ID: ${{ secrets.AZURE_SUBSCRIPTION_ID }}
  ```

