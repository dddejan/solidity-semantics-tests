#
# Dockerfile for all the tools
#

FROM ubuntu:19.10

# Need this to add repositories
RUN apt-get update && apt-get install -y software-properties-common gnupg ca-certificates

# Extra for solidity
RUN apt-add-repository -y ppa:ethereum/ethereum

# Extra for mono
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list

# Install all the dependencies
RUN apt-get update && apt-get install -y \
    cmake \
    g++ \
    git \
    make \
    cvc4 libcvc4-dev \
    z3 libz3-dev \
    python3 python3-pip \
    libssl-dev \
    solc \
    wget \
    mono-devel \
    libboost-all-dev \
    time \
    joe

# Install python packages
RUN pip3 install mythril psutil

WORKDIR /solc-verify-examples

# Install verisol
ADD scripts/install_verisol.sh /solc-verify-examples/scripts/
RUN /solc-verify-examples/scripts/install_verisol.sh

# Install boogie
ADD scripts/install_boogie.sh /solc-verify-examples/scripts/
RUN /solc-verify-examples/scripts/install_boogie.sh

# Install solc-verify
ADD scripts/install_solc_verify.sh /solc-verify-examples/scripts/
RUN /solc-verify-examples/scripts/install_solc_verify.sh 7b01918dff3601632c2d68ce4429c6b3aca81eaf

#
# Add stuff that changes often below so that the heavy stuff above is cached on changes
#

# Update the path
ENV PATH="${PATH}:/solc-verify-examples/install/bin"

# Add the examples
ADD contracts /solc-verify-examples/contracts

# Add rest of scripts
ADD scripts /solc-verify-examples/scripts


