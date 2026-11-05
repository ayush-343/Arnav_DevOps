# VLE 4 and 5

Isolated lab workspace. Existing DevOps projects are unchanged.

VLE4 provisions a VPC, public subnet, Internet Gateway, route table, SSH key, restricted security group, and two Amazon Linux 2023 EC2 instances. Ansible installs and starts Docker on both.

VLE5 reuses server 1 for Minikube and a two-replica Nginx application. Its workflow requires a trusted, private repository and a self-hosted runner labeled vle5 on the lab server. Do not enable untrusted pull request workflows on this runner. AWS Academy session expiry and stopping EC2 interrupt deployments.

Terraform state and the private lab SSH key remain in AWS CloudShell under ~/vle45 and must never be committed. Run terraform destroy from ~/vle45/vle4/terraform after preserving required evidence and authorizing resource removal.

The original PDFs use an old AMI, world-open SSH, omit explicit egress, and omit GitHub runner cluster access and image loading. This implementation uses an SSM-resolved Amazon Linux image, controller-only ingress, explicit egress, and a cluster-local runner with Minikube image loading. t3.small replaces t2.micro to provide Kubernetes resources.

Reports record only verified execution. Source files alone do not prove a successful deployment.
