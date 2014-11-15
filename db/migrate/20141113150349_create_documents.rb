class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.float :price, default: 0.0, null: false

      t.timestamps
    end
  end
end
