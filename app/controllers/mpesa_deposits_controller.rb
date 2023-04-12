class MpesaDepositsController < ApplicationController

  def create
    phone_number = params[:phone_number]
    amount = params[:amount]

    # trigger mpesa stk push and check response.
    if amount <= 0
      render json: { error: 'Invalid deposit amount' }, status: :bad_request
    elsif current_user.mpesa_account.nil?
      render json: { error: 'User does not have an Mpesa account' }, status: :bad_request
    else
      ActiveRecord::Base.transaction do
        Transaction.create!(sender: current_user, recipient: current_user, amount: amount, transaction_type: "deposit")
        current_user.mpesa_account.deposit(amount)
      end
      render json: { message: 'Deposit successful', balance: current_user.mpesa_account.balance }, status: :ok
    end
  end
end
