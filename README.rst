Alpine Dask Docker Images
=========================

Here we provide a few Docker_ images for running Dask_ on `Alpine Linux`_. These
are designed to be as small as possible while still providing a good user
experience.

Three images are provided:

- ``jcrist/alpine-conda`` |alpine-conda|

    A base image with miniconda_ installed.

- ``jcrist/alpine-dask`` |alpine-dask|

    An image for running both the dask schedulers and workers.

- ``jcrist/alpine-dask-notebook`` |alpine-dask-notebook|

    An image with all of the above, as well as `Jupyter Notebook`_ and
    JupyterLab_ installed.

These images can be used as is, or extended with additional packages by using
them as a base image:


.. code-block:: docker

    FROM jcrist/alpine-dask:1.2.2

    # Add scikit-learn and numba, and cleanup afterwards
    RUN /opt/conda/bin/conda install --freeze-installed -y \
            scikit-learn \
            numba \
        && /opt/conda/bin/conda clean -afy \
        && find /opt/conda/ -follow -type f -name '*.a' -delete \
        && find /opt/conda/ -follow -type f -name '*.pyc' -delete


Alternatively, additional packages can be installed at runtime via the
``EXTRA_CONDA_PACKAGES``/``EXTRA_PIP_PACKAGES`` environment variables:

.. code-block:: shell

    $ docker run -e "EXTRA_CONDA_PACKAGES=scikit-learn numba" jcrist/alpine-dask dask-scheduler


These images should be drop-in usable with the existing `Dask Helm Chart`_, with
the benefit of being much smaller images.


.. |alpine-conda| image:: https://img.shields.io/microbadger/image-size/jcrist/alpine-conda.svg
   :target: https://cloud.docker.com/repository/docker/jcrist/alpine-conda
.. |alpine-dask| image:: https://img.shields.io/microbadger/image-size/jcrist/alpine-dask.svg
   :target: https://cloud.docker.com/repository/docker/jcrist/alpine-dask
.. |alpine-dask-notebook| image:: https://img.shields.io/microbadger/image-size/jcrist/alpine-dask-notebook.svg
   :target: https://cloud.docker.com/repository/docker/jcrist/alpine-dask-notebook

.. _Docker: https://www.docker.com/
.. _Dask: https://dask.org/
.. _Alpine Linux: https://alpinelinux.org
.. _miniconda: https://docs.conda.io/en/latest/miniconda.html
.. _Jupyter Notebook: https://jupyter.org/
.. _JupyterLab: https://jupyterlab.readthedocs.io/en/stable/
.. _Dask Helm Chart: https://github.com/helm/charts/tree/master/stable/dask
