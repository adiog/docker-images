FROM gcc:7

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y apt-utils git make

RUN git clone https://gitlab.kitware.com/cmake/cmake \
    && cd cmake/ \
    && git checkout v3.9.5 \
    && ./bootstrap --prefix=/usr \
    && make -j 4 \
    && make install \
    && rm -fr /cmake

