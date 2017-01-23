# Green Navigation OSM database

This repository allows you to create a database server with OpenStreetMap data fast. To reduce the dependencies, it uses docker for the database and the import task. `Osm2pgsql` (in the Ubuntu repositories) does this fast. After the import, the PostgreSQL database is active on `postgis:5432` with the credentials `greennav:greennav`.

## TODO

- Make database changes persistent (See postgres docker image for information)
- Automate the password entry for `osm2pgsql`

## Dependencies

Only docker is needed. Check the documentation on how to install docker and add your user to the docker group (so you don't have to type `sudo docker` every time). For Windows, install docker and enable access to the C: drive (in the settings).

## Instructions

Linux/OSX

```zsh
./example.sh # enter greennav as password
```

or under Windows

- Install docker
- Enable sharing of C: (right click on tray icon)

```powershell
.\example.ps1 # enter greennav as password
```

The output should be `Points/Lines/Roads: 69471/102701/8385`. Check `test/test.py` for an example on how to connect to the db.
