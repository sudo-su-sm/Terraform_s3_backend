# Terraform S3 Backend Setup

A simple demo project showing how to set up AWS Terraform backend with S3 and DynamoDB for state management and locking.

## Project Overview

This Terraform configuration creates the necessary AWS infrastructure to store and manage Terraform state files safely with locking capabilities.

## What Gets Created

- **S3 Bucket** - Stores the Terraform state files
- **S3 Versioning** - Enables version history for state files
- **DynamoDB Table** - Provides state file locking mechanism

## Why This Approach

- **Dynamic Variables** - All hardcoded values are parameterized for flexibility
- **Easy Customization** - Change values in `terraform.tfvars` without touching code
- **Prevent Accidental Deletion** - Lifecycle rules prevent destroying critical resources
- **State Locking** - DynamoDB prevents concurrent state modifications

## Project Structure

```
├── main.tf              # AWS resource definitions
├── variable.tf          # Variable declarations with defaults
├── output.tf            # Output values
├── terraform.tfvars     # Variable values for apply
└── README.md            # This file
```

## How to Use

1. **Configure AWS credentials** on your machine
2. **Update `terraform.tfvars`** if needed with custom values
3. **Run Terraform**
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```

## Key Features

- ✅ Fully parameterized configuration
- ✅ Attribute name matches hash_key dynamically
- ✅ Prevents accidental resource destruction
- ✅ Clean, readable Terraform code
- ✅ AWS region configurable via variables
- ✅ `force_destroy` enabled for easy demo cleanup

## Force Destroy

The S3 bucket has `force_destroy = true` to allow complete deletion of bucket contents during `terraform destroy`. This is useful for demo/test environments to avoid lingering resources and AWS charges.

## Variables

| Variable | Default | Purpose |
|----------|---------|---------|
| `region` | us-east-1 | AWS region |
| `bucket_name` | s3-backend-bucket-terraform-eks | S3 bucket name |
| `dynamodb_table_name` | terraform-lock-table | DynamoDB table name |
| `billing_mode` | PAY_PER_REQUEST | DynamoDB billing mode |
| `hash_key` | LockID | DynamoDB partition key |

## Outputs

- `s3_bucket_name` - Name of the created S3 bucket
- `dynamodb_table_name` - Name of the created DynamoDB table

Thanks and Regards,
Sanket Muli (sudo-su-sm)
