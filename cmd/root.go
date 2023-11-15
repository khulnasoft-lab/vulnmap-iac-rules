package cmd

import (
	"github.com/spf13/cobra"
)

var version string = "dev"

// RootCommand is the base CLI command that all subcommands are added to.
var RootCommand = NewRootCmd()

func NewRootCmd() cobra.Command {
	rootCommand := cobra.Command{
		Use:   "vulnmap-iac-rules",
		Short: "Vulnmap IaC Custom Rules",
		Long: `SDK to write, debug, test, and bundle custom rules for Vulnmap Infrastructure as Code.

Not sure where to start?

1. Run the following command to learn how to generate a scaffolded rule:
$ vulnmap-iac-rules template --help

2. Run the following command to learn how to parse a file into the JSON structure that Rego understands:
$ vulnmap-iac-rules parse --help

3. Run the following command to learn how to test a Rego rule:
$ vulnmap-iac-rules test --help

4. Run the following command to learn how to build the bundle for the Vulnmap IaC CLI:
$ vulnmap-iac-rules build --help

5. Verify your bundle locally using the Vulnmap IaC CLI:
$ vulnmap iac test --rules --help

6. Run the following command to learn how to push the bundle to an OCI Registry:
$ vulnmap-iac-rules push --help

7. Use the bundle stored in the OCI registry in the Vulnmap IaC CLI:
$ vulnmap --help

See our documentation to learn more:
https://docs.vulnmap.khulnasoft.com/products/vulnmap-infrastructure-as-code/custom-rules
`,
		Version: version,
	}
	rootCommand.CompletionOptions.DisableDefaultCmd = true
	return rootCommand
}
