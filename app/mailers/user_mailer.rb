class UserMailer < ApplicationMailer
  default from: "M-send <no-reply@m-send.com>"

  def confirmation_email(user, amount)
    @user = user
    @amount = amount 
    @url  = 'http://m-send.com/login'
    
    mail to: @user.email, subject: "Confirmation Email"
  end
end
