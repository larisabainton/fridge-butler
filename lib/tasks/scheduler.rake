desc "This task is called by the Heroku scheduler add-on"

task :send_email => :environment do
  Grocery.expiration_check.each do |grocery|
    ExpirationConfirmation.expired_email(grocery).deliver_later
  end
end
