## Day 26 Log - Application Load Balancers & Traffic Distribution

- **Built:** Authored CloudFormation template (`alb-template.json`) provisioning an internet-facing Application Load Balancer spanning multiple subnets, security groups, HTTP listeners, and target groups.
- **Commands Learned:** python -m json.tool alb-template.json.
- **Key Concept:** ALBs distribute incoming HTTP requests across multiple targets in different Availability Zones, utilizing automated health checks to ensure high availability and fault tolerance.
- **Errors/Fixes:** Verified that the ALB configuration references at least two distinct public subnets across separate AZs to comply with AWS multi-AZ requirements.

## Day 27 Log - EC2 Launch Templates & Auto Scaling Groups

- **Built:** Authored CloudFormation template (`asg-template.json`) provisioning an EC2 Launch Template with automated web server bootstrap user data and an Auto Scaling Group tied directly to the ALB target group.
- **Commands Learned:** python -m json.tool asg-template.json.
- **Key Concept:** Auto Scaling Groups maintain desired compute capacity across multi-AZ subnets, using Launch Templates for instance configurations and ELB health checks for automated self-healing.
- **Errors/Fixes:** Verified proper matching between Launch Template version attributes and ASG target group ARN parameters.

## Day 28 Log - Module 06 Capstone Project

- **Built:** Authored master CloudFormation template (`module-06-capstone-stack.json`) integrating security groups, Application Load Balancers, Target Groups, Launch Templates, and Auto Scaling Groups into a single high-availability compute stack.
- **Commands Learned:** python -m json.tool module-06-capstone-stack.json.
- **Key Concept:** End-to-end compute orchestration combines multi-AZ load balancing with auto-scaling fleets and automated bootstrap user-data configurations to achieve fault-tolerant web hosting.
- **Errors/Fixes:** Verified proper dependency mapping between the ASG target group ARN reference and the underlying ALB target group resource definition.