# VLE5 viva answers

## Git
1. `fetch` downloads remote refs and objects; `pull` fetches and integrates into the current branch.
2. A branch is a movable reference to a commit, allowing independent development.
3. The default branch is repository-configured; this lab uses `main`.
4. Merge combines histories, often with a merge commit; rebase replays commits on a new base and changes their IDs.
5. A conflict occurs when Git cannot automatically reconcile overlapping changes.
6. Edit conflicted files, remove conflict markers, stage resolutions, then continue the merge or rebase.
7. HEAD identifies the checked-out branch or, when detached, a specific commit.
8. Commit writes a tree snapshot of the index and a commit object containing parents and metadata, then updates the current ref.
9. Git stores content-addressed snapshots; diffs are computed between snapshots.
10. Soft reset moves HEAD only; mixed also resets the index; hard also replaces tracked working files and may lose edits.
11. Detached HEAD points directly to a commit; create a branch to retain new commits conveniently.
12. Git provides versioned source, traceable changes, reproducible inputs and push events for CI/CD.

## GitHub
1. Fork creates a repository under another owner; clone copies a repository to a local working directory.
2. Issues track bugs, work and discussions.
3. An organization groups repositories and people with shared administration and access controls.
4. A webhook sends an HTTP event notification to a configured endpoint.
5. Secrets store sensitive values for authorized workflows; they should not be committed as source.
6. Branches, pull requests, reviews, issues and checks support team collaboration.
7. Code review evaluates proposed changes before merging.
8. GitHub Actions or external CI receives repository events and executes configured jobs.
9. GitHub hosts source and coordinates changes, review, automation and releases.

## GitHub Actions
1. A job is a set of steps executed on a runner; jobs can depend on other jobs.
2. A step runs a command or an action within a job.
3. A runner is the machine executing jobs.
4. GitHub-hosted runners are managed temporary machines; self-hosted runners are operated by the repository owner and retain responsibility for isolation and maintenance.
5. actions/checkout downloads the repository revision into the job workspace.
6. Use the secrets context in an environment variable or action input; avoid logging the value.
7. A workflow runs docker build and can publish an image to a registry or load it into a local cluster.
8. Configure authenticated cluster access, apply manifests and verify rollout readiness.
9. A failing step normally fails the job and dependent jobs; logs identify the failure and a corrected run can be triggered.
10. Actions integrates with GitHub events and hosted runners; Jenkins is a separately operated automation server with a broad plugin ecosystem.

## Docker
1. Docker builds, distributes and runs isolated application containers.
2. It packages application dependencies consistently across environments.
3. A container is an isolated process environment created from an image.
4. VMs include guest operating systems; containers generally share the host kernel.
5. An image is an immutable layered application filesystem and execution configuration.
6. Docker Hub is a hosted container image registry.
7. A Dockerfile declares image build instructions.
8. docker run creates and starts a new container; docker start starts an existing stopped container.
9. EXPOSE documents a container port; it does not publish it to the host by itself.
10. A volume stores persistent data separately from the container writable layer.
11. Typical states are created, running, paused, stopped and removed.
12. Each microservice can have its own independently versioned image and runtime configuration.
13. The image is the template; a container is a runtime instance with its own writable layer.
14. Cached layers and prebuilt images reduce installation work at deployment time.
15. The builder processes instructions, creates or reuses layers, and records an image and configuration.
16. Containers communicate using Docker networks, service names, IP addresses and published ports as configured.

## Kubernetes
1. Kubernetes orchestrates container workloads using declarative APIs and controllers.
2. It adds scheduling, replicas, service discovery, recovery and rolling updates across nodes.
3. A cluster contains a control plane and worker nodes.
4. A Pod is the smallest scheduled unit, containing one or more tightly coupled containers.
5. kubectl is the Kubernetes API command-line client.
6. A Pod is a runtime unit; a Deployment manages desired replicas and updates through ReplicaSets.
7. A Service offers a stable virtual endpoint and selects backing Pods.
8. Common types are ClusterIP, NodePort, LoadBalancer and ExternalName.
9. NodePort exposes a Service on a configured port on cluster nodes; reachability still depends on networking and firewall rules.
10. A ReplicaSet maintains a desired number of matching Pods.
11. Replicas across nodes and redundant control-plane components improve availability; this single-node lab is not highly available.
12. Kubelet may restart a container; a Deployment controller replaces missing Pods to restore desired replicas.
13. Change replica count manually or use an autoscaler with suitable metrics and capacity.
14. Swarm is Docker-native orchestration; Kubernetes provides a broader declarative ecosystem and extensibility model.
15. Minikube creates a local development Kubernetes cluster, including inside a Docker container.
16. Production clusters generally use redundant control planes, multiple workers, access controls, monitoring, backups and managed ingress.

## Integration
17. Commit application code, run CI checks, build an image and deploy its immutable version using Kubernetes manifests.
18. GitHub Actions connects repository events to automated build, validation and deployment jobs.
19. A push matching workflow triggers schedules a job on an eligible runner.
20. CI integrates and validates changes; continuous delivery prepares releasable artifacts, while continuous deployment automatically releases passing changes.
21. Docker builds images; Kubernetes runs those images using a container runtime such as containerd.
22. GitHub receives the push, evaluates triggers, schedules jobs, checks out code, builds and distributes the image, applies manifests and checks rollout health.
23. Versioned infrastructure, configuration and pipeline definitions replace repeated manual steps with repeatable commands and checks.
24. A web startup can build a tested application image on every main-branch push, deploy a two-replica Kubernetes Deployment and verify HTTP readiness.
