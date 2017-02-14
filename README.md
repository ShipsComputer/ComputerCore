# Computer Core

Computer Core is the central rails app for collecting and processing data from sensor arrays.

## Update Server

```
$ git pull
$ rake db:migrate RAILS_ENV=production
```

## Update schedule

`$ whenever --update-crontab`
