docker run --interactive --tty \
  --volume $(pwd):/data \
  --link postgis-greennav:postgis \
  ubuntu sh /data/import/create-luebeck.sh
