package main

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/gruntwork-io/terratest/modules/test-structure"
	"testing"
)

func teardown(t *testing.T, tfDir string) {
	tfOpts := test_structure.LoadTerraformOptions(t, tfDir)
	defer terraform.Destroy(t, tfOpts)
}

func deploy(t *testing.T, tfDir string, tfVars map[string]interface{}) {
	tfOpts := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: tfDir,
		Vars:         tfVars,
	})
	test_structure.SaveTerraformOptions(t, tfDir, tfOpts)
	terraform.InitAndApply(t, tfOpts)
}
