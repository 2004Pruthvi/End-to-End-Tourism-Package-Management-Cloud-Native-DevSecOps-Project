# Wild Tour — Application Baseline

## Environment

- OS: Windows
- Java: 
java --version
openjdk 17.0.17 2025-10-21 LTS
OpenJDK Runtime Environment Corretto-17.0.17.10.1 (build 17.0.17+10-LTS)
OpenJDK 64-Bit Server VM Corretto-17.0.17.10.1 (build 17.0.17+10-LTS, mixed mode, sharing)

- Maven: 
mvn --version
Apache Maven 3.9.11 (3e54c93a704957b63ee3494413a2b544fd3d825b)
Maven home: C:\ProgramData\chocolatey\lib\maven\apache-maven-3.9.11
Java version: 17.0.6, vendor: Eclipse Adoptium, runtime: C:\Users\pruth\AppData\Local\Programs\Eclipse Adoptium\jdk-17.0.6.10-hotspot
Default locale: en_IN, platform encoding: Cp1252
OS name: "windows 11", version: "10.0", arch: "amd64", family: "windows"

- Tomcat: 
./catalina.bat version
Using CATALINA_BASE:   "C:\DevTools\apache-tomcat-10.0.17"
Using CATALINA_HOME:   "C:\DevTools\apache-tomcat-10.0.17"
Using CATALINA_TMPDIR: "C:\DevTools\apache-tomcat-10.0.17\temp"
Using JRE_HOME:        "C:\Users\pruth\AppData\Local\Programs\Eclipse Adoptium\jdk-17.0.6.10-hotspot\"
Using CLASSPATH:       "C:\DevTools\apache-tomcat-10.0.17\bin\bootstrap.jar;C:\DevTools\apache-tomcat-10.0.17\bin\tomcat-juli.jar"
Using CATALINA_OPTS:   ""
NOTE: Picked up JDK_JAVA_OPTIONS:  --add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.io=ALL-UNNAMED --add-opens=java.base/java.util=ALL-UNNAMED --add-opens=java.base/java.util.concurrent=ALL-UNNAMED --add-opens=java.rmi/sun.rmi.transport=ALL-UNNAMED
Server version: Apache Tomcat/10.0.17
Server built:   Feb 21 2022 19:36:49 UTC
Server number:  10.0.17.0
OS Name:        Windows 11
OS Version:     10.0
Architecture:   amd64
JVM Version:    17.0.6+10
JVM Vendor:     Eclipse Adoptium

## Application

Wild Tour is currently running locally using Apache Tomcat.

## Build

The application is built using Maven.

## Deployment

The generated WAR is deployed to Apache Tomcat.

## Database

The application connects to MySQL running locally.

## Verification

-  Maven build successful
-  WAR generated
-  Tomcat started successfully
-  Wild Tour application loaded successfully
-  Database connectivity verified

## Current Architecture

Browser
    ↓
Tomcat
    ↓
Wild Tour WAR
    ↓
MySQL

## Baseline Version

v0.1.0
