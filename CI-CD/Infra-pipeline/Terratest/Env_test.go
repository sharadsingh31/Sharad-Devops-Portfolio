package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestTerraformEnv(t *testing.T) {

	env := os.Getenv("TF_ENV")
	if env == "" {
		t.Fatal("TF_ENV is not set (Dev / QA)")
	}

	// retryable errors in terraform testing.
	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../../Environment/" + env, //teraform directory path
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	//output := terraform.Output(t, terraformOptions, "resource_group_name")
	//assert.Equal(t, "sharadrg2", output)
}