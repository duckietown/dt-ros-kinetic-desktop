FROM duckietown/dt-ros-kinetic-base:daffy-amd64

COPY dependencies-apt.txt /tmp/

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    $(awk -F: '/^[^#]/ { print $1 }' /tmp/dependencies-apt.txt | uniq) \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sSL https://github.com/novnc/noVNC/archive/v1.1.0.tar.gz | tar -xzv -C / \ 
  && mv /noVNC-1.1.0 /noVNC

RUN adduser --gecos "ROS User" --disabled-password ros \
	&& usermod -a -G dialout ros \
        && echo "ros ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/99_aptget \
	&& chmod 0440 /etc/sudoers.d/99_aptget \
	&& chown root:root /etc/sudoers.d/99_aptget

ADD bashrc /.bashrc
ADD bashrc /home/ros/.bashrc

ADD supervisord.conf /
ADD xterm /home/ros/Desktop/

ENV HOME=/home/ros QT_X11_NO_MITSHM=1 HOME=/home/ros

ADD entrypoint /usr/local/bin/entrypoint
RUN chmod 755 /usr/local/bin/entrypoint

CMD ["/bin/bash"]
ENTRYPOINT ["/usr/local/bin/entrypoint"]
