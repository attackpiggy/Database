# Green Navigation OSM database

This repository allows you to create a database server with OpenStreetMap data fast. To reduce the dependencies, it uses docker for the database and the import task. `Osm2pgsql` (in the Ubuntu repositories) does this fast. After the import, the PostgreSQL database is active on `postgis:5432` with the credentials `greennav:greennav`.

## TODO

- Make database changes persistent (See postgres docker image for information)
- Create docker images so you don't have to install `wget` and `osm2pgsql` for every import
- Automate the password entry for `osm2pgsql`

## Dependencies

Only docker is needed. Check the documentation on how to install docker and add your user to the docker group (so you don't have to type `sudo docker` every time).

## Instructions

TL;DR

```zsh
./start_db.sh
./import.sh # enter greennav as password
./import_test.sh
```

Full instructions:

### 1. Create the database

To start up the development PostgreSQL container, simple run

```zsh
./start_db.sh
```

You can verify that the db is running by checking

```zsh
docker ps
```

(postgis-greennav should show up)

### 2. Import osm data

Once it is up and running, modify the `import/create-luebeck.sh` file to download and import the region you need. Then proceed with

```zsh
./import.sh
```

When all dependencies are downloaded and installed, you will be prompted for a password. Just enter `greennav` (didn't find a way to automate this yet).

### 3. (Optional) verify that data has been written

As an example, a simple counter has been implemented in Python. Just spin up the third container with

```zsh
./test_import.sh
```

The output should be `Points/Lines/Roads: 69471/102701/8385`. Check `test/test.py` for an example on how to connect to the db.
