class ReportMailer < ApplicationMailer

  default from: "M-send <no-reply@m-send.com>"

  def send_report(user, transactions)
    binding.irb
    @user = user
    @transactions = transactions
    @url  = 'http://m-send.com/login'

    mail to: @user.email, subject: "Report Email"
  end
end
