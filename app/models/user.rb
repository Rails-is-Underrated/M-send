class User < ApplicationRecord
  has_secure_password
  after_create :create_mpesa_account
  has_one :mpesa_account
  has_many :mpesa_payments
  has_many :sent_transactions, class_name: 'Transaction', foreign_key: :sender_id
  has_many :received_transactions, class_name: 'Transaction', foreign_key: :recipient_id
  has_many :notifications, class_name: 'Notification', foreign_key: :recipient_id

  validates_presence_of :name, :email,:phone_number, :password_digest
  validates :phone_number, uniqueness: true
  delegate :balance, :account_number, to: :mpesa_account

  
  private

  def create_mpesa_account
    account_number = 'MP' + rand(10 ** 8).to_s.rjust(8, '0')

    MpesaAccount.find_or_create_by!(account_number: account_number, user_id: id) if mpesa_account.blank?
  end
end
