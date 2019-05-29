FROM jcrist/alpine-dask:latest

# Does the following in one layer
# - Installs jupyter notebook and jupyter lab, with dependencies
# - Installs the dask labextension
# - Cleans up after building the dask labextension
# - Uninstalls transient nodejs dependency
# - Cleans up conda files
# - Removes unnecessary static libraries
# - Removes unnecessary *.pyc files
# - Removes unnecessary *.js.map files
RUN export PATH="/opt/conda/bin/:$PATH" \
    && conda install --freeze-installed -y \
        notebook==5.7.8 \
        jupyterlab=0.35.5 \
        ipywidgets \
        nodejs \
    && pip install dask-labextension==0.3.3 --no-cache-dir --no-dependencies \
    && jupyter labextension install @jupyter-widgets/jupyterlab-manager@0.38.1 dask-labextension@0.3 \
    && npm cache clean --force \
    && rm -rf /opt/conda/share/jupyter/lab/staging \
    && rm -rf /home/anaconda/.cache/yarn \
    && conda uninstall nodejs -y \
    && conda clean -afy \
    && find /opt/conda/ -follow -type f -name '*.a' -delete \
    && find /opt/conda/ -follow -type f -name '*.pyc' -delete \
    && find /opt/conda/ -follow -type f -name '*.js.map' -delete


COPY --chown=anaconda:anaconda jupyter_notebook_config.py /etc/jupyter/

CMD ["jupyter", "lab"]
