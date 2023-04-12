class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  has_many :notifications, dependent: :destroy, foreign_key: :recipient_id
  scope :deposits, -> { where(transaction_type: 'deposit') }
  scope :transfers, -> { where(transaction_type: 'transfer') }
  scope :by_user, ->(user_id) { where('sender_id = :user_id OR recipient_id = :user_id', user_id: user_id) }
  scope :within_date_range, ->(start_date, end_date) { where(created_at: start_date..end_date) }
end
