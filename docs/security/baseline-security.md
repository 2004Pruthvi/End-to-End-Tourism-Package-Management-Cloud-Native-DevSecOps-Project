\# Wild Tour — Baseline Security Assessment



\## Assessment Status



Baseline assessment completed before DevOps transformation.



\## Database Configuration



The application contains database connection configuration directly

inside Java and JSP source files.



Database host and database name are hardcoded.



Database credentials are also present in source code.



\## Database Access



Database access is not centralized.



Some components use Connector.java while several servlets and JSP

pages create direct JDBC connections.



\## Authentication



The application currently accepts a user's email and password and

performs authentication using a database query comparing the supplied

password with the password stored in the database.



\## Password Storage



User passwords are stored directly in the database.



The database schema defines the password column as VARCHAR(45).



\## Password Exposure



The User DTO contains a password field, and the current toString()

implementation includes the password value.



\## Security Risks



\- Hardcoded database credentials

\- Duplicated database configuration

\- Plaintext password storage

\- Plaintext password comparison

\- Potential password exposure through object logging

\- Application configuration coupled to source code



\## Planned Remediation



These issues will be addressed progressively during the security and

configuration-hardening phases.



Planned improvements include:



\- Externalize database configuration

\- Remove hardcoded credentials

\- Centralize database access

\- Hash user passwords

\- Remove passwords from logs and object representations

\- Introduce appropriate secret management

\- Review application and infrastructure access controls



\## Baseline Reference



Application baseline: v0.1.0

