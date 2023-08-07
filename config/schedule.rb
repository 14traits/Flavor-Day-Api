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
# ENV.each_key do |key|
#   env key.to_sym, ENV[key]
# end
set :environment, "development"
# set :environment, ENV["RAILS_ENV"]

# set :bundle_command, "/usr/local/bin/bundle exec"
env :PATH, ENV["PATH"]
set :output, "./log/cron.log"

# every 1.minutes do
#   runner "puts 'work damnit'"
# end

# every 1.minutes do
every 1.day, at: ["2:00 am"] do
  rake "db_work:daily_cleanup"
end

every 1.day, at: ["2:05 am"] do
  rake "al:load_data"
end
every 1.day, at: ["2:06 am"] do
  rake "ar:load_data"
end
every 1.day, at: ["2:07 am"] do
  rake "az:load_data"
end
every 1.day, at: ["2:08 am"] do
  rake "co:load_data"
end
every 1.day, at: ["2:09 am"] do
  rake "fl:load_data"
end
every 1.day, at: ["2:10 am"] do
  rake "ga:load_data"
end
every 1.day, at: ["2:11 am"] do
  rake "ia:load_data"
end
every 1.day, at: ["2:12 am"] do
  rake "id:load_data"
end
every 1.day, at: ["2:12 am"] do
  rake "il:load_data"
end
every 1.day, at: ["2:13 am"] do
  rake "in:load_data"
end
every 1.day, at: ["2:14 am"] do
  rake "ks:load_data"
end
every 1.day, at: ["2:15 am"] do
  rake "ky:load_data"
end
every 1.day, at: ["2:16 am"] do
  rake "mi:load_data"
end
every 1.day, at: ["2:17 am"] do
  rake "mn:load_data"
end
every 1.day, at: ["2:18 am"] do
  rake "mo:load_data"
end
every 1.day, at: ["2:19 am"] do
  rake "nc:load_data"
end
every 1.day, at: ["2:20 am"] do
  rake "nd:load_data"
end
every 1.day, at: ["2:21 am"] do
  rake "ne:load_data"
end
every 1.day, at: ["2:22 am"] do
  rake "oh:load_data"
end
every 1.day, at: ["2:23 am"] do
  rake "sc:load_data"
end
every 1.day, at: ["2:24 am"] do
  rake "sd:load_data"
end
every 1.day, at: ["2:25 am"] do
  rake "tn:load_data"
end
every 1.day, at: ["2:26 am"] do
  rake "tx:load_data"
end
every 1.day, at: ["2:27 am"] do
  rake "ut:load_data"
end
every 1.day, at: ["2:28 am"] do
  rake "wi:load_data"
end
every 1.day, at: ["2:29 am"] do
  rake "wy:load_data"
end
