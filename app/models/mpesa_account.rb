class MpesaAccount < ApplicationRecord
  belongs_to :user

  validates :account_number, presence: true, uniqueness: true

  def deposit(amount)
    update(balance: balance + amount)
  end

  def withdraw(amount)
    update(balance: balance - amount)
  end
end
