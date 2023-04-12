class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  has_many :notifications, dependent: :destroy, foreign_key: :recipient_id
  scope :deposits, -> { where(transaction_type: 'deposit') }
  scope :transfers, -> { where(transaction_type: 'transfer') }
end
