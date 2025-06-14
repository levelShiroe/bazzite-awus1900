# Use Bazzite with NVIDIA driver baked in
FROM ghcr.io/ublue-os/bazzite-nvidia:stable

# Optional metadata (shows up in About panel)
LABEL org.opencontainers.image.title="bazzite-awus1900"
LABEL org.opencontainers.image.description="Bazzite ISO with AWUS1900 driver built-in"

# Install AWUS1900 (Realtek 8814AU) driver
RUN dnf install -y dkms git gcc make kernel-devel kernel-headers

# Clone and install the driver from source
RUN git clone https://github.com/morrownr/8814au.git /opt/8814au \
    && cd /opt/8814au && ./install-driver.sh

# Clean up to reduce image size
RUN rm -rf /opt/8814au
