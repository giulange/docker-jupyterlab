# NAME: dclong/jupyterlab
FROM dclong/python-nodejs
# GIT: https://github.com/dclong/docker-python-nodejs.git

RUN pip3 install --no-cache-dir nbdime "nbconvert==5.6.1" "jupyterlab>=2.1.0,<3.2.0" \
      jupyterlab_widgets \
      jupyterlab_vim \
      jupyterlab-lsp python-language-server[all] \
      jupyter-resource-usage \
    && jupyter labextension disable @axlair/jupyterlab_vim \
    && npm cache clean --force
    
# Python 3.7 Kernel
RUN /opt/pyenv/versions/3.7.*/bin/python -m pip install ipykernel \
    && /opt/pyenv/versions/3.7.*/bin/python -m ipykernel install --name python3.7 --display-name "Python 3.7"

COPY scripts /scripts
#COPY settings/themes.jupyterlab-settings /etc/jupyter/lab/user-settings/@jupyterlab/apputils-extension/themes.jupyterlab-settings
COPY settings /settings
