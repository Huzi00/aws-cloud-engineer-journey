## Day 6 Log - OSI & TCP/IP Models

- **Built:** Initial Module 02 workspace and network stack mapping documentation.
- **Commands Learned:** ping, traceroute / tracert, curl -I.
- **Key Concept:** OSI is a 7-layer theoretical framework; TCP/IP is the practical 4-layer protocol suite powering the internet and AWS VPC routing.
- **Errors/Fixes:** Verified ICMP ping vs HTTP curl responses to distinguish Layer 3 reachability from Layer 7 application status.

# CIDR & Subnetting Cheat Sheet for AWS VPCs

## CIDR Block Reference Table

| CIDR Notation | Subnet Mask | Total IP Addresses | Usable IPs in AWS (Total - 5) | Common AWS Use Case |
| :--- | :--- | :--- | :--- | :--- |
| `/16` | 255.255.0.0 | 65,536 | 65,531 | Standard VPC Size |
| `/20` | 255.255.240.0 | 4,096 | 4,091 | Large Subnet / Shared Infra |
| `/24` | 255.255.255.0 | 256 | 251 | Standard Public/Private Subnet |
| `/28` | 255.255.255.240| 16 | 11 | Minimum allowed AWS Subnet size |
| `/32` | 255.255.255.255| 1 | 1 | Single Host / Security Group rule |

## AWS Reserved IP Addresses Rule
In any AWS VPC subnet, **5 IP addresses** are automatically reserved by AWS and cannot be assigned to instances:
1. `.0` - Network address
2. `.1` - VPC Router address
3. `.2` - AWS DNS server mapping
4. `.3` - Future AWS feature reservation
5. `.255` - Network broadcast address

## Practical Calculation Exercise
For a VPC assigned `10.0.0.0/16`:
- **Public Subnet 1:** `10.0.1.0/24` (IP Range: `10.0.1.0` - `10.0.1.255` | Usable: 251 IPs)
- **Private Subnet 1:** `10.0.2.0/24` (IP Range: `10.0.2.0` - `10.0.2.255` | Usable: 251 IPs)

## Day 8 Log - DNS Fundamentals & Name Resolution

- **Built:** DNS record lookup queries and local hosts file inspection.
- **Commands Learned:** nslookup, dig, cat /c/Windows/System32/drivers/etc/hosts.
- **Key Concept:** DNS translates human-readable domain names to IP addresses via a hierarchical lookup process (Recursive -> Root -> TLD -> Authoritative). Route 53 Alias records extend standard CNAME behavior for AWS resources.
- **Errors/Fixes:** Verified difference between standard CNAME records and AWS Route 53 Alias records for zone apex (root domain) mapping.