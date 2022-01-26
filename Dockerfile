FROM debian:stable-slim

RUN dpkg --add-architecture i386
RUN apt update && \
    apt install -y wine32 wine64-preloader wine32-preloader wine-binfmt \
        wget curl git msitools p7zip-full unzip && \
    apt clean

RUN git clone https://github.com/est31/msvc-wine-rust /xbuild
WORKDIR /xbuild
RUN ./get.sh licenses-accepted

ENV CARGO_TARGET_X86_64_PC_WINDOWS_MSVC_LINKER=/xbuild/linker-scripts/linkx64.sh
ENV CARGO_TARGET_I686_PC_WINDOWS_MSVC_LINKER=/xbuild/linker-scripts/linkx86.sh
ENV HOME=/tmp/tmphome

# boot script, it just create home dir b4 running
RUN echo 'IyEvYmluL2Jhc2gKbWtkaXIgL3RtcC90bXBob21lCmV4ZWMgIiRAIg==' | base64 -d | tee /docker-entrypoint.sh
RUN chmod a+x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]

