#!/usr/local/bin/bash

PROFILE=$1

REGIONS=$'us-east-1\nus-west-2\neu-west-1\neu-central-1\nap-northeast-1\nap-southeast-2'
#REGIONS=$(aws ec2 describe-regions --query 'Regions[*].RegionName' --output text)

for region in $REGIONS; do
	echo Creating stack for region $region

	aws cloudformation create-stack --stack-name Auto-Tag-S3 --template-body file:////Users//dnorth//encrypted//src//github//aws-auto-tagger//AutoTag-S3.json --capabilities CAPABILITY_IAM --region $region --profile $PROFILE
	aws cloudformation create-stack --stack-name Auto-Tag-EC2 --template-body file:////Users//dnorth//encrypted//src//github//aws-auto-tagger//AutoTag-EC2.json --capabilities CAPABILITY_IAM --region $region --profile $PROFILE

done
