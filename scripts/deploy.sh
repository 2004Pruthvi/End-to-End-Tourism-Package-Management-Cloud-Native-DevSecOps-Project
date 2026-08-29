#!/usr/bin/env bash

set -euo pipefail

APP_NAME="Wild_Tour"
WAR_FILE="application/target/${APP_NAME}.war"
TOMCAT_HOME="/opt/tomcat"
WEBAPPS="${TOMCAT_HOME}/webapps"

echo "==> Checking WAR..."

if [[ ! -f "$WAR_FILE" ]]; then
    echo "ERROR: WAR file not found: $WAR_FILE"
    echo "Run: mvn -f application/pom.xml clean package"
    exit 1
fi

echo "==> Stopping Tomcat..."
sudo systemctl stop tomcat

echo "==> Removing previous deployment..."
sudo rm -rf "${WEBAPPS}/${APP_NAME}"
sudo rm -f "${WEBAPPS}/${APP_NAME}.war"

echo "==> Deploying ${APP_NAME}.war..."
sudo cp "$WAR_FILE" "${WEBAPPS}/"

echo "==> Setting ownership..."
sudo chown tomcat:tomcat "${WEBAPPS}/${APP_NAME}.war"

echo "==> Starting Tomcat..."
sudo systemctl start tomcat

echo "==> Waiting for Tomcat..."
sleep 5

echo "==> Checking Tomcat..."
if ! sudo systemctl is-active --quiet tomcat; then
    echo "ERROR: Tomcat failed to start."
    sudo systemctl status tomcat --no-pager
    exit 1
fi

echo "==> Checking application..."
if curl -fsS http://localhost:8080/${APP_NAME}/ > /dev/null; then
    echo "==> Deployment successful."
    echo "Application: http://localhost:8080/${APP_NAME}/"
else
    echo "ERROR: Application health check failed."
    exit 1
fi
