TF_PLAN_FILE := "tfplan"
STACK_FOLDER := stacks

.DEFAULT_GOAL := help

help: # Show this help
	@egrep -h '\s#\s' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m$(STACK)-20s\033[0m $(STACK)s\n", $$1, $$2}'

format-write: # Fix format on all .tf files
	terraform fmt -recursive -no-color

format-check: # Check format on all .tf file without modificaiton
	terraform fmt -recursive -check -diff -no-color

## Init
init: # Initialise terraform backend on a given environment: `make init-live`
	terraform -chdir=$(STACK_FOLDER)/$(STACK) init -no-color

## Validate
validate: # Validate  terraform backend on a given environment: `make validate-live`
	terraform -chdir=$(STACK_FOLDER)/$(STACK) validate -no-color

## Plan
plan: # Run terraform plan on a given environemtn `make plan-live`
	terraform -chdir=$(STACK_FOLDER)/$(STACK) plan -out=$(TF_PLAN_FILE) -no-color

## Show Plan
show: # Show terraform plan (provided there is a `tfplan` file) on a given environemtn: `make show-live`
	terraform -chdir=$(STACK_FOLDER)/$(STACK) show $(TF_PLAN_FILE)

## Apply
apply: # Apply terraform on a given environemtn: `make apply-live`
	terraform -chdir=$(STACK_FOLDER)/$(STACK) apply $(TF_PLAN_FILE)