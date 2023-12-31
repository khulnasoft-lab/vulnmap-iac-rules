#!/bin/bash

Describe './vulnmap-iac-rules parse --help'
	It 'returns passing test status'
		When call ./vulnmap-iac-rules parse --help
		The status should be success
		The output should include 'Usage:
  vulnmap-iac-rules parse <path> [flags]

Flags:
  -f, --format {hcl2,yaml,tf-plan}   choose the format for the parser (default hcl2)
  -h, --help                         help for parse'
	End
End

Describe './vulnmap-iac-rules parse ./fixtures/custom-rules/rules/CUSTOM-1/fixtures/test.tf --format fake'
	It 'returns passing test status'
		When call ./vulnmap-iac-rules parse ./fixtures/custom-rules/rules/CUSTOM-1/fixtures/test.tf --format fake
		The status should be failure
		The stderr should include 'invalid argument "fake" for "-f, --format" flag'
	End
End

Describe './vulnmap-iac-rules parse ./fixtures/custom-rules/rules/CUSTOM-1/fixtures/test.tf'
	It 'returns passing test status'
		When call ./vulnmap-iac-rules parse ./fixtures/custom-rules/rules/CUSTOM-1/fixtures/test.tf
		The status should be success
		The output should include '{
	"resource": {
		"aws_security_group": {
			"denied": {
				"description": "Allow SSH inbound from anywhere",
				"ingress": {
					"cidr_blocks": [
						"0.0.0.0/0"
					],
					"from_port": 22,
					"protocol": "tcp",
					"to_port": 22
				},
				"name": "allow_ssh",
				"vpc_id": "${aws_vpc.main.id}"
			}
		}
	}
}'
	End
End

Describe './vulnmap-iac-rules parse ./fixtures/custom-rules/rules/CUSTOM-1/fixtures/test.tf --format hcl2'
	It 'returns passing test status'
		When call ./vulnmap-iac-rules parse ./fixtures/custom-rules/rules/CUSTOM-1/fixtures/test.tf --format hcl2
		The status should be success
		The output should include '{
	"resource": {
		"aws_security_group": {
			"denied": {
				"description": "Allow SSH inbound from anywhere",
				"ingress": {
					"cidr_blocks": [
						"0.0.0.0/0"
					],
					"from_port": 22,
					"protocol": "tcp",
					"to_port": 22
				},
				"name": "allow_ssh",
				"vpc_id": "${aws_vpc.main.id}"
			}
		}
	}
}'
	End
End

Describe './vulnmap-iac-rules parse ./fixtures/custom-rules/rules/CUSTOM-3/fixtures/test.yaml --format yaml'
	It 'returns passing test status'
		When call ./vulnmap-iac-rules parse ./fixtures/custom-rules/rules/CUSTOM-3/fixtures/test.yaml --format yaml
		The status should be success
		The output should include '{
	"apiVersion": "v1",
	"kind": "Service",
	"metadata": {
		"name": "using-external-ip-default"
	},
	"spec": {
		"externalIPs": [
			"1.1.1.1"
		],
		"ports": [
			{
				"name": "http",
				"port": 80,
				"protocol": "TCP",
				"targetPort": 8080
			}
		],
		"selector": {
			"app": "MyApp"
		}
	}
}'
	End
End

Describe './vulnmap-iac-rules parse ./fixtures/custom-rules/rules/CUSTOM-4/fixtures/test.json.tfplan --format tf-plan'
	It 'returns passing test status'
		When call ./vulnmap-iac-rules parse ./fixtures/custom-rules/rules/CUSTOM-4/fixtures/test.json.tfplan --format tf-plan
		The status should be success
		The output should include '{
	"data": {},
	"resource": {
		"aws_vpc": {
			"example": {
				"assign_generated_ipv6_cidr_block": false,
				"cidr_block": "10.0.0.0/16",
				"enable_dns_support": true,
				"instance_tenancy": "default",
				"tags": null
			}
		}
	}
}'
	End
End
