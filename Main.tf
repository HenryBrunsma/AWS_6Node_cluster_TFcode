terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 5.0"
      }
    }
}
provider "aws" {
    region = "us-east-1"
}

resource "aws_key_pair" "generated_k8_KeyPair" {
  key_name   = "K8_Node_KeyPair"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDLS7WusJkeuxyppbpyWR7vhmbTWnsgYmOFjewTgy5lU9TGOi7NGqXqVu7jM6X3p7tmLCVbkqylKn7qJ31CEBB9Yc+Fjip2W0zRsPiqEsKVim/YRhm5kKhS1SiHc58f264p6BI9Wqfv1tkyndbbP/4FshVB8v/IG1fexfSv6Ewjs9+wRo+Xpg9XwlA52LJMXtq1peWLWrRk7qocII+/C/WU6p/lvQjCqLNnCk62nxyZN4VU+Cs49hKWLXvmz3kZQD/CMpA9h4apDi5NNriHl+r0nESXw6OhNY193oscw6ObAvv3y0aaog0BQvkNJER9ZvCSDgcys3749vqZqJASkh4o4yEqool74wfpVL1iIbVyGQ0r4ctzOJ1+tpBJ8n0xl3rtZDYiPgWbj/7NIYDTq7urMZK1enqDVIkrPuGO37EYON956g+JJc7G01U2VRiR7CZvdUyFz/0cJ+O+MNsLtHxq729Qo6ycLRmLIVWMt/qMBhcf+Bx8RZTUwvB5R2FTqmO/jujD32bkVOyoQsMxiRjR4YsbNW5QXbgTD1TozkxiH/7lC0fsmlz717CN1N/xh/NssVGuouTGXZp6op0vfsTCiz/wS/y2Tx/FPEuRM0+o8ViP1x+b8bWg6hdQ6V3nog8nDjEj+mfaeCKffrj20Da4a53x5XJ05Y2JKetC9sbzQQ== henry.brunsma@gmail.com"
}