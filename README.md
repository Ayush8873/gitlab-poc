# gitlab-poc



## Getting started

# Gitlab CE CI/CD PoC

## Project Overview

This project demonstrates containerized deployment of a static CloudNova Technologies website using Docker, GitLab Community Edition (CE), GitLab Runner, and an AWS EC2 instance.

The objective is to automate website building, basic application testing, and deployment through a CI/CD pipeline.

## Architecture

Developer → GitLab Repository → GitLab CI/CD Pipeline → GitLab Runner → Docker Image → Test Container → Deployment Container on AWS EC2

## Technologies Used

- AWS EC2 – Hosts GitLab CE, GitLab Runner, and the website container.
- GitLab CE – Stores the source code and manages the CI/CD pipeline.
- GitLab Runner – Executes pipeline jobs.
- Docker – Packages and runs the website.
- Nginx – Serves the static HTML website.
- Bash and curl – Support pipeline execution and HTTP health checks.
- GitHub – Used as an additional repository for source-code sharing and documentation.

## Project Structure

```text
cloudnova-gitlab-cicd-poc/
├── index.html
├── Dockerfile
├── .dockerignore
├── .gitignore
├── .gitlab-ci.yml
└── README.md
```

## CI/CD Pipeline

### 1. Build
Builds a Docker image from the website source code and verifies that the image exists.

### 2. Test
Starts a temporary Docker container, checks the HTTP response, and verifies expected website content.

### 3. Deploy
Runs the deployment container on the EC2 host and checks that the website responds successfully.

## Deployment

The pipeline deploys the website container on host port 8081, mapped to port 80 inside the container.

Website URL: http://54.158.53.67:8081

The URL requires the appropriate AWS EC2 security group rule for external access.

## How to Run Locally

Build the image:

```bash
docker build -t cloudnova-website .
```

Run the container:

```bash
docker run --rm -p 8081:80 cloudnova-website
```

Open `http://localhost:8081` in your browser.

## Current Scope and Limitations

- This is a proof of concept, not a production-ready deployment.
- The pipeline uses GitLab CI/CD; uploading the source code to GitHub does not migrate the pipeline to GitHub Actions.
- The deployment replaces the existing container and may cause brief downtime.
- HTTPS, production-grade rollback, and further security hardening are follow-up improvements.

## Learning Outcomes

- Creating and running Docker containers.
- Configuring GitLab CI/CD stages.
- Using a self-hosted GitLab Runner.
- Performing HTTP health checks.
- Deploying a containerized website on AWS EC2.
- Documenting an infrastructure and CI/CD proof of concept.

