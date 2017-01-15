import psycopg2

def get_stats(connection):
    cur = conn.cursor()

    cur.execute('select count(*) from planet_osm_point;')
    count_points = cur.fetchone()[0]

    cur.execute('select count(*) from planet_osm_line;')
    count_lines = cur.fetchone()[0]

    cur.execute('select count(*) from planet_osm_roads;')
    count_roads = cur.fetchone()[0]

    cur.close()
    return (count_points, count_lines, count_roads)


conn = psycopg2.connect(host='postgis', dbname='gis',
    user='greennav', password='greennav')

count_points, count_lines, count_roads = get_stats(conn)
print("Points/Lines/Roads: {}/{}/{}".format(
    count_points, count_lines, count_roads))

conn.close()
