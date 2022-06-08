# DevOps-assignment
 A CI/CD pipeline for a simple python flask application using the DevOps tools such as: 
 - Git for code repository
 - ***AWS Elastic Beanstalk*** service for deploying and scaling web applications and services developed with various languages like Java, .NET, PHP, Node.js, Python
 - Being managed service of AWS from ***capacity provisioning, load balancing, auto-scaling to application health monitoring*** Elastic Beanstalk automatically handles it
 - ***AWS S3 bucket*** to push application artifacts
 - ***Terraform*** where we are going to provision the Jenkins on EC2 and elastic beanstalk for our flask application and environment under it
 - ***Jenkins pipeline*** will be the main automation tool to pull application files from git and push it into elastic beanstalk 

## Setting up the Environment
```
Step 1 - Need to run the terraform from the local which helps in Creating the AWS EC2 with Jenkins installation
         on it and Creating the AWS Elastic Beanstalk with Application and its Environment for python
```
```
Step 2 - Once the EC2 is ready, login to it to get Jenkins admin password (currently AWS session manager is 
         used for accessing SSH on jenkins)
```
```
Step 3 - Now login to Jenkins on browser with Public IP address of EC2 to conifgure our automation process
```
```
Step 4 - Go to Credentials manager and Add credentials for SSH access on github repository (I generated it using ssh-keygen
         command and Need to copy private key in "Private Key" section ) 
         Add one more Credential for IAM access key and secret key id which will have permissions of 
         elastic beanstalk and upload access on S3 bucket
```
```
Step 5 - Go to your Git repo Settings and copy Public key created in above step via ssh-keygen under "Deploy Keys" section
```
```
Step 6 - Again be on Settings and look for Webhooks / Add webhook, You need to put IP address of jenkins in "Payload URL" field 
```
```
Step 7 - Now lets configure our first job which will connect to Git repo and helps us fetching our app files 
         onto Jenkins workspace
       A. Create a New Item with pipeline 
       B. Then select "GitHub project" and specify your git repo url
       C. Under "Build Triggers" tick on "GitHub hook trigger for GITScm polling"
       D. In "Pipeline" section chose "Pipeline script from SCM" 
       E. Here you need to give inputs of git repo URL, select credential we had added in Step 4 above, Branch Specifier as "*/main" 
          then in "Script Path" keep the  name as JenkinsFile
       F. cross check once more, Apply it and Save
```
```
Step 8 - Either you can Run this job by manually clicking on "Build Now" button or wait for commit to happen in git repo and then 
         jenkins should automatically run the build
```
```
Step 9 - If build is successful, then it will download app and zip it to push on S3 bucket in my account. From there it will get updated 
         and deployed as new version in elasti beanstalk created in Step 1
```

## Lessons I learned during this assignment
- Password authentication with github from jenkins is discontinued so used SSH key based authentication
- I was struggeling in checkout phase of pipeline to connect with github, then "Pipeline Syntax" helped me getting correct command to use
- Used session manager of AWS to connect with instance thus reducing the long way of SSHing to server using putty/mobaxterm etc
- Even writing README file in depth is learning for me 

### Manual tasks performed
- Ran the terraform from local for EC2/Jenkins and then for Elastic beanstalk configuration
- Manually created the Jenkins job for pipeline and testing
- During this I created 2 jobs one with "Pipeline Script" and "Pipeline Script with SCM"
- Both were tested and working good

### Assumption
- Here, I created 2 Repos, one is - devops-assignment, for Terraform files to view and other is - "jenkins-pipeline" to view the flask applications file and JenkinsFile to use in pipeline
- Currently I tested it with VPC, public subnet, S3 bucket which were already created
- Uploaded images/snapshots of the work I did on Jenkins here to review it
