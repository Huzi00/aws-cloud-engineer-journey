# Amazon CloudFront CDN Architecture

## 1. Core CDN Concepts
- **Edge Locations:** CloudFront caches your static content (HTML, CSS, JS, images) across hundreds of points of presence (PoPs) worldwide, bringing data closer to the end user.
- **Origins:** The backend source where CloudFront fetches content if it isn't cached at the edge (in this case, your S3 bucket).
- **Viewer Protocol Policy:** Enforces `redirect-to-https`, automatically upgrading unsecured HTTP browser requests to encrypted HTTPS connections.

## 2. Caching & TTL Parameters
- **Time-to-Live (TTL):** Controls how long edge servers store content before checking back with the S3 origin bucket for updates (`DefaultTTL`: 86400 seconds / 24 hours).