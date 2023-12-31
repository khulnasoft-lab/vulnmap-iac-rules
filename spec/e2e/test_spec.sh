#!/bin/bash

Describe './vulnmap-iac-rules test --help'
   It 'returns passing test status'
      When call ./vulnmap-iac-rules test --help
      The status should be success
      The output should include 'Usage:
  vulnmap-iac-rules test [path...] [flags]

Flags:
      --explain {fails,full,notes}   enable query explanations (default fails)
  -h, --help                         help for test
      --ignore strings               set file and directory names to ignore during loading (default [.*,fixtures])
  -r, --run string                   run only test cases matching the regular expression
      --timeout duration             set test timeout (default 5s)
  -v, --verbose                      set verbose logging mode'
   End
End

Describe './vulnmap-iac-rules test ./fixtures/custom-rules'
   It 'returns passing test status'
      When call ./vulnmap-iac-rules test ./fixtures/custom-rules
      The status should be success
      The output should include 'PASS: 4/4'
      The output should not include 'WARNING: The command must point at a folder that contains the package for the rules'
   End
End

Describe './vulnmap-iac-rules test ./fixtures/custom-rules --run test_CUSTOM_1'
   It 'returns passing test status'
      When call ./vulnmap-iac-rules test ./fixtures/custom-rules --run test_CUSTOM_1
      The status should be success
      The output should include 'PASS: 1/1'
      The output should not include 'WARNING: The command must point at a folder that contains the package for the rules'
   End
End

Describe './vulnmap-iac-rules test ./fixtures --run test_CUSTOM_1'
   It 'returns passing test status'
      When call ./vulnmap-iac-rules test ./fixtures --run test_CUSTOM_1
      The status should be success
      The output should include 'WARNING: The command must point at a folder that contains the package for the rules'
   End
End

Describe './vulnmap-iac-rules test ./fixtures/custom-rules/rules ./fixtures/custom-rules/lib'
   It 'returns passing test status'
      When call ./vulnmap-iac-rules test ./fixtures/custom-rules/rules ./fixtures/custom-rules/lib
      The status should be success
      The output should include 'PASS: 4/4'
      The output should not include 'WARNING: The command must point at a folder that contains the package for the rules'
   End
End
