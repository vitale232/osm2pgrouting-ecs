FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install \
    -y --no-install-recommends \
    wget bzip2 \
    python3 python3-virtualenv \
    git-core cmake build-essential \
    expat libexpat1-dev libboost-dev libboost-program-options-dev \
    && apt install -y --no-install-recommends libpqxx-dev

RUN mkdir /usr/src/app
WORKDIR /usr/src/app

COPY . /usr/src/app/
RUN git clone https://github.com/pgRouting/osm2pgrouting.git
WORKDIR /usr/src/app/osm2pgrouting

RUN cmake -H. -Bbuild
WORKDIR /usr/src/app/osm2pgrouting/build
RUN make -j4
RUN make install

WORKDIR /usr/src/app

RUN ["chmod", "+x", "/usr/src/app/entrypoint.sh"]
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]
