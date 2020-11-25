# jenkins-scheduled-s3-backup

Jenkins pipeline to automate the backup of the jenkins home directory to a configured AWS S3 bucket.

## Prerequisites
- An AWS account
- A Jenkins instance
- Terraform
- Terragrunt

## Config
The automated backup needs to know four things.
- Your AWS Credentials
- Jenkins home directory location
- If backups should be replaced or versioned
- The frequency of backups

## Jenkinsfile
The jenkins file is used by your jenkins instance to orchestrate a set of discrete tasks.
They are to:
- Ensure the S3 bucket exists on your AWS account using terraform 
- Create a tarball of the jenkins home directory
- Push the created tarball to the S3 bucket and depending on the whether backups should be replaced or versioned either
    - Delete and replace the current backup
    - Push the new backup and add to the pool of previous backups
    
## Replace or version backups
If you're a larger enterprise you'll most likely want to keep a history of backups in case you want to roll back to a particular point in time. This option uses the timestamp the backup was created at as the name of the file to ensure backups are unique.

If you're working on a smaller scale and if you're wanting to be more cost savy, your can elect to only keep the most recent backup.
This option will use a generic name for your backup.


License
=======
This code is open sourced licensed under the Apache 2.0 License