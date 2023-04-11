class CreateMpesaAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :mpesa_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :account_number, null: false
      t.decimal :balance, precision: 10, scale: 2, default: 0.0
      t.timestamps
    end
  end
end
