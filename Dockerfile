# Basic container build to test that everything installs and deploys with no errors
ARG base=debian:stable-slim
FROM ${base}

ARG user=will
ARG home=/home/${user}
ARG dotfiles_dir=${home}/dotfiles

ENV DEBIAN_FRONTEND=noninteractive
COPY . ${dotfiles_dir}
RUN ${dotfiles_dir}/install_dependencies --no-alacritty

RUN groupadd -f sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \/etc/sudoers
RUN useradd --home-dir ${home} -G sudo ${user}
RUN chown -R ${user}: ${home}

USER ${user}
RUN ${dotfiles_dir}/deploy

WORKDIR ${home}
ENTRYPOINT ["/usr/bin/zsh"]
