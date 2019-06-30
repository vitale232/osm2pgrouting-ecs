#!/bin/sh

wget -nv $OSM_DOWNLOAD_URL

bzip2 -cdk /usr/src/app/$OSM_DOWNLOADED_FILE > \
           /usr/src/app/$OSM_UNZIPPED_FILENAME

osm2pgrouting --file /usr/src/app/$OSM_UNZIPPED_FILENAME \
    --conf /usr/local/share/osm2pgrouting/$MAP_CONFIG_FILENAME \
    --addnodes \
    --attributes \
    --tags \
    --host $RDS_HOST \
    --port $RDS_PORT \
    --dbname $RDS_DB_NAME \
    --user $RDS_USER \
    --password $RDS_PASSWORD \
    --clean
