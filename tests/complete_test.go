package main

import (
	"github.com/gruntwork-io/terratest/modules/test-structure"
	"testing"
)

func TestEcr(t *testing.T) {
	t.Parallel()

	ecrTfDir := "../examples/complete"

	defer test_structure.RunTestStage(t, "teardown", func() { teardown(t, ecrTfDir) })
	test_structure.RunTestStage(t, "deploy", func() { deploy(t, ecrTfDir, map[string]interface{}{}) })
}
