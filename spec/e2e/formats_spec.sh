#!/bin/bash

setupTmp() { mkdir tmp; }
cleanupTmp() { rm -rf ./tmp; }

Describe 'Verifies custom rules for all formats'
    Parameters
        "hcl2" ".tf"
        "json" ".json"
        "yaml" ".yaml"
        "tf-plan" ".json.tfplan"
    End

    BeforeEach setupTmp
    AfterEach cleanupTmp
    It "Format: $1"
        vulnmap_iac_test() {
            cd tmp

            # create a basic rule
            ../vulnmap-iac-rules template --rule CONTRACT --format "$1"

            if [ "$1" != "json" ]; then
                ../vulnmap-iac-rules parse ./rules/CONTRACT/fixtures/denied"$2" --format "$1"
                ../vulnmap-iac-rules parse ./rules/CONTRACT/fixtures/allowed"$2" --format "$1"
            fi

            # run tests and make sure they pass
            ../vulnmap-iac-rules test

            # create bundle
            ../vulnmap-iac-rules build --ignore "testing" --ignore "*_test.rego" 
        }

        When call vulnmap_iac_test "$1" "$2"
        The status should eq 0
        The output should include "Generated template" # the rule was tempalted successfully
        The output should include "PASS: 1/1" # the tests passed
        The output should include "Generated bundle: bundle.tar.gz" # the bundle has been generated
        The stderr should not be present

        cd ../
    End
End
