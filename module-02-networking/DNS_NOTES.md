# DNS Architecture & Amazon Route 53 Notes

## DNS Resolution Workflow
1. **Client Request:** User types `app.example.com` into browser.
2. **Recursive Resolver:** Checks local cache; queries Root Server if cache misses.
3. **Root Server (`.`):** Directs resolver to Top-Level Domain (TLD) server (`.com`).
4. **TLD Server (`.com`):** Directs resolver to Authoritative Name Server for `example.com`.
5. **Authoritative Name Server:** Returns target record IP (e.g., `A Record -> 192.0.2.1`).

## Core DNS Record Types

| Record Type | Purpose | AWS Route 53 Equivalent |
| :--- | :--- | :--- |
| **A** | Maps hostname to IPv4 address | Standard A Record |
| **AAAA** | Maps hostname to IPv6 address | Standard AAAA Record |
| **CNAME** | Canonical Name (Alias to another domain) | CNAME Record |
| **Alias** | AWS-specific non-standard extension to route root domain to AWS resources | Route 53 Alias Record (Free lookup to ALB/CloudFront) |
| **MX** | Mail Exchange server destination | MX Record |
| **TXT** | Text metadata (SPF, DKIM validation) | TXT Record |
| **NS** | Name Server delegation | Route 53 Hosted Zone NS Records |

## Local vs. Cloud Name Resolution
- Local DNS overrides reside in `/etc/hosts` (Linux/macOS) or `C:\Windows\System32\drivers\etc\hosts` (Windows).
- AWS Route 53 acts as a highly available Authoritative DNS service integrated with AWS VPC Route 53 Resolver (`10.x.x.2`).