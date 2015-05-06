# Setup
## Get Docker
- See: [https://docs.docker.com/installation](https://docs.docker.com/installation)

## Get Docker Compose (optional)
- See [https://docs.docker.com/compose/install](https://docs.docker.com/compose/install)

# Start
## Using Docker Compose
- edit `docker-compose.yml` and change values to fit your needs
- run `docker-compose build`
- run `docker-compose up -d`

## Using CLI
**All the provided values are defaults and you should change them**
### Start the database
- run `docker run -d --name mysql-dsp -e "MYSQL_ROOT_PASSWORD=root" -e "MYSQL_DATABASE=dsp" -e "MYSQL_USER=dsp" -e "MYSQL_PASSWORD=dsp" mysql`

### Build DSP Image
- run `docker build -t dsp:1.9.2 .`

### Start DSP with linked MySQL database container
- run `docker run -d --link mysql-dsp:db -p 8080:80 --name dsp -e "DB_USER=dsp" -e "DB_PASS=dsp" -e "DB_NAME=dsp" -e "SERVERNAME=localhost" dsp:1.9.2`

### Start DSP with external MySQL database
- run `docker run -d -e "DB_HOST=db.foo.bar" -e "DB_PORT=3306" --name dsp -e "DB_USER=dsp" -e "DB_PASS=dsp" -e "DB_NAME=dsp" dsp:1.9.2`

# Access logs
Log files are located at `/opt/dreamfactory/platform/logs` and `/var/log/apache2`.

## Access from another container
You can access these directories from another container if you use the option `--volumes-from dsp`.

## Access from host machine
### Docker Compose
Edit `docker-compose.yml` and add `volumes:` section. See [See docs](https://docs.docker.com/compose/yml/#volumes)
### CLI
Add `-v HOST_PATH:/opt/dreamfactory/platform/logs -v HOST_PATH:/var/log/apache2`

