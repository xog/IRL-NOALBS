FROM ubuntu:20.04
LABEL Description="OBS Controll part of IRL stream setup based on the NOALBS by b3ck" Vendor="VooDoo Engineering" Version="0.1"
RUN apt update
RUN apt install -y tzdata
RUN ln -fs /usr/share/zoneinfo/Europe/Stockholm /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata
RUN apt dist-upgrade -y
RUN apt install git -y
RUN apt install nodejs npm --no-install-recommends -y
RUN mkdir /opt/NOALBS
WORKDIR /opt/NOALBS
RUN git clone https://github.com/715209/nginx-obs-automatic-low-bitrate-switching.git .
RUN npm install --production
RUN rm /opt/NOALBS/config.json
CMD ["npm", "start"]