# Module 01: Terminal Mastery & Linux Administration

This directory contains scripts, logs, and documentation for Linux terminal operations and automation.

## Day 1: Filesystem & Navigation
- Mastered basic terminal navigation and directory management.
- Practiced file manipulation using `touch`, `cp`, `mv`, and `rm`.
- Established proper directory hierarchy for project tracking.

## Day 2: File Permissions & Users
- Mastered Linux file permission models (`rwx` and octal values: 4-2-1).
- Applied permission updates using `chmod`.
- Verified user execution privileges on local shell scripts.

## Day 3: Text Processing & Piping
- Mastered Linux standard output redirection (`>` and `>>`).
- Filtered system outputs using `grep`, `head`, and `tail`.
- Chained terminal commands using pipes (`|`) for stream processing.

## Day 4: Process Management & SSH
- Monitored and managed system processes (`ps`, `jobs`, `kill`).
- Generated 4096-bit RSA SSH key pairs for secure remote host authentication.
- Configured secure local key storage inside `~/.ssh/`.

## Day 5 Capstone Project: Automated Log Rotation & Health-Check Script

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

# Module 02: Computer Networking & Web Architecture

This directory tracks core networking fundamentals, CIDR subnetting, DNS resolution, and local web server deployments.

## Day 6: OSI & TCP/IP Models
- Mapped 7-layer OSI model to 4-layer TCP/IP stack.
- Executed CLI diagnostics (`ping`, `traceroute`, `curl`).
- Linked network layers to AWS infrastructure primitives.

## Day 7: IP Addressing, Subnetting & CIDR
- Analyzed IPv4 octet structures, network masks, and prefix length calculations.
- Constructed a CIDR reference table mapped to AWS VPC architecture specs.
- Calculated usable host IP availability accounting for the 5 AWS reserved addresses.

## Day 8: DNS Fundamentals & Name Resolution
- Queried A, MX, and NS records using CLI lookup tools (`nslookup`, `dig`).
- Deconstructed recursive resolution flow from Root to Authoritative servers.
- Documented DNS record types and mapped them to Amazon Route 53 primitives.

## Day 9: HTTP/HTTPS, Web Architecture & Ports
- Examined HTTP request/response headers and status codes using `curl`.
- Mapped standard networking ports (22, 80, 443, 3306, 5432) to AWS infrastructure security rules.
- Documented 3-tier web architecture components for cloud applications.