class AccountController < ApplicationController

  def balance
    @balance = current_user.mpesa_account.balance
    render json: @balance
  end
end
