namespace :db_work do
  desc "TODO"
  task daily_cleanup: :environment do
    LocationFlavor.delete_all
  end
end
