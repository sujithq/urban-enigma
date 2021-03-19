#!/bin/bash

terraform init

terraform validate

terraform plan -var-file=variables.tfvars -out out.plan

terraform apply out.plan