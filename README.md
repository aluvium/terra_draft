# terraform drafts
### Idea
With purpose to create drafts for deploying automated environments IaaC mainly for AWS cloud and  Docker, using Terraform.
- - -
### Content
##### Docker :  
* [__terraform-docker-nginx__](https://github.com/aluvium/terraform-drafts/tree/master/terraform-docker-nginx) - Delpoying a container using the docker enviroment. Pulling img from docker hub.
* [__terraform-docker-nginx-proxy__](https://github.com/aluvium/terraform-drafts/tree/master/terraform-docker-nginx-proxy) - Two containter one with an app second as a proxy. Pulling from a docker hub.
* [__terraform-docker-custom__](https://github.com/aluvium/terraform-drafts/tree/master/terraform-docker-custom) - Applaying docker container using for e.g. docker inspect output as container resource.

##### aws : 
* [__terraform-ec2_local__](https://github.com/aluvium/terraform-drafts/tree/master/terraform-aws-ec2_local) - Bare EC2 instance using local credentials.
* [__terraform-ec2_cloud__](https://github.com/aluvium/terraform-drafts/tree/master/terraform-aws-ec2_cloud) - Bare EC2 instance using credentials from cloud.
* [__terraform-aws-vpc__](https://github.com/aluvium/terraform-drafts/tree/master/terraform-aws-vpc) - VPC, EC2 instances - both took from terraform-aws-modules. Creds from cloud.
* [__terraform-aws-static-web-s3__](https://github.com/aluvium/terraform-drafts/tree/master/terraform-aws-static-web-s3) - VPC, EC2 instances - both took from terraform-aws-modules. Bucket S3 - own module. Creds from cloud.
- - - - - 
### Usage 
    git clone https://github.com/aluvium/terraform-drafts.git
    terraform init && terraform apply
### Contributions
https://learn.hashicorp.com
