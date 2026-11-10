#!/bin/bash

# Configuration
LOCAL_URL="http://localhost:8080"
REMOTE_DOMAIN="aws.amazon.com"
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
REPORT_FILE="network_report_$TIMESTAMP.log"

echo "==========================================" > "$REPORT_FILE"
echo "Network Diagnostic Report - $TIMESTAMP" >> "$REPORT_FILE"
echo "==========================================" >> "$REPORT_FILE"

# 1. Local Web Server HTTP Status Check
echo "" >> "$REPORT_FILE"
echo "--- LOCAL WEB SERVER CHECK ($LOCAL_URL) ---" >> "$REPORT_FILE"
LOCAL_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" "$LOCAL_URL")
echo "HTTP Response Code: $LOCAL_STATUS" >> "$REPORT_FILE"

# 2. DNS Resolution Check
echo "" >> "$REPORT_FILE"
echo "--- DNS LOOKUP ($REMOTE_DOMAIN) ---" >> "$REPORT_FILE"
nslookup "$REMOTE_DOMAIN" >> "$REPORT_FILE" 2>&1

# 3. Remote Endpoint HTTP Status Check
echo "" >> "$REPORT_FILE"
echo "--- REMOTE HTTP CHECK ($REMOTE_DOMAIN) ---" >> "$REPORT_FILE"
REMOTE_STATUS=$(curl -o /dev/null -s -w "%{http_code}\n" "https://$REMOTE_DOMAIN")
echo "HTTP Response Code: $REMOTE_STATUS" >> "$REPORT_FILE"

echo "Diagnostic complete. Report saved to $REPORT_FILE"