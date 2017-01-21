# Install dependencies
wget -N wget -N http://download.bbbike.org/osm/bbbike/Luebeck/Luebeck.osm.pbf

# Write to database
osm2pgsql --create \
  --database gis \
  --host postgis \
  --port 5432 \
  --slim \
  --username greennav \
  --password \
  Luebeck.osm.pbf
