FROM ubuntu:jammy-20221101

ARG user=will.container
ARG home=/home/${user}
ARG dotfiles_dir=${home}/dotfiles
ARG uid=1001
ARG pw=docker

RUN export DEBIAN_FRONTEND=noninteractive
RUN useradd --uid ${uid} \
            --create-home ${user} \
    && echo "${user}:${pw}" | chpasswd
RUN apt update && apt install -y git

USER ${user}
WORKDIR ${home}
RUN git clone https://github.com/will-zegers/dotfiles.git --recursive

USER root
RUN ${home}/dotfiles/install_dependencies
RUN usermod --shell /usr/bin/zsh ${user}

USER ${user}
RUN ${dotfiles_dir}/deploy
ENTRYPOINT ["zsh"]
