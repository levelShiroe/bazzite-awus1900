# Use the NVIDIA version of Bazzite
FROM ghcr.io/ublue-os/bazzite-nvidia:stable

LABEL org.opencontainers.image.title="bazzite-awus1900"
LABEL org.opencontainers.image.description="Bazzite ISO with AWUS1900 driver baked in"

# Add required packages to build the driver
RUN rpm-ostree install dkms git gcc make kernel-devel kernel-headers

# Clone and build the AWUS1900 driver (Realtek 8814AU)
RUN git clone https://github.com/morrownr/8814au.git /opt/8814au && \
    cd /opt/8814au && \
    ./install-driver.sh && \
    rm -rf /opt/8814au
