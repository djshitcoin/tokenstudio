class CreateWithdrawals < ActiveRecord::Migration[5.2]
  def change
    create_table :withdrawals do |t|
      t.string :asset_id
      t.integer :user_id
      t.string :receiver_address
      t.string :sender_address, comment: 'If this is empty, it means that the transaction is sent from some hot wallet'
      t.string :transaction_id, comment: 'This is the hash of the transaction'
      t.timestamp :submitted_at, comment: 'The time when the transaction was submitted to the blockchain'
      t.decimal :amount, precision: 50, scale: 20
      t.string :status
      t.integer :tries, default: 0
      t.string :error
      t.timestamp :error_at
      t.string :signed_transaction, comment: 'The signed (raw) transaction in hex that can be submitted to the blockchain'
      t.integer :mined_block
      
      t.index :asset_id
      t.index :user_id
      t.index :transaction_id
      
      t.timestamps
    end
  end
end
