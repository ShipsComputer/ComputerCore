# Computer Core

Computer Core is the central rails app for collecting and processing data from sensor arrays.

## Docker

`docker-compose build`

`docker-compose run web rake db:setup`

`docker-compose up`

## Running tests in Docker

`docker-compose run web rake test`

## Production

`rm tmp/pids/server.pid || true && docker-compose -f production.yml up -d`
