# Capstone Project: Automated Log Rotation & Health-Check Script

## Problem Statement
Automate system performance tracking (disk/memory) and prune stale log files to prevent storage exhaustion.

## Features
- Captures system timestamps, `df -h` disk metrics, and `free -h` memory usage.
- Deletes log files older than 7 days using `find`.
- Configured via `crontab` to run hourly.

## Execution
```bash
chmod +x healthcheck.sh
./healthcheck.sh

## Automation & Cron Scheduling

To schedule this script on a standard Linux environment (e.g., Ubuntu/EC2), add the following entry using `crontab -e`:

```cron
0 * * * * /bin/bash ~/aws-cloud-engineer-journey/module-01-linux/log-automation/healthcheck.sh