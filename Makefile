# deprecated

TF_PLAN_FILE := "tfplan"
STACK_FOLDER := stacks

.DEFAULT_GOAL := help

help: # Show this help
	@egrep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

format-write: # Fix format on all .tf files
	terraform fmt -recursive -no-color

format-check: # Check format on all .tf file without modificaiton
	terraform fmt -recursive -check -diff -no-color

list-environment: # List environments
	@ls -1 $(STACK_FOLDER)
	@echo "### global environments(make <init,plan,apply>-global-<env>): ###"
	@ls -1 $(STACK_FOLDER)/global

## Init
init-%: # Initialise terraform backend on a given environment: `make init-live`
	terraform -chdir=$(STACK_FOLDER)/$* init -no-color

## Validate
validate-%: # Validate  terraform backend on a given environment: `make validate-live`
	terraform -chdir=$(STACK_FOLDER)/$* validate -no-color

## Plan
plan-%: # Run terraform plan on a given environemtn `make plan-live`
	terraform -chdir=$(STACK_FOLDER)/$* plan -out=$(TF_PLAN_FILE) -no-color

## Show Plan
show-%: # Show terraform plan (provided there is a `tfplan` file) on a given environemtn: `make show-live`
	terraform -chdir=$(STACK_FOLDER)/$* show $(TF_PLAN_FILE)

## Apply
apply-%: # Apply terraform on a given environemtn: `make apply-live`
	terraform -chdir=$(STACK_FOLDER)/$* apply $(TF_PLAN_FILE)