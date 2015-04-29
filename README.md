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
- run `docker build -t dsp .`

### Start DSP with linked MySQL database container
- run `docker run -d --link mysql-dsp:db --name dsp -e "DB_USER=dsp" -e "DB_PASS=dsp" -e "DB_NAME=dsp" dsp`

### Start DSP with external MySQL database
- run `docker run -d -e "DB_HOST=db.foo.bar" -e "DB_PORT=3306" --name dsp -e "DB_USER=dsp" -e "DB_PASS=dsp" -e "DB_NAME=dsp" dsp`
