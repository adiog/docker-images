# jupyter+cling

```
export LOCALDIR=$HOME/HostJupyterCling
export LOCALPORT=5555

mkdir -p $LOCALDIR

sudo docker run -it -p $LOCALPORT:8888 -v $LOCALDIR:/Jupyter adiog/cling-jupyter
```

