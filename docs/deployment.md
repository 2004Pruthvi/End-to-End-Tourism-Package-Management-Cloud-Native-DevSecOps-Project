# Wild Tour Deployment

## Prerequisites

- Java 17
- Maven
- MySQL
- Apache Tomcat 10.0.17
- `/etc/wildtour/tomcat.env` configured on the deployment host

## Build

From the repository root:

```bash
cd application
mvn clean package

The generated artifact is:
application/target/Wild_Tour.war

Deploy
From the repository root:
./scripts/deploy.sh

The deployment script:
1. Verifies that the WAR exists.
2. Stops Tomcat.
3. Removes the previous Wild Tour deployment.
4. Copies the new WAR into Tomcat.
5. Sets the WAR ownership to tomcat:tomcat.
6. Starts Tomcat.
7. Verifies that Tomcat is running.
8. Performs an HTTP health check.

Application URL
http://localhost:8080/Wild_Tour/

Verify Tomcat
sudo systemctl status tomcat --no-pager

Verify application
curl -I http://localhost:8080/Wild_Tour/

Expected:
HTTP/1.1 200

Database Configuration
Database credentials are not stored in Git.
Tomcat receives the database configuration through:
/etc/wildtour/tomcat.env

The application reads:
DB_URL
DB_USER
DB_PASSWORD

through System.getenv() in:

application/src/main/java/com/wild_tour/connection/Connector.java

The environment file must remain outside the repository.

Save and exit.

---

### 2. Verify the script and documentation

```bash
bash -n scripts/deploy.sh

Then:
git diff --check
Then:
git status --short

You should see:
 M application/...
?? docs/deployment.md
?? scripts/deploy.sh

3. Stage them
git add scripts/deploy.sh docs/deployment.md
Check:
git diff --cached --check
Then:
git status

4. Commit
git commit -m "feat: add repeatable Tomcat deployment"
Then:
git log --oneline --decorate -5
