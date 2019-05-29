.PHONY: all alpine-conda alpine-dask alpine-dask-notebook

all: alpine-conda alpine-dask alpine-dask-notebook

alpine-conda:
	docker build -t jcrist/alpine-conda:latest alpine-conda

alpine-dask: alpine-conda
	docker build -t jcrist/alpine-dask:latest alpine-dask

alpine-dask-notebook: alpine-dask
	docker build -t jcrist/alpine-dask-notebook:latest alpine-dask-notebook
