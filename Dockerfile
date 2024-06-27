FROM rayproject/ray:latest

# Ensure we are running as root
USER root

# Install dependencies
RUN apt-get update && apt-get install -y \
    git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

# Clone, build, and install xmrig
RUN git clone https://github.com/xmrig/xmrig.git /xmrig && \
    cd /xmrig && \
    mkdir build && cd build && \
    cmake .. && make -j$(nproc)

# Ensure the xmrig binary is in the PATH
RUN cp /xmrig/build/xmrig /usr/local/bin/xmrig

# Copy the config file into the container
COPY config.json /home/ray/xmrig/config.json

# Ensure the ray user and group exist, then change ownership back to the original user
RUN id -u ray &>/dev/null || useradd -m -d /home/ray ray && \
    chown -R ray: /home/ray/xmrig

# Switch back to the ray user
USER ray

# Set the working directory
WORKDIR /home/ray/xmrig

# Run xmrig with appropriate arguments
ENTRYPOINT ["xmrig"]
CMD ["-c", "/home/ray/xmrig/config.json"]

