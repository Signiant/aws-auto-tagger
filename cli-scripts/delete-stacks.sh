#!/bin/bash

PROFILE=$1

REGIONS=$'us-east-1\nus-west-2\neu-west-1\neu-central-1\nap-northeast-1\nap-southeast-2'
#REGIONS=$(aws ec2 describe-regions --query 'Regions[*].RegionName' --output text)

#setopt shwordsplit
for region in $REGIONS; do
	echo Deleting stacks for region $region

	aws cloudformation delete-stack --stack-name Auto-Tag-S3  --region $region --profile $PROFILE
	aws cloudformation delete-stack --stack-name Auto-Tag  --region $region --profile $PROFILE

done
