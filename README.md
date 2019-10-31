# aws-auto-tagger
Auto tags AWS EC2,EBS and S3 resourcces with an email address

This is essentially a fork of the excellent solution detailed in Alessandro Martini's [AWS blog post](https://blogs.aws.amazon.com/security/post/Tx150Z810KS4ZEC/How-to-Automatically-Tag-Amazon-EC2-Resources-in-Response-to-API-Events) with just a modification to add a tag for an email address.

# Purpose
Adds tags to EC2 instance, EBS volumes or S3 buckets identifying who has created the resource by their AWS login.  It also takes the AWS login name and appends an email suffix (ie. @foo.com) in order to generate a tag with an email address of the resource creator.  This is helpful for other tools that send email notifications to the owner (a janitor for example)

# Usage

Use the appropriate Cloudformation template (EC2 and/or S3) and create a new cloudformation stack in each region you wish to have resources auto-tagged.  This will then add a lambda function and a cloudwatch event to listen for specific actions.  Alas, this only works in regions where Lambda and Cloudwatch events are available :(

NOTE: You must have cloudtrail enabled in each region you wish to utilize this.


# Parameters

* emailSuffix - The suffix (including the @) which is appended to the AWS username to form an email address
* emailTagName - the name of the tag that will be added to resources which will then contain the email address.
