class TransactionsController < ApplicationController
  
  def index
    @transactions = current_user.sent_transactions + current_user.received_transactions
    render json: @transactions.uniq
  end

  # top_ups

  def deposits
    @transactions = current_user.received_transactions.deposits
    render json: @transactions
  end

  # withdraw
  def transfers
    @transactions = current_user.sent_transactions.transfers
    render json: @transactions
  end
end
