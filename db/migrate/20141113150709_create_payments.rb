class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :document_id
      t.boolean :is_payment_with_signature
      t.float :payment_amount
      t.integer :signer_id

      t.timestamps
    end
  end
end
