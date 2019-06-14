FROM ubuntu

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt -y install git-core curl vim-nox 
RUN apt -y install gcc pkg-config libssl-dev
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- --default-toolchain -v stable -y
RUN . $HOME/.cargo/env
RUN rustup install stable
RUN rustup default stable
RUN git clone https://github.com/input-output-hk/jormungandr
RUN cd jormungandr
RUN cargo install --path jormungandr
RUN cargo install --path jcli


WORKDIR /cardano

EXPOSE 8080 8299

CMD bash -C 'start.sh';'bash'
