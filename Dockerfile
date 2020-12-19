# NAME: dclong/jupyterlab
FROM dclong/jupyter-nodejs
# GIT: https://github.com/dclong/docker-jupyter-nodejs.git

RUN pip3 install --no-cache-dir "jupyterlab>=2.1.0,<2.3.0" \
      # jupyter-lsp 
      python-language-server[all] \
      jupyter-resource-usage \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager \
    && jupyter labextension install jupyterlab-favorites \
    && jupyter labextension install jupyterlab-recents \
    # && jupyter labextension install @krassowski/jupyterlab-lsp \
    && npm cache clean --force

COPY scripts /scripts
COPY settings /settings
