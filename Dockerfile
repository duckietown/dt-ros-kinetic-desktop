FROM duckietown/dt-ros-kinetic-base:devel20

COPY dependencies-apt.txt /tmp/

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    $(awk -F: '/^[^#]/ { print $1 }' /tmp/dependencies-apt.txt | uniq) \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar -xzv -C /root/ \ 
  && mv /root/noVNC-1.1.0 /root/novnc \
  && ln -s /root/novnc/vnc_lite.html /root/novnc/index.html

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN rm /tmp/dependencies*

ENV DEBIAN_FRONTEND noninteractive
ENV ENV_SCREEN_RESOLUTION 1024x768
ENV DISPLAY :0

ENTRYPOINT ["/ros_entrypoint.sh"]

# configure command
CMD ["bash"]
