package main

import (
	"os"

	"github.com/khulnasoft-lab/vulnmap-iac-rules/builtins"
	"github.com/khulnasoft-lab/vulnmap-iac-rules/cmd"
)

func main() {
	builtins.RegisterHCLBuiltin()
	builtins.RegisterYAMLBuiltin()
	builtins.RegisterTerraformPlanBuiltin()

	if err := cmd.RootCommand.Execute(); err != nil {
		os.Exit(1)
	}
}
