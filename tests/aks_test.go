package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

// TestDevPlan validates that the dev environment produces a valid plan.
func TestDevPlan(t *testing.T) {
	t.Parallel()

	opts := &terraform.Options{
		TerraformDir: "../environments/dev",
		VarFiles:     []string{"terraform.tfvars"},
		NoColor:      true,
	}

	terraform.Init(t, opts)
	plan := terraform.Plan(t, opts)
	assert.Contains(t, plan, "azurerm_kubernetes_cluster")
}
