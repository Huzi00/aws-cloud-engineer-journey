# Capstone Project: Local Web Server & Diagnostic Suite

## Problem Statement
Deploy a local web server environment and write a programmatic diagnostic script to audit web status codes, local listener availability, and remote DNS resolution.

## Features
- Serves static HTML content on local port `8080` via Python HTTP module.
- `net_diag.sh` script queries local server status, resolves `aws.amazon.com` DNS, and audits remote HTTPS response codes.
- Writes formatted diagnostic logs with timestamps.

## How to Run
1. Start Web Server in Terminal 1:
   ```bash
   python -m http.server 8080