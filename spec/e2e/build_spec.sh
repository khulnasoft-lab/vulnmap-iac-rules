#!/bin/bash

cleanup() { rm bundle.tar.gz; }
AfterAll 'cleanup'

Describe './vulnmap-iac-rules build --help'
   It 'returns passing test status'
      When call ./vulnmap-iac-rules build --help
      The status should be success
      The output should include 'Usage:
  vulnmap-iac-rules build [path...] [flags]

Flags:
  -c, --capabilities string   set configurable set of OPA capabilities
  -e, --entrypoint string     set slash separated entrypoint path (default "rules/deny")
  -h, --help                  help for build
      --ignore strings        set file and directory names to ignore during loading (default [.*,fixtures,testing,*_test.rego])
  -o, --output string         set the output filename (default "bundle.tar.gz")
  -t, --target {rego,wasm}    set the output bundle target type (default wasm)'
   End
End

Describe './vulnmap-iac-rules build ./fixtures/custom-rules --ignore testing --ignore "*_test.rego"'
   It 'returns passing test status'
      When call ./vulnmap-iac-rules build ./fixtures/custom-rules --ignore testing --ignore "*_test.rego"
      The status should be success
      The output should include 'Generated bundle: bundle.tar.gz'
      The output should not include 'WARNING: The command must point at a folder that contains the package for the rules'
   End
End

Describe './vulnmap-iac-rules build ./fixtures --ignore testing --ignore "*_test.rego"'
   It 'returns passing test status'
      When call ./vulnmap-iac-rules build ./fixtures --ignore testing --ignore "*_test.rego"
      The status should be success
      The output should include 'Generated bundle: bundle.tar.gz'
      The output should include 'WARNING: The command must point at a folder that contains the package for the rules'
   End
End

Describe './vulnmap-iac-rules build ./fixtures/custom-rules/rules ./fixtures/custom-rules/lib --ignore testing --ignore "*_test.rego"'
   It 'returns passing test status'
      When call ./vulnmap-iac-rules build ./fixtures/custom-rules/rules ./fixtures/custom-rules/lib --ignore testing --ignore "*_test.rego"
      The status should be success
      The output should include 'Generated bundle: bundle.tar.gz'
      The output should not include 'WARNING: The command must point at a folder that contains the package for the rules'
   End
End
