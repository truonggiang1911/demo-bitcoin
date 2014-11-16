class Payment < ActiveRecord::Base
  attr_accessible :document_id, :is_payment_with_signature, :payment_amount, :signer_id,
  	:bitcoin_transaction_id, :bitcoint_receive_address, :bitcoin_order_id, :bitcoin_status_order, :bitcoin_total_btc, :bitcoin_total_native, :bitcoin_total_payout
  belongs_to :document
  belongs_to :user, :class_name => "User", :foreign_key => "signer_id"

end
