# Learn more: http://github.com/javan/whenever

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

##LOCAL COMMANDS
# Clear cron: crontab -r
# update cron: whenever --update-crontab
# update cron development: whenever --update-crontab --set environment='development'

## ENVIROMENTAL SETTINGS
ENV.each_key do |key|
  env key.to_sym, ENV[key]
end
# set :environment, "development"
set :environment, ENV["RAILS_ENV"]

# set :bundle_command, "/usr/local/bin/bundle exec"
env :PATH, ENV["PATH"]
set :output, "./log/cron.log"

# every 1.minutes do
#   runner "puts 'work damnit'"
# end

# every 1.minutes do
every 1.day, at: ["12:00 am"] do
  rake "db_work:daily_cleanup"
end

every 1.day, at: ["12:01 am"] do
  rake "al:load_data"
end
every 1.day, at: ["12:02 am"] do
  rake "ar:load_data"
end
every 1.day, at: ["12:03 am"] do
  rake "az:load_data"
end
every 1.day, at: ["12:04 am"] do
  rake "co:load_data"
end
every 1.day, at: ["12:05 am"] do
  rake "fl:load_data"
end
every 1.day, at: ["12:06 am"] do
  rake "ga:load_data"
end
every 1.day, at: ["12:07 am"] do
  rake "ia:load_data"
end
every 1.day, at: ["12:08 am"] do
  rake "id:load_data"
end
every 1.day, at: ["12:09 am"] do
  rake "il:load_data"
end
every 1.day, at: ["12:10 am"] do
  rake "in:load_data"
end
every 1.day, at: ["12:11 am"] do
  rake "ks:load_data"
end
every 1.day, at: ["12:12 am"] do
  rake "ky:load_data"
end
every 1.day, at: ["12:13 am"] do
  rake "mi:load_data"
end
every 1.day, at: ["12:14 am"] do
  rake "mn:load_data"
end
every 1.day, at: ["12:15 am"] do
  rake "mo:load_data"
end
every 1.day, at: ["12:16 am"] do
  rake "nc:load_data"
end
every 1.day, at: ["12:17 am"] do
  rake "nd:load_data"
end
every 1.day, at: ["12:18 am"] do
  rake "ne:load_data"
end
every 1.day, at: ["12:19 am"] do
  rake "oh:load_data"
end
every 1.day, at: ["12:20 am"] do
  rake "sc:load_data"
end
every 1.day, at: ["12:21 am"] do
  rake "sd:load_data"
end
every 1.day, at: ["12:22 am"] do
  rake "tn:load_data"
end
every 1.day, at: ["12:23 am"] do
  rake "tx:load_data"
end
every 1.day, at: ["12:24 am"] do
  rake "ut:load_data"
end
every 1.day, at: ["12:25 am"] do
  rake "wi:load_data"
end
every 1.day, at: ["12:26 am"] do
  rake "wy:load_data"
end
