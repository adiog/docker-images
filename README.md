# jupyter+cling

## Running image from hub.docker.com:
```
export LOCALDIR=$HOME/HostJupyterCling
export LOCALPORT=8888

mkdir -p $LOCALDIR

sudo docker run -it -p $LOCALPORT:8888 -v $LOCALDIR:/Jupyter adiog/cling-jupyter
```

## Building image locally:
```
for cling in cling-*; do ./$cling/docker.build.sh; done
```

