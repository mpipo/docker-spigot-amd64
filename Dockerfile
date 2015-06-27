# Edit FROM line to something else based on Archlinux if you want it to run on other architectures. (eg yyolk/rpi-archlinuxarm for ARMv6)

FROM base/archlinux

# Pacman fixes

RUN pacman -Sy --noconfirm
RUN pacman -S --noconfirm --needed openssl pacman
RUN pacman-db-upgrade

# Install Java
RUN pacman -S --noconfirm --needed jre8-openjdk-headless

# Install wget
RUN pacman -S --noconfirm --needed wget

# Clean up cache
RUN pacman -Scc --noconfirm
RUN rm -rf /var/cache/pacman/pkg

# Add Minecraft user
RUN useradd -m -g users -s /bin/bash -m -d /minecraft minecraft

# Switch to Minecraft user
USER minecraft

# Add build and init script
ADD startServer.sh /minecraft

RUN chmod 755 /minecraft/startServer.sh

ENTRYPOINT ["/bin/bash", "-c", "/minecraft/startServer.sh"]