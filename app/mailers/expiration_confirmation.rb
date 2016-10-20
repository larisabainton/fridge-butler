class ExpirationConfirmation < ApplicationMailer
  include SendGrid

  def expired_email(grocery)
    @grocery = grocery
    @fridgecategory = @grocery.fridgecategory
    @fridge = @fridgecategory.fridge
    @user = @fridge.user

    mail(
      to: @user.email,
      subject: "Your #{@grocery.name} expires in two days!"
    )
  end
end
