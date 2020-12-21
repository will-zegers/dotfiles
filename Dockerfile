FROM ubuntu

ARG USER=will.zegers
ARG UID=1001
ARG GID=1001
ARG PW=docker
ARG HOME=/home/${USER}
ARG DIR=${HOME}/dotfiles
ARG COLOR="cyan"

USER root
ADD ./install_dependencies /tmp/install_dependencies
RUN DEBIAN_FRONTEND=noninteractive /tmp/install_dependencies
RUN useradd --uid ${UID} \
            --shell /usr/bin/zsh \
            --create-home ${USER} \
    && echo "${USER}:${PW}" | chpasswd

USER ${USER}
COPY . ${DIR}
ENV PROMPT_COLOR ${COLOR}
RUN ${DIR}/deploy
WORKDIR ${HOME}
ENTRYPOINT ["zsh"]
