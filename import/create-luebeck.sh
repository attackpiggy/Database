# Install dependencies
apt-get -y update
apt-get -y install wget osm2pgsql

mkdir /osmdata && cd /osmdata

# Download pbf
wget -N http://download.bbbike.org/osm/bbbike/Luebeck/Luebeck.osm.pbf

# Write to database
osm2pgsql --create \
  --database gis \
  --host postgis \
  --port 5432 \
  --username greennav \
  --password \
  Luebeck.osm.pbf
