<p align="center">
  <a href="" rel="noopener">
</p>

<h1 align="center">Terraform Push</h1>

<div align="center">

  [![Status](https://img.shields.io/badge/status-active-success.svg)]() 
  [![GitHub Issues](https://img.shields.io/github/issues/MassimilianoDH/terraform-push.svg)](https://github.com/MassimilianoDH/terraform-push/issues)
  [![GitHub Pull Requests](https://img.shields.io/github/issues-pr/MassimilianoDH/terraform-push.svg)](https://github.com/MassimilianoDH/terraform-push/issues)
  [![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

</div>

---

<p align="center"> This is Terraform Push, a completely automated Multi-Cloud GitOps CI for Terraform.
    <br> 
</p>

## 📝 Table of Contents
- [About](#about)
- [Pre-Requisites](#prerequisites)
- [Set-Up](#setup)
- [Usage](#usage)
- [TODO](../master/TODO.md)
- [Built Using](#built_using)
- [Authors](#authors)
- [Acknowledgments](#acknowledgement)

## 🧐 About <a name = "about"></a>
Terraform Push is a repository template capable of creating a fully functional GitOps CI for Hashicorp Terraform. With minimal set-up, this CI can deploy Terraform resources to single OR multiple cloud providers in a secure and concurrent pipeline. Once in working condition, users can add Terraform configuration files to the desired directories, and it will be applied automatically after pushing or merging them to Master.

### Features <a name = "features"></a>

- Automatic Change Detection
- Terraform Plan on Pull Requests
- Resource Creation on Push-to-Master
- Automatic Resource Destruction

## 🏁 Pre-Requisites <a name = "prerequisites"></a>

- Basic understanding of GitHub Actions and Secrets
- Basic knowledge of Hashicorp Terraform
- At least ONE working cloud provider account (GCP, Azure, AWS)

## 🚀 Set-Up <a name = "setup"></a>
### Repository (required) <a name = "repository"></a>
The first step of this process is to create a GitHub repository using Terraform Push as a template. In the top right corner of this repo, you will find a green button to use this template. Press it and follow the repository creation form.

### Bootstrap (optional) <a name = "bootstrap"></a>
Since our Terraform client will be running on a GitHub-provided container, we need a remote backend to keep track of Terraform state files. Use the Terraform configuration files found inside terraform-push/bootstrap to create a working backend on your desired cloud provider. You need an authenticated cloud provider account for this to work. If you already have one working backend, skip this step. Terraform Push should be able to store state files in an existing backend.

### Secrets (required/optional) <a name = "secrets"></a>
GitHub secrets are a secure way to pass the necessary credentials to authenticate this CI. Only add the secrets required for your preferred cloud provider(s). You may also add an SSH private key for SSH authentication. On the newly created repository, go to: Settings > Secrets > Actions. Press 'New repository secret' and add the following secrets:

#### Common (required)
- PAT_TOKEN: Personal Access Token used to log into Pull Requests and comment Terraform Plan output. More information on [Creating a Personal Access Token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).

- SSH_PRIVATE_KEY: SSH private key used to log into private git repositories. Needed to access private Terraform Modules. More information on [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh).

#### Google Cloud (optional)
- GCP_SERVICE_ACCOUNT_KEY: Google Service Account key generated by Google Cloud. More information on how to [Create and Manage Service Account Keys](https://cloud.google.com/iam/docs/creating-managing-service-account-keys).

#### Azure (optional)
- AZR_DEPLOYMENT_CREDENTIALS: Azure deployment credentials generated by Azure CLI. More information on how to [Configure a Service Principal with a Secret](https://github.com/Azure/login#configure-a-service-principal-with-a-secret).

- AZR_CLIENT_SECRET: Azure client secret generated by Azure CLI. More information on how to [Configure a Service Principal with a Secret](https://github.com/Azure/login#configure-a-service-principal-with-a-secret).

#### Amazon Web Services (optional)
- AWS_ACCESS_KEY: AWS IAM User key generated by Amazon Web Services. More information on [Managing access keys for IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html).

- AWS_SECRET_KEY: AWS IAM User key secret generated by Amazon Web Services. More information on [Managing access keys for IAM users](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html).

- AWS_REGION: Preferred Amazon Web Services Region.

### Machine User (optional) <a name = "machineuser"></a>
A GitHub user is necessary to make comments on Pull Requests. These comments will contain the proposed plan generated by Terraform. This can be done using your personal Github Account (not recommended) or it can be done using a Github Machine User. A machine user is no more than a dummy GitHub account that is granted write access on a per-repository basis. Use this account when adding [PAT_TOKEN](###secrets).

## 🎈 Usage <a name="usage"></a>
Add your Terraform configuration files contained inside a directory to any sub-directory inside terraform-push/stacks. The name of the sub-directories inside terraform-push/stacks does not affect the functioning of this CI. 

Example: terraform-push/stacks/foo/bar/main.tf


## ⛏️ Built Using <a name = "built_using"></a>
- [GitOps](https://about.gitlab.com/topics/gitops/) - Base
- [Github Actions](https://github.com/features/actions/) - Pipeline
- [GNU Bash](https://www.gnu.org/software/bash/) - Scripting
- [jq](https://stedolan.github.io/jq/) - Scripting
- [Hashicorp Terraform](https://www.terraform.io/)) - Base
- [Google Cloud](https://cloud.google.com/) - Cloud
- [Microsoft Azure](https://azure.microsoft.com/en-us/) - Cloud
- [Amazon Web Services](https://aws.amazon.com/) - Cloud
- [GNU Make](https://www.gnu.org/software/make/manual/make.html)

## ✍️ Authors <a name = "authors"></a>
- [@MassimilianoDH](https://github.com/MassimilianoDH) - Idea & Initial Work

See also the list of [contributors](https://github.com/MassimilianoDH/terraform-push/contributors) who participated in this project.

## 🎉 Acknowledgements <a name = "acknowledgement"></a>
- Hat tip to anyone whose code was used