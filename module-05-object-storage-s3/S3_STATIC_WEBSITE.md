# S3 Static Website Hosting Architecture

## 1. Core Web Hosting Requirements
- **Index & Error Documents:** S3 requires an entry point (`index.html`) and a fallback page (`error.html`) when serving static content over HTTP website endpoints.
- **Public Access Configuration:** Unlike private storage buckets (which enforce strict Block Public Access), static website buckets require public read policies (`s3:GetObject`) and relaxed block settings to allow visitors to view content over the internet.
- **Template Outputs (`Outputs`):** CloudFormation outputs let you automatically extract and display the website's public endpoint URL once deployment finishes.