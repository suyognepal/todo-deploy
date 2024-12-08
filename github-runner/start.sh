#!/bin/bash

# Ensure environment variables are set
if [[ -z "$REPO_OWNER" || -z "$REPO_NAME" || -z "$ACCESS_TOKEN" || -z "$RUNNER_VERSION" ]]; then
  echo "Environment variables REPO_OWNER, REPO_NAME, ACCESS_TOKEN, and RUNNER_VERSION must be set!"
  exit 1
fi

# Navigate to the runner directory or create it if it doesn't exist
if [[ ! -d "/home/docker/actions-runner" ]]; then
  echo "Creating actions-runner directory..."
  mkdir -p /home/docker/actions-runner
fi

cd /home/docker/actions-runner || { echo "Failed to access actions-runner directory!"; exit 1; }

# Download and extract the runner if not already present
if [[ ! -f "./config.sh" ]]; then
  echo "Downloading GitHub Actions Runner version ${RUNNER_VERSION}..."
  curl -o actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L \
    https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz || {
    echo "Failed to download actions-runner!"
    exit 1
  }
  echo "Extracting runner files..."
  tar xzf ./actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz
  ./bin/installdependencies.sh
fi

# Configure the runner
#!/bin/bash

echo "Debugging Information:"
echo "Repository Owner: $REPO_OWNER"
echo "Repository Name: $REPO_NAME"
echo "Access Token: ${ACCESS_TOKEN:0:4}... (redacted)"
echo "Runner Version: $RUNNER_VERSION"
echo "Configuring GitHub Actions Runner..."

./config.sh --url https://github.com/$REPO_OWNER/$REPO_NAME --token $ACCESS_TOKEN --unattended || {
    echo "Failed to configure the runner! Check the details above."
    exit 1
}

cleanup() {
    echo "Removing runner..."
    ./config.sh remove --unattended --token ${ACCESS_TOKEN} || echo "Failed to remove the runner!"
}

trap 'cleanup; exit 130' INT
trap 'cleanup; exit 143' TERM

echo "Starting GitHub Actions Runner..."
./run.sh & wait $!
