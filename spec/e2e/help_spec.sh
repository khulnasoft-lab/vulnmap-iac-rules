#!/bin/bash
Describe './vulnmap-iac-rules'
  It 'returns help info'
    When call ./vulnmap-iac-rules
    The status should be success
    The output should include 'Usage:
  vulnmap-iac-rules [command]

Available Commands:
  build       Build an OPA bundle
  help        Help about any command
  parse       Parse a fixture into JSON format
  push        Push generated bundle
  template    Template a new rule
  test        Execute Rego test cases

Flags:
  -h, --help      help for vulnmap-iac-rules
  -v, --version   version for vulnmap-iac-rules

Use "vulnmap-iac-rules [command] --help" for more information about a command.'
  End
End
