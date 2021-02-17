FROM ubuntu:bionic

ARG user=will.zegers
ARG group=${user}
ARG uid=1001
ARG pw=docker
ARG home=/home/${user}
ARG dir=${home}/dotfiles
ARG prompt_color="cyan"

USER root
ADD ./install_dependencies /tmp/install_dependencies
RUN DEBIAN_FRONTEND=noninteractive /tmp/install_dependencies
RUN useradd --uid ${uid} \
            --shell /usr/bin/zsh \
            --create-home ${user} \
    && echo "${user}:${pw}" | chpasswd

USER ${user}
COPY --chown=${user}:${group} . ${dir}
ENV PROMPT_COLOR ${prompt_color}
RUN ${dir}/deploy
WORKDIR ${home}
ENTRYPOINT ["zsh"]
