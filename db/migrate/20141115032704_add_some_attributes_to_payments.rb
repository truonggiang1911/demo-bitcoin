class AddSomeAttributesToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :bitcoin_transaction_id, :integer, default: 0
    add_column :payments, :bitcoint_receive_address, :string
    add_column :payments, :bitcoin_order_id, :integer, default: 0
    add_column :payments, :bitcoin_status_order, :string
  end
end
