class MakePaymentsController < ApplicationController

  def create
    amount = params[:amount].to_f
    recipient = User.find_by(email: params[:recipient_email])

    if amount <= 0
      render json: { error: 'Invalid deposit amount' }, status: :bad_request
    elsif recipient.nil?
      render json: { error: 'Recipient not found' }, status: :not_found
    elsif recipient.mpesa_account.nil?
      render json: { error: 'Recipient does not have an Mpesa account' }, status: :bad_request
    else
      ActiveRecord::Base.transaction do
        Transaction.create!(sender: current_user, recipient: recipient, amount: amount, transaction_type: "transfer")
        # check if account is zero.
        current_user.mpesa_account.withdraw(amount)
        recipient.mpesa_account.deposit(amount)
        recipient.notifications.create!(
          action: "#{current_user.email} has transfered : #{amount} to your account.",
          notifiable: current_user
        )
      end

      # send confirmation email

      UserMailer.confirmation_email(recipient, amount).deliver_now


      render json: { message: 'Deposit successful', balance: current_user.mpesa_account.balance }, status: :ok
    end
  end
end
