docker run --name postgis-greennav \
  -d -p 5432:5432 \
  -e POSTGRES_USER=greennav \
  -e POSTGRES_PASSWORD=greennav \
  -e POSTGRES_DB=gis \
  mdillon/postgis

# Download pbf
cd import
wget -N http://download.bbbike.org/osm/bbbike/Luebeck/Luebeck.osm.pbf
cd ..

docker run --rm -it -v $(pwd)/import:/data -w /data \
  --link postgis-greennav:postgis \
  openfirmware/osm2pgsql -c 'osm2pgsql --create \
    --database gis \
    --host postgis \
    --port 5432 \
    --username greennav \
    --password \
    /data/Luebeck.osm.pbf'

docker run --rm -it -v $(pwd)/test:/data -w /data \
  --link postgis-greennav:postgis \
  tedder42/python3-psycopg2 \
  python test.py
