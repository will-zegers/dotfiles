FROM debian:bullseye-slim

ARG user=will
ARG home=/home/${user}
ARG dotfiles_dir=${home}/dotfiles
ARG passwd=docker

ENV DEBIAN_FRONTEND noninteractive
COPY . /tmp/dotfiles/
RUN apt update &&\
  apt install -y sudo &&\
  useradd --create-home ${user} -G sudo &&\
  echo "${user}:${passwd}" | chpasswd &&\
  echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \/etc/sudoers &&\
  mv /tmp/dotfiles ${dotfiles_dir} &&\
  chown -R ${user}: ${dotfiles_dir} &&\
  ${dotfiles_dir}/install_dependencies &&\
  usermod --shell /usr/bin/zsh ${user} &&\
  su ${user} ${dotfiles_dir}/deploy

WORKDIR ${home}
