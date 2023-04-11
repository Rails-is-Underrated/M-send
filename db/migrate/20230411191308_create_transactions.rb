class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.integer :sender_id, null: false
      t.integer :recipient_id, null: false
      t.float :amount, null: false
      t.string :transaction_type, null: false

      t.timestamps
    end
  end
end
