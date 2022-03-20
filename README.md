# DevOps-assignment
 A CI/CD pipeline for a simple python flask application using the DevOps tools such as: 
 - git for code repository
 - AWS Elastic Beanstalk service for deploying and scaling web applications and services developed with various languages like Java, .NET, PHP, Node.js, Python
 - Terraform where we are going to provision the Jenkins on EC2 and elastic beanstalk for our flask application and environment under it
 - Jenkins pipeline will be the main automation tool to pull application files from git and push it into elastic beanstalk 

# Setting up the environment
```
Step 1 - Need to run the terraform from the local which helps in Creating the AWS EC2 with Jenkins installation on it and Creating the AWS Elastic Beanstalk with Application and its Environment for python
```
```
Step 2 - Once the EC2 is ready, login to it to get Jenkins admin password (currently AWS session manager is used for accessing SSH on jenkins)
```
```
Step 3 - Now login to Jenkins on browser with Public IP address of EC2 to conifgure our automation process
```
```
Step 4 - Go to Credentials manager and Add credentials for SSH access on github repository (I generated it using ssh-keygen command)
         (Need to copy private key in "Private Key" section ) 
```
```
Step 5 - Go to your Git repo Settings and copy Public key under "Deploy Keys" section there
```
```
Step 6 - Again be on Settings and look for Webhooks / Add webhook, You need to put IP address of jenkins in "Payload URL" field 
```
```
Step 7 - Now lets configure our first job which will connect to Git repo and helps us fetching the our app files onto Jenkins
       A. Create a New Item with pipeline 
       B. Then select "GitHub project" and specify your git repo url
       C. Under "Build Triggers" tick on "GitHub hook trigger for GITScm polling"
       D. In "Pipeline" section chose "Pipeline script from SCM" 
       E. Here you need to give inputs of git repo URL, select credential we had added in Step 4 above, Branch Specifier as "*/main" then in "Script Path" keep the  name as JenkinsFile
       F. cross check once more, Apply it and Save
```
```
Step 8 - Either you can Run this job by manually clicking on "Build Now" button or wait for commit to happen in git repo and then jenkins should automatically run the build
```
```
Step 9 - If build is successful, then it will download app and zip it to push on S3 bucket in my account. From there it will get updated and deployed as new version in elasti beanstalk created in Step 1
```
