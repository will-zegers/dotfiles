# Basic container build to test that everything installs and deploys with no errors
ARG base_container=debian:stable-slim
FROM ${base_container}

ARG user=will
ARG home=/home/${user}
ARG dotfiles_dir=${home}/dotfiles

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt install -y sudo
RUN groupadd -f sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \/etc/sudoers
RUN useradd --create-home ${user} -G sudo
COPY . ${dotfiles_dir}
RUN chown -R ${user}: ${dotfiles_dir}
RUN ${dotfiles_dir}/install_dependencies

USER ${user}
RUN ${dotfiles_dir}/deploy

WORKDIR ${home}
ENTRYPOINT ["/usr/bin/zsh"]
