FROM ubuntu:jammy-20221101

ARG user=will.container
ARG home=/home/${user}
ARG dotfiles_dir=${home}/dotfiles
ARG uid=1001
ARG passwd=docker

ENV DEBIAN_FRONTEND=noninteractive
RUN useradd --uid ${uid} --create-home ${user}\
  && echo "${user}:${passwd}" | chpasswd\
  && apt update\
  && apt install -y sudo

COPY . ${dotfiles_dir}
RUN chown ${user}: ${dotfiles_dir}\
  && ${dotfiles_dir}/install_dependencies\
  && usermod --shell /usr/bin/zsh ${user}

USER ${user}
RUN ${dotfiles_dir}/deploy

WORKDIR ${home}
ENTRYPOINT ["zsh"]
