FROM debian:bullseye-slim

ARG user=will.container
ARG home=/home/${user}
ARG dotfiles_dir=${home}/dotfiles
ARG uid=1001
ARG passwd=docker

ENV DEBIAN_FRONTEND=noninteractive
WORKDIR /tmp
COPY . /tmp/dotfiles/
RUN apt update\
  && apt install -y sudo\
  && useradd --uid ${uid} --create-home ${user} -G sudo\
  && echo "${user}:${passwd}" | chpasswd\
  && mv /tmp/dotfiles ${dotfiles_dir}\
  && chown ${user}: ${dotfiles_dir}\
  && ${dotfiles_dir}/install_dependencies\
  && usermod --shell /usr/bin/zsh ${user}

USER ${user}
RUN ${dotfiles_dir}/deploy

WORKDIR ${home}
ENTRYPOINT ["zsh"]
