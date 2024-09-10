# Base image
FROM debian:bullseye

# Environment variables
ENV CARDANO_VERSION=1.35.3
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y build-essential curl libffi-dev libgmp-dev libssl-dev \
    libtinfo-dev libsystemd-dev zlib1g-dev tmux pkg-config \
    libncursesw5 libtool autoconf git g++ systemd libsqlite3-dev \
    cabal-install ghc wget libpq-dev vim  # Added vim for manual editing

# Install libsodium
RUN git clone https://github.com/input-output-hk/libsodium && \
    cd libsodium && \
    git checkout 66f017f1 && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    cd .. && rm -rf libsodium

# Clone the Cardano Node repository
RUN git clone https://github.com/input-output-hk/cardano-node.git && \
    cd cardano-node && \
    git fetch --tags && \
    git checkout tags/${CARDANO_VERSION}

# Start a bash shell for manual troubleshooting
CMD ["bash"]
