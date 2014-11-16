class AddSomeTotalPayoutToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :bitcoin_total_btc, :float, default: 0.0
    add_column :payments, :bitcoin_total_native, :float, default: 0.0
    add_column :payments, :bitcoin_total_payout, :float, default: 0.0
  end
end
