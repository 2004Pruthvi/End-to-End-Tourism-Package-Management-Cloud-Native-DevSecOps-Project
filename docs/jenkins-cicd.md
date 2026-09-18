# Jenkins CI/CD

## Overview

Jenkins is used to automate the Continuous Integration and Continuous Deployment workflow for the Wild Tour application.

The pipeline is triggered automatically when changes are pushed to the `main` branch on GitHub.

## CI/CD Flow

```text
Developer Push
      ↓
GitHub
      ↓
GitHub Webhook
      ↓
Jenkins
      ↓
Checkout Source Code
      ↓
Maven Build
      ↓
Maven Test
      ↓
Archive WAR Artifact
      ↓
Build Docker Image
      ↓
Manual Deployment Approval
      ↓
Deploy Docker Container
      ↓
Connect Application to AWS RDS
      ↓
Email Notification
Jenkins Pipeline Stages
1. Build
Jenkins enters the application directory and runs:
mvn clean package
This compiles the Java application and creates the WAR artifact.
2. Test
Jenkins runs:
mvn test
The current project does not contain automated test cases, so Maven reports that there are no tests to run.
3. Archive Artifact
The generated WAR file is archived by Jenkins:
application/target/Wild_Tour.war
Fingerprinting is enabled for the archived artifact.
4. Docker Build
Jenkins builds the application Docker image:
docker build -t wild-tour:jenkins .
5. Approval
Before deployment, Jenkins pauses the pipeline and requests manual approval.
This provides a deployment gate between the build process and production-style deployment.
6. Deploy
After approval, Jenkins:
1. Removes the previous application container.
2. Starts a new wild-tour-app container.
3. Injects the database credentials securely from Jenkins Credentials.
4. Connects the application to the AWS RDS MySQL database.
5. Verifies that the container is running.
The database password is never stored directly in the Jenkinsfile.
7. Email Notification
Jenkins uses the Email Extension Plugin to send notifications.
A successful pipeline sends a success notification.
A failed pipeline sends a failure notification.
The notification contains:
- Project name
- Build number
- Build status
- Jenkins build URL
Gmail SMTP is configured through Jenkins credentials using an application password.
GitHub Webhook
The Jenkins job is configured with:
GitHub hook trigger for GITScm polling
GitHub sends a webhook when code is pushed to the repository.
The webhook triggers the Jenkins pipeline automatically.
Jenkins Job
Job: wild-tour-ci
Branch: main
Pipeline definition: Pipeline script from SCM
Script path: Jenkinsfile
Security
Sensitive database credentials are stored in Jenkins Credentials rather than committed to Git.
The Jenkinsfile references the credential using:
withCredentials([usernamePassword(
    credentialsId: 'wild-tour-db',
    usernameVariable: 'DB_USER',
    passwordVariable: 'DB_PASSWORD'
)])
The Gmail SMTP credential is also stored securely in Jenkins Credentials.
Passwords are not hard-coded in the repository.
Verification
The Jenkins pipeline has been verified successfully with:
- GitHub push trigger
- Automatic Jenkins build
- Maven build
- Maven test execution
- WAR artifact archiving
- Docker image creation
- Manual deployment approval
- Docker container deployment
- AWS RDS connectivity
- Gmail email notification
Result
The Wild Tour project now has an automated GitHub → Jenkins CI/CD workflow with a manual deployment approval gate and email notifications.
