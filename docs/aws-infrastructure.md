# Phase 5 — AWS Infrastructure

## Objective

Deploy the Wild Tour application on AWS using a dedicated VPC, public/private subnets, EC2, security groups, and Amazon RDS MySQL.

The application runs inside Docker on EC2, while the database is moved from the local Docker Compose MySQL container to a managed Amazon RDS MySQL instance.

---

## Architecture

```text
                         Internet
                            |
                            v
                  Internet Gateway
                            |
                            v
                 Public Route Table
                            |
                            v
              Public Subnet 1 / 2
                            |
                            v
                    EC2 Instance
                 Ubuntu + Docker
                            |
                            v
                 Wild Tour Container
                 Tomcat + Java WAR
                            |
                     MySQL : 3306
                            |
                            v
                 Private Subnet 1 / 2
                            |
                            v
                    Amazon RDS
                   MySQL Database
```

---

## AWS Region

- Region: Asia Pacific (Mumbai)
- Region code: `ap-south-1`

---

## VPC

Created a dedicated VPC for the Wild Tour infrastructure.

- VPC Name: `wild-tour-vpc`
- CIDR: `10.0.0.0/16`

---

## Subnets

### Public Subnets

| Name | CIDR | Availability Zone |
|---|---|---|
| `wild-tour-public-subnet-1` | `10.0.1.0/24` | `ap-south-1a` |
| `wild-tour-public-subnet-2` | `10.0.3.0/24` | `ap-south-1b` |

### Private Subnets

| Name | CIDR | Availability Zone |
|---|---|---|
| `wild-tour-private-subnet-1` | `10.0.2.0/24` | `ap-south-1a` |
| `wild-tour-private-subnet-2` | `10.0.4.0/24` | `ap-south-1b` |

The public subnets are used for internet-facing application infrastructure.

The private subnets are used for the database layer.

---

## Internet Gateway

Created:

- Name: `wild-tour-igw`
- Used to provide internet connectivity to resources in the public subnets.

---

## Route Tables

### Public Route Table

- Name: `wild-tour-public-rt`

Routes:

```text
10.0.0.0/16    local
0.0.0.0/0      Internet Gateway
```

Both public subnets are associated with this route table.

### Private Route Table

- Name: `wild-tour-private-rt`

The private route table contains the VPC local route and is used by the private subnets.

No direct internet route is required for the RDS database.

---

## Security Groups

### Application Security Group

Name:

```text
wild-tour-app-sg
```

Inbound rules:

| Protocol | Port | Source | Purpose |
|---|---:|---|---|
| TCP | 22 | My IP | SSH administration |
| TCP | 8080 | `0.0.0.0/0` | Wild Tour web application |

Port 8080 is exposed publicly for application testing.

SSH is restricted to the administrator's IP address.

### Database Security Group

Name:

```text
wild-tour-db-sg
```

Inbound rule:

| Protocol | Port | Source | Purpose |
|---|---:|---|---|
| TCP | 3306 | `wild-tour-app-sg` | Application → RDS |

The database port is not exposed directly to the public internet.

This implements security-group-based access control between the application and database layers.

---

## EC2

Created an Ubuntu EC2 instance for the application layer.

Configuration:

- Instance type: `t3.micro`
- Operating system: Ubuntu 26.04 LTS
- VPC: `wild-tour-vpc`
- Subnet: `wild-tour-public-subnet-1`
- Private IP: `10.0.1.77`
- Public IP: `13.233.33.50`
- Security group: `wild-tour-app-sg`

Installed software:

- Git
- Docker
- Docker Compose
- Java 17
- Maven
- MySQL client

---

## Application Deployment

The GitHub repository was cloned onto the EC2 instance.

Repository:

```text
https://github.com/2004Pruthvi/wild-tour-devops.git
```

The application was built using Maven:

```bash
mvn -f application/pom.xml clean package
```

The Docker image was built as:

```bash
docker build -t wild-tour:phase5 .
```

The application is deployed using Docker Compose.

---

## Amazon RDS

Created a managed MySQL database using Amazon RDS.

Configuration:

- DB identifier: `database-wild-tour`
- Engine: MySQL
- Instance class: `db.t4g.micro`
- Storage: 20 GiB
- Storage type: gp2
- Deployment: Single-AZ
- Public access: No
- VPC: `wild-tour-vpc`
- Subnet group: `wild-tour-db-subnet-group`
- Security group: `wild-tour-db-sg`

The RDS instance is placed in private subnets and does not have public access.

---

## Database Migration

Created the application database:

```sql
CREATE DATABASE wildlife;
```

Imported the existing Wild Tour SQL dump:

```bash
mysql -h database-wild-tour.cfyo6wgou1au.ap-south-1.rds.amazonaws.com \
-u admin -p wildlife < application/wildlife.sql
```

Verified the database tables:

```text
booking
guides
packages
safari
stay
user
```

Created a dedicated application database user:

```text
wildlife-docker
```

The application user was granted access to the `wildlife` database.

---

## Application → RDS Connectivity

Connectivity from EC2 to RDS was verified using:

```bash
nc -zv database-wild-tour.cfyo6wgou1au.ap-south-1.rds.amazonaws.com 3306
```

The connection succeeded.

The application was configured to use RDS through environment variables:

```yaml
environment:
  DB_URL: jdbc:mysql://database-wild-tour.cfyo6wgou1au.ap-south-1.rds.amazonaws.com:3306/wildlife
  DB_USER: wildlife-docker
  DB_PASSWORD: ${DB_PASSWORD}
```

Passwords are stored in the local `.env` file and are not committed to Git.

---

## Docker Compose Architecture

After migrating to RDS, the local MySQL service was removed from `docker-compose.yml`.

The Compose file now contains only the application service:

```yaml
services:
  wild-tour-app:
    image: wild-tour:phase5
    container_name: wild-tour-app
    environment:
      DB_URL: jdbc:mysql://database-wild-tour.cfyo6wgou1au.ap-south-1.rds.amazonaws.com:3306/wildlife
      DB_USER: wildlife-docker
      DB_PASSWORD: ${DB_PASSWORD}
    ports:
      - "8080:8080"
    networks:
      - wild-tour-network

networks:
  wild-tour-network:
```

The previous local MySQL container was removed as an orphan.

The final Compose stack contains only:

```text
wild-tour-app
```

---

## Verification

### Docker Compose

```bash
docker compose ps
```

Expected application state:

```text
wild-tour-app    wild-tour:phase5    Up
```

### Application Port

The application listens on:

```text
0.0.0.0:8080
```

### HTTP Test

```bash
curl -I http://localhost:8080/Wild_Tour/
```

Returned:

```text
HTTP/1.1 200
```

### Browser Test

The Wild Tour application was successfully accessed through:

```text
http://13.233.33.50:8080/Wild_Tour/
```

### Database Test

Login through the application succeeded using a sample user from the imported database.

This verified the complete application path:

```text
Browser
   ↓
EC2
   ↓
Docker
   ↓
Tomcat / Wild Tour
   ↓
RDS MySQL
   ↓
wildlife.user
```

---

## Security Considerations

- RDS is configured with Public Access disabled.
- RDS port 3306 is not open to the internet.
- Database access is restricted through `wild-tour-db-sg`.
- SSH is restricted to the administrator's IP.
- Database credentials are supplied through environment variables.
- `.env` is excluded from Git.
- The RDS application user is separate from the RDS master user.
