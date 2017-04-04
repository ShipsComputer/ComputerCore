# Computer Core

Computer Core is the central rails app for collecting and processing data from sensor arrays.

## Development

`createdb computer_core_development`
`psql -c "CREATE USER computer_core_development WITH PASSWORD 'password';"`
`psql -c "GRANT ALL PRIVILEGES ON DATABASE "computer_core_development" to computer_core_development;"`
`bundle exec rake db:setup`
`bundle exec rails server`

## Production on a Pi

Get required packages
```
sudo apt-get update
sudo apt-get install ruby ruby-dev nginx-full libpq-dev git postgresql git -y
```

Clone ComputerCore
`git clone https://github.com/ShipsComputer/ComputerCore.git && cd ComputerCore`

Install rvm and set version
```
curl -L https://get.rvm.io | bash -s stable --ruby
rvm install ruby-2.3.1
```

Create Database
`sudo -u postgres psql`

```
CREATE DATABASE computer_core;
CREATE USER computer_core WITH PASSWORD 'password';
ALTER USER computer_core WITH SUPERUSER;
GRANT ALL PRIVILEGES ON DATABASE "computer_core" to computer_core;
\q
```

Bundle install
```
gem install bundle
bundle install
```

Setup database
`bundle exec rake db:setup RAILS_ENV=production`

Run server
`bundle exec rails server -e production -p 80`

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
