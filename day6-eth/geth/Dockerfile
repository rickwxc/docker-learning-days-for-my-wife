FROM ethereum/client-go:stable



ENV INSTALL_PATH /geth_app
RUN mkdir -p $INSTALL_PATH
WORKDIR $INSTALL_PATH

COPY scripts $INSTALL_PATH
