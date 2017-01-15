docker run --name postgis-greennav \
  -d -p 5432:5432 \
  -e POSTGRES_USER=greennav \
  -e POSTGRES_PASSWORD=greennav \
  -e POSTGRES_DB=gis \
  mdillon/postgis
