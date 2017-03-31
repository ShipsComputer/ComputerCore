# Computer Core

Computer Core is the central rails app for collecting and processing data from sensor arrays.

## Docker

`docker-compose build`

`docker-compose run web rake db:setup`

`docker-compose up`

## Production

`rm tmp/pids/server.pid || true && docker-compose -f production.yml up -d`

## Test

`docker-compose run -e "RAILS_ENV=test" web rake db:create db:migrate`

`docker-compose run -e "RAILS_ENV=test" web rake test`

## API

### Create coordinate

```
curl \
  -F latitude=-87.78429035612915 \
  -F longitude=-62.3206518996039 \
  -F 'timestamp=2015-01-01 00:00:00' \
  -F sensor_array_handle=core_pi \
  -X POST http://localhost:3000/api/v1/coordinates
```
