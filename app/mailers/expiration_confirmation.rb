class ExpirationConfirmation < ApplicationMailer
  default from: 'from@example.com'

  def expiration
    @greeting = ''

    mail to: 'to@example.org'
  end
end
