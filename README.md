# myresume

Rails app to organize resumes (CVs) with the generation of PDF right within the app.

## System requirements

1. [Docker](https://docs.docker.com/install/)
2. [Docker Compose](https://docs.docker.com/compose/install/)

## Build

```bash
docker-compose build
```

## Initialize

```bash
docker-compose run web rake db:migrate
docker-compose run web rake db:seed
```

## Run

```bash
docker-compose up
```

## Data entry

Visit [http://localhost:5500/admin](http://localhost:5500/admin).
The default login email is: admin@example.com, password: password.
