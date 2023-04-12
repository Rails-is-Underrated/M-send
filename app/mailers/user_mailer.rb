class UserMailer < ApplicationMailer
  default from: "M-send <no-reply@m-send.com>"

  def confirmation_email(user, amount)
    @user = user
    @amount = amount 
    @url  = 'https://m-send.onrender.com/auth/login'
    
    mail to: @user.email, subject: "Confirmation Email"
  end
end
