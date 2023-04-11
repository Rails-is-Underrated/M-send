class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User'

  scope :deposits, -> { where(transaction_type: 'deposit') }
  scope :transfers, -> { where(transaction_type: 'transfer') }
end
