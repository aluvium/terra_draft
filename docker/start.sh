#!/bin/bash
terraform init && terraform apply || echo "Something went wrong - check the *.tf files."
