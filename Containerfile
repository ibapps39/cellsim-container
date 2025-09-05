# Using latest
FROM fedora:latest

LABEL maintainer="https://github.com/ibapps39"
LABEL description="IBM Cell System Simulator Container"

# Disable weak crypto checks and install necessary tools
RUN echo "sslverify=false" >> /etc/dnf/dnf.conf && \
    dnf install -y glibc libX11 libXext libXft libXt libXmu libXpm libSM libICE libstdc++.so.6 xorg-x11-xauth xterm && \
    dnf clean all

# Copy the RPMs into the container
COPY rpms/ /tmp/rpms/

# Install the Cell BE simulator and required libraries
RUN dnf install -y /tmp/rpms/*.rpm || true && \
    dnf clean all

# Set environment variables required by the simulator
ENV SYSTEMSIM_TOP=/opt/ibm/systemsim-cell

# Default working directory
WORKDIR /opt/ibm/systemsim-cell

# Default command to run the simulator
CMD ["bash"]
