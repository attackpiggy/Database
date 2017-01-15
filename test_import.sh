docker run -it \
  --volume $(pwd):/data \
  --link postgis-greennav:postgis \
  python:2.7 /bin/sh -c 'cd /data/test; ./get_stats.sh'
