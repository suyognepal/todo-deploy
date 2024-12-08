# GitHub Actions Runner

This repository contains a Dockerfile for creating a GitHub Actions Runner.

## Features

- Installs the latest version of the GitHub Actions Runner
- Installs Docker client
- Installs basic dependencies (curl, jq, wget, build-essential, libssl-dev, libffi-dev, python3, python3-venv, python3-dev, python3-pip, libicu-dev, sudo, ca-certificates, gnupg, software-properties-common, openssh-server, rsync)
- Installs Docker client

## Usage
1. cd github-runner/
2. Build the Docker image by running `docker build -t my-github-actions-runner .`
3. Run the Docker image by running `docker run -d --name my-github-actions-runner -e ACCESS_TOKEN=<your_access_token> -e REPO_OWNER=<your_repo_owner> -e REPO_NAME=<your_repo_name> my-github-actions-runner`

## Environment Variables

- `ACCESS_TOKEN`: Your GitHub access token
- `REPO_OWNER`: The owner of the repository
- `REPO_NAME`: The name of the repository
- `RUNNER_VERSION`: Github runner version

