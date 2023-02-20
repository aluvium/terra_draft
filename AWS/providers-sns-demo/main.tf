# for log puprpose
# export TF_LOG=TRACE
# for disable log
# export TF_LOG=
################################################
## PROVIDER
## alias when we have more then one provider
################################################
provider "aws" {
  region = "eu-central-1"
  alias = "eu-central-1"
}
provider "aws" {
  region = "eu-west-1"
  alias = "eu-west-1"
}


################################################
## RESOURCE
################################################
resource aws_sns_topic "topic-eu-central" {
  provider = aws.eu-central-1
  name = "topic-eu-cental"
}


resource aws_sns_topic "topic-eu-west" {
  provider = aws.eu-west-1
  name = "topic-eu-west"
}
