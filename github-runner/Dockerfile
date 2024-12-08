FROM ubuntu:24.04
ARG RUNNER_VERSION="2.314.1"

LABEL maintainer="suyog.nepal@gmail.com"

# Set the timezone to Asia/Kathmandu
ENV TZ=Asia/Kathmandu
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install basic dependencies and Docker client
RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install -y \
    apt-transport-https \
    curl \
    jq \
    wget \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3 \
    python3-venv \
    python3-dev \
    python3-pip \
    libicu-dev \
    sudo \
    ca-certificates \
    gnupg \
    software-properties-common \
    openssh-server \
    rsync

RUN useradd -m docker && usermod -aG systemd-journal docker

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" \
    && apt-get update && apt-get install -y docker-ce-cli

RUN mkdir -p /home/docker/actions-runner \
    && curl -o /home/docker/actions-runner/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -L \
       https://github.com/actions/runner/releases/download/v${RUNNER_VERSION}/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz \
    && tar -xzf /home/docker/actions-runner/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz -C /home/docker/actions-runner \
    && rm /home/docker/actions-runner/actions-runner-linux-x64-${RUNNER_VERSION}.tar.gz

RUN chown -R docker:docker /home/docker/actions-runner \
    && chmod -R u+rwX /home/docker/actions-runner && chmod u+x /home/docker/actions-runner/

RUN /home/docker/actions-runner/bin/installdependencies.sh

COPY start.sh /home/docker/start.sh
RUN chmod +x /home/docker/start.sh

USER docker

ENTRYPOINT ["/home/docker/start.sh"]
