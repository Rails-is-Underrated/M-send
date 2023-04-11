class TransactionsController < ApplicationController
  
  def index
    @transactions = current_user.sent_transactions + current_user.received_transactions
    render json: @transactions
  end

  def create
    @transaction = Transaction.new(transaction_params)
    if @transaction.save
      render json: { message: 'Transaction created successfully' }, status: :created
    else
      render json: { errors: @transaction.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  
  def transaction_params
    params.require(:transaction).permit(:sender_id, :recipient_id, :amount)
  end
end
