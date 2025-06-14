# Use the NVIDIA version of Bazzite
FROM ghcr.io/ublue-os/bazzite-nvidia:stable

LABEL org.opencontainers.image.title="bazzite-awus1900"
LABEL org.opencontainers.image.description="Bazzite ISO with AWUS1900 driver baked in"

# Install required packages using rpm-ostree
RUN rpm-ostree install dkms git gcc make kernel-devel kernel-headers

# Build and install the driver from a safe temp directory
RUN git clone https://github.com/morrownr/8814au.git /tmp/8814au && \
    cd /tmp/8814au && \
    ./install-driver.sh && \
    rm -rf /tmp/8814au
