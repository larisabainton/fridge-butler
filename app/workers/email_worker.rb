class EmailWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  # recurrence { daily }

  def perform
    Grocery.expiration_check.each do |grocery|
      ExpirationConfirmation.expired_email(grocery).deliver_later
    end
  end
end
