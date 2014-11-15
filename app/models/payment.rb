class Payment < ActiveRecord::Base
  attr_accessible :document_id, :is_payment_with_signature, :payment_amount, :signer_id
  belongs_to :document
  belongs_to :user, :class_name => "User", :foreign_key => "signer_id"

end
