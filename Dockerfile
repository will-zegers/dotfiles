FROM ubuntu:latest

ARG user=will.zegers
ARG group=${user}
ARG uid=1001
ARG pw=docker
ARG home=/home/${user}
ARG dir=${home}/dotfiles

USER root
ADD ./install_dependencies /tmp/install_dependencies
RUN DEBIAN_FRONTEND=noninteractive /tmp/install_dependencies
RUN useradd --uid ${uid} \
            --shell /usr/bin/zsh \
            --create-home ${user} \
    && echo "${user}:${pw}" | chpasswd
RUN apt install -y iproute2 sudo

USER ${user}
COPY --chown=${user}:${group} . ${dir}
RUN ${dir}/deploy
WORKDIR ${home}
ENTRYPOINT ["zsh"]
