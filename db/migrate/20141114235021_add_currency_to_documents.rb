class AddCurrencyToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :currency, :string, default: 'USD', null: false
  end
end
